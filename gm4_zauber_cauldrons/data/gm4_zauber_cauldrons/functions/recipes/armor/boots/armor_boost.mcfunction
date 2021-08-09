# @s = boiling zauber cauldron with enchanted prismarine shard, golden boots and eye of ender  inside
# at center of block
# run from recipe/armor/boots/apply_modifier

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# set blueprint
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/attribute/armor_boost CustomModelData set value 5

# summon item
loot spawn ~ ~.1 ~ loot gm4_zauber_cauldrons:recipes/armor/boots/armor_boost

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
