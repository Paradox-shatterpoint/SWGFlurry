object_draft_schematic_clothing_clothing_armor_spy_leggings = object_draft_schematic_clothing_shared_clothing_armor_spy_leggings:new {
templateType = DRAFTSCHEMATIC,

   customObjectName = "Spy Armor Leggings",

   craftingToolTab = 2, -- (See DraftSchemticImplementation.h)
   complexity = 45, 
   size = 1, 

   xpType = "crafting_clothing_armor", 
   xp = 1166, 

   assemblySkill = "armor_assembly", 
   experimentingSkill = "armor_experimentation", 
   customizationSkill = "armor_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"auxilary_coverage", "body", "liner", "hardware_and_attachments", "binding_and_reinforcement", "padding", "armor", "load_bearing_harness", "reinforcement"},
   ingredientSlotType = {0, 0, 0, 0, 0, 0, 1, 1, 1},
   resourceTypes = {"armophous_vendusii", "fuel_petrochem_solid_known", "fiberplast_talus", "aluminum_chromium", "copper_platinite", "hide_wooly_rori", "object/tangible/component/armor/shared_armor_segment_ris.iff", "object/tangible/component/clothing/shared_synthetic_cloth.iff", "object/tangible/loot/misc/artifact_rare_s01.iff"},
   resourceQuantities = {175, 100, 85, 70, 40, 40, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/armor/spy/armor_spy_leggings.iff",

   additionalTemplates = {
             }
}

ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_armor_spy_leggings, "object/draft_schematic/clothing/clothing_armor_spy_leggings.iff")