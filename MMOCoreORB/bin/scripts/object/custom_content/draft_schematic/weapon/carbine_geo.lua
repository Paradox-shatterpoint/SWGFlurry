object_draft_schematic_weapon_carbine_geo = object_draft_schematic_weapon_shared_carbine_geo:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Geonosian Carbine Schematic",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 21, 
   size = 3, 

   xpType = "crafting_weapons_general", 
   xp = 190, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"frame_assembly", "receiver_assembly", "grip_assembly", "powerhandler", "barrel", "scope", "stock"},
   ingredientSlotType = {0, 0, 0, 1, 1, 3, 3},
   resourceTypes = {"aluminum_linksteel", "metal_nonferrous", "metal", "object/tangible/component/weapon/shared_blaster_power_handler.iff", "object/tangible/component/weapon/shared_blaster_rifle_barrel.iff", "object/tangible/component/weapon/shared_scope_weapon.iff", "object/tangible/component/weapon/shared_stock.iff"},
   resourceQuantities = {50, 30, 12, 3, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100},
   ingredientAppearance = {"", "", "", "", "muzzle", "scope", "stock"},


   targetTemplate = "object/weapon/ranged/carbine/carbine_geo.iff",

   additionalTemplates = {
             }

}

ObjectTemplates:addTemplate(object_draft_schematic_weapon_carbine_geo, "object/draft_schematic/weapon/carbine_geo.iff")
