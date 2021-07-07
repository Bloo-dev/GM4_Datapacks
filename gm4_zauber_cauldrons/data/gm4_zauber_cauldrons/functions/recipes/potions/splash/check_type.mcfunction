# @s = boiling zauber cauldron with prismarine crystals, golden apple and a splash potion inside
# at @s align xyz
# run from recipes/potions/splash/check_liquid

# check which potion type to craft
execute if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_harming"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/instant_damage
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_healing"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/instant_health
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_leaping"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/jump_boost
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_poison"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/poison
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_regeneration"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/regeneration
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_swiftness"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/speed
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_strength"}}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/drinkable/strength
