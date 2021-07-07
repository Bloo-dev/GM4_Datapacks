# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/drinkable

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item (depending on red/blue fire)
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/potions/drinkable/strength

# visuals
function gm4_zauber_cauldrons:recipes/potions/environmental_effects/strength

# set flag
scoreboard players set $recipe_success gm4_zc_data 1