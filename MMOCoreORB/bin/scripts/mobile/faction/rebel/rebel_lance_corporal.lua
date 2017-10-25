rebel_lance_corporal = Creature:new {
	objectName = "@mob/creature_names:rebel_lance_corporal",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "rebel",
	faction = "rebel",
	level = 15,
	chanceHit = 0.31,
	damageMin = 160,
	damageMax = 170,
	baseXp = 831,
	baseHAM = 2400,
	baseHAMmax = 3000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_rebel_lance_corporal_human_female_01.iff",
		"object/mobile/dressed_rebel_lance_corporal_human_male_01.iff",
		"object/mobile/dressed_rebel_lance_corporal_moncal_female_01.iff",
		"object/mobile/dressed_rebel_lance_corporal_rodian_male_01.iff",
		"object/mobile/dressed_rebel_lance_corporal_twk_female_01.iff",
		"object/mobile/dressed_rebel_lance_corporal_twk_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 9000000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000},					
			},
			lootChance = 10000000 
			},
			{
			groups = {
				{group = "g_imperial_credit", chance = 10000000},
				},
			lootChance = 20000 
			},
			{
			groups = {
				{group = "artifact", chance = 10000000}			
			},
			lootChance = 1000000
			},
			{
			groups = {
				{group = "tierone", chance = 10000000}
			},
			lootChance = 750000
			},
			{
			groups = {
				{group = "tiertwo", chance = 10000000}
			},
			lootChance = 100000
			},
			{
			groups = {
				{group = "tierthree", chance = 10000000}
			},
			lootChance = 50000
			},
			{
			groups = {
				{group = "imppoints", chance = 10000000},
				},
			lootChance = 100000 
			}
	},
	weapons = {"rebel_weapons_light"},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",
	personalityStf = "@hireling/hireling_military",
	attacks = merge(brawlermid,marksmanmid)
}

CreatureTemplates:addCreatureTemplate(rebel_lance_corporal, "rebel_lance_corporal")
