# @s = player who entered a new dimension
# run from advancement "dimension_marking" and function "init"

# forceload chunk if not already loaded
# 1.16 Reminder Note : Setup forceloaded chunk
forceload add 29999999 7134

# spawn dimension marker
summon minecraft:area_effect_cloud 29999998 64 7134 {Radius:0,Age:-2147483648,Duration:2147483648,CustomName:'"gm4_dimension"',Tags:["gm4_dimension_marker","gm4_new_dimension"],Particle:"block air"}

# give dimension marker a scoreboard ID and name
tag @a[limit=1,distance=0..] add gm4_in_new_dimension
execute as @e[type=area_effect_cloud,tag=gm4_new_dimension,limit=1] in minecraft:overworld run function gm4_zauber_cauldrons:dimension_marking/set_marker_data

# remove new dimension tag
tag @a remove gm4_in_new_dimension
tag @e[type=area_effect_cloud] remove gm4_new_dimension
