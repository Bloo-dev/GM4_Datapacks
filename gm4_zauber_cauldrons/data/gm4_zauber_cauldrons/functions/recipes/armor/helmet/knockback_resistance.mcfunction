# @s = boiling zauber cauldron with enchanted prismarine shard, golden helmet and eye of ender  inside
# at center of block
# run from recipe/armor/helmet/apply_modifier

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/armor/helmet/knockback_resistance

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
