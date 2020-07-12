# @s = marker area effect cloud
# at location of player consuming wormhole_bottle
# run from player/wormhole_targeting/prepare_teleport

# teleport marker to stored coordinates
execute store result entity @s Pos[0] double 1 run scoreboard players get wormhole_x gm4_zc_data
execute store result entity @s Pos[1] double 1 run scoreboard players get wormhole_y gm4_zc_data
execute store result entity @s Pos[2] double 1 run scoreboard players get wormhole_z gm4_zc_data

# teleport marker and player to correct dimension
# 1.16 Note: dimension checking fixed by BPR, custom dimensions supported 
execute as @e[tag=gm4_dimension_marker] if score @s gm4_dimension = wormhole_d gm4_zc_data run tag @s add gm4_zc_targeted_dimension
execute at @e[type=area_effect_cloud,tag=gm4_zc_targeted_dimension,limit=1] positioned as @s run function gm4_zauber_cauldrons:player/wormhole_targeting/set_dimension

# remove "new" tag from marker
tag @e[type=area_effect_cloud,tag=gm4_dimension_marker] remove gm4_zc_targeted_dimension
tag @s remove gm4_zc_new_wormhole_target
