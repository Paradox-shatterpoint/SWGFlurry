--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

pistol_sr_combat = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/weapon/ranged/pistol/pistol_srcombat.iff",
	craftingValues = {
		{"mindamage",75,100,0},
		{"maxdamage",175,185,0},
		{"attackspeed",5.7,4.3,0},
		{"woundchance",6,13,0},
		{"hitpoints",750,750,0},
		{"attackhealthcost",36,20,0},
		{"attackactioncost",54,29,0},
		{"attackmindcost",23,12,0},
		{"roundsused",5,20,0},
		{"zerorangemod",0,10,0},
		{"maxrangemod",-80,-80,0},
		{"midrange",12,12,0},
		{"midrangemod",-20,-20,0},
	},
	customizationStringNames = {},
	customizationValues = {},

	-- randomDotChance: The chance of this weapon object dropping with a random dot on it. Higher number means less chance. Set to 0 to always have a random dot.
	randomDotChance = 100,
	junkDealerTypeNeeded = JUNKARMS,
	junkMinValue = 25,
	junkMaxValue = 45

}

addLootItemTemplate("pistol_sr_combat", pistol_sr_combat)
