# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from count_chorus

# kill remaining items
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon wormhole
loot spawn ~ ~.1 ~ loot gm4_zauber_cauldrons:recipes/chorus/wormhole

# cosmetics
execute at @s run particle minecraft:witch ~ ~.3 ~ .1 .1 .1 1 17
execute at @s run playsound minecraft:entity.ender_eye.death master @a[distance=..8] ~ ~ ~ 0.6 .2

# add oversized stacks to cauldron fullness to summon vexes
scoreboard players operation @s gm4_zc_fullness += $raw_chorus_fullness gm4_zc_chorus
scoreboard players operation @s gm4_zc_fullness += $popped_chorus_fullness gm4_zc_chorus

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
