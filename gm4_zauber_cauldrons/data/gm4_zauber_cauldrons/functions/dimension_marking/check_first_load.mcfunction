# @s = player who changed dimensions
# run from init and advancement "dimension_marking"

advancement revoke @s only gm4_zauber_cauldrons:dimension_marking

# spawns a dimension marker if one doesn't already exist in the dimension
execute unless entity @e[type=minecraft:area_effect_cloud,tag=gm4_dimension_marker,distance=0..] run function gm4_zauber_cauldrons:dimension_marking/mark_dimension
