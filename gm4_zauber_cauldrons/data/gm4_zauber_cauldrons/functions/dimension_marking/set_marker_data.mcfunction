# @s = new dimension marker AEC
# executed in minecraft:overworld
# run from dimension/mark_dimension

# scoreboard ID
execute store result score #max gm4_dimension if entity @e[tag=gm4_dimension_marker]
scoreboard players operation @s gm4_dimension = #max gm4_dimension

# name
data modify block 29999998 64 7135 Text1 set value '{"nbt": "Dimension", "entity": "@a[tag=gm4_in_new_dimension,limit=1]"}'
data modify entity @s CustomName set from block 29999998 64 7135 Text1 
