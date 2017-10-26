local ObjectManager = require("managers.object.object_manager")

rori_xptick = ScreenPlay:new {
  numberOfActs = 1,
  questString = "rori_xptick",
  states = {onleave = 1, overt = 2},
  questdata = Object:new {
    activePlayerName = "initial",
  },
  tickTime = 5 * (60 * 1000), -- Pulse xp every 5 minutes
  tickXpAmount = 200, -- Amount of xp to pulse
  xpTimeRequirement = 30 * 60, -- Must earn xp in the active area at least every 30 mins to be eligible for tick  
}
  
registerScreenPlay("rori_xptick", true)
  
function rori_xptick:start()
      self:spawnActiveAreas()
--      self:spawnSceneObjects()
      self:spawnMobiles()
end

function rori_xptick:spawnMobiles()
 --   spawnMobile("rori", "dark_jedi_sentinel",1, 4325,7,-5097,0,0)
end
  
function rori_xptick:spawnActiveAreas()
  local pSpawnArea = spawnSceneObject("rori", "object/active_area.iff", 5283, 82, 6003, 0, 0, 0, 0, 0)
    
  if (pSpawnArea ~= nil) then
    local activeArea = LuaActiveArea(pSpawnArea)
          activeArea:setCellObjectID(0)
          activeArea:setRadius(30)
          createObserver(ENTEREDAREA, "rori_xptick", "notifySpawnAreaEnter", pSpawnArea)
          createObserver(EXITEDAREA, "rori_xptick", "notifySpawnAreaLeave", pSpawnArea)
      end
end
 
--checks if player enters the zone, and what to do with them.
function rori_xptick:notifySpawnAreaEnter(pActiveArea, pMovingObject)
  if (not SceneObject(pMovingObject):isCreatureObject()) then
    return 0
  end

	return ObjectManager.withCreatureObject(pMovingObject, function(player)
		if (player:isAiAgent()) then
			return 0
		end 

		if (player:isImperial() or player:isRebel()) then
			createEvent(1, "rori_xptick", "handleTickZone", pMovingObject)
			player:sendSystemMessage("You have entered the accellerated GCW XP tick area")
		else
			player:sendSystemMessage("You must be Rebel or Imperial to enter the PvP zone!")
			player:teleport(5279, 78, 6071, 0)
		end
		return 0
	end)
end

--checks if player leaves the zone, and what to do with them.
function rori_xptick:notifySpawnAreaLeave(pActiveArea, pMovingObject)
  if (not SceneObject(pMovingObject):isCreatureObject()) then
    return 0
  end
  
  return ObjectManager.withCreatureObject(pMovingObject, function(player)
    if (player:isAiAgent()) then
      return 0
    end

    writeData(player:getObjectID() .. ":rori_withinTickArea", 0);
    
    dropObserver(XPAWARDED, "rori_xptick", "xpAwardedEventHandler", player)
    dropObserver(LOGGEDOUT, "rori_xptick", "loggedOutEventHandler", player) 
        
 -- Could separate out by faction and deliver alternate exit points.  
    if (player:isInCombat()) then
        player:sendSystemMessage("You are now out of range of the GCW XP tick")
    end           
    return 0
  end)
end

--Handles the setting of factional status
function rori_xptick:handleTickZone(pPlayer)
  ObjectManager.withCreatureAndPlayerObject(pPlayer, function(player, playerObject)
    deleteData(player:getObjectID() .. ":changingFactionStatus")
    if (playerObject:isCovert() or playerObject:isOnLeave()) then
      playerObject:setFactionStatus(2)
    end
    
    writeData(player:getObjectID() .. ":rori_withinTickArea", 1)

    -- TODO: This is exploitable right now.  Technically you can step in and out of the 
    -- active area and reset your timer in order to keep getting xp.  This will be 
    -- addressed in the next update of this screenplay.
    writeData(player:getObjectID() .. ":rori_lastXpEarnedTime", getTimestamp())
    
    createObserver(XPAWARDED, "rori_xptick", "xpAwardedEventHandler", pPlayer)
    createObserver(LOGGEDOUT, "rori_xptick", "loggedOutEventHandler", pPlayer)
   
    if not (readData(player:getObjectID() .. ":rori_xpTickEventScheduled") == 1) then
      writeData(player:getObjectID() .. ":rori_xpTickEventScheduled", 1)
      createEvent(self.tickTime, "rori_xptick", "handleXpTick", pPlayer)
    end
  end)
end

--Handles the ticking of xp while within the area
function rori_xptick:handleXpTick(pPlayer)
  ObjectManager.withCreatureAndPlayerObject(pPlayer, function(player, playerObject)
    local curTime = getTimestamp()
    local lastTime = readData(player:getObjectID() .. ":rori_lastXpEarnedTime");
    local timeDiff = curTime - lastTime
  
    writeData(player:getObjectID() .. ":rori_xpTickEventScheduled", 0)
  
    if (readData(player:getObjectID() .. ":rori_withinTickArea") == 1) then
      if ((timeDiff <= self.xpTimeRequirement) and playerObject:isOnline()) then
        dropObserver(XPAWARDED, "rori_xptick", "xpAwardedEventHandler", pPlayer)
        playerObject:addExperience("gcw_skill_xp", self.tickXpAmount, true)
        createObserver(XPAWARDED, "rori_xptick", "xpAwardedEventHandler", pPlayer)
      end
      
      createEvent(self.tickTime, "rori_xptick", "handleXpTick", pPlayer)
      writeData(player:getObjectID() .. ":rori_xpTickEventScheduled", 1)
    end
  end)
end
  
-- Event handler for the XPAWARDED event.
-- @param pObject pointer to the creature object of the player who was awarded xp
-- @param pCreatureObject pointer to the creature object of the player who was awarded xp
-- @param xpAmount the amount of xp earned
-- @return 0 to keep the observer active.
function rori_xptick:xpAwardedEventHandler(pObject, pCreatureObject, xpAmount)
  if (pCreatureObject == nil) then
    return 0
  end
  
  return ObjectManager.withCreatureObject(pCreatureObject, function(player)
    if (readData(player:getObjectID() .. ":rori_withinTickArea") == 0) then
      return 1
    end
    
    writeData(player:getObjectID() .. ":rori_lastXpEarnedTime", getTimestamp());
    
    return 0
  end)
end

function rori_xptick:loggedOutEventHandler(pCreatureObject)
  if (pCreatureObject == nil) then
    return 1
  end
  
  return ObjectManager.withCreatureObject(pCreatureObject, function(player)
    if (readData(player:getObjectID() .. ":rori_withinTickArea") == 1) then
      player:teleport(5279, 78, 6071, 0)
    end
      
    return 1
  end)
end