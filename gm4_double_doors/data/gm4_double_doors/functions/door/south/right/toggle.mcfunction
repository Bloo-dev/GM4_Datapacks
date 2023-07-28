# Toggles the double door the player has interacted with.
# @s = player that interacted with a door
# at location of the lower half of the left door of the double door the player has interacted with
# run from check_neighbours functions in gm4_double_doors:door/...

# player just closed a door
execute if score $target_door_state gm4_double_doors_data matches 0 run place template gm4_double_doors:door/oak/south/right/closed ~ ~ ~

# player just opened a door
execute if score $target_door_state gm4_double_doors_data matches 1 run place template gm4_double_doors:door/oak/south/right/open ~ ~ ~

# get target trapdoor state (0->0, 1->1 for this direction)
execute store result score $target_trapdoor_state gm4_double_doors_data if score $target_door_state gm4_double_doors_data matches 1

# check for potential trapdoors which should also be opened
scoreboard players operation $trap_door_recursion_level gm4_double_doors_data = $trap_door_limit gm4_double_doors_data
execute positioned ~ ~2 ~ if block ~ ~ ~ #minecraft:trapdoors[open=true,half=bottom] unless block ~ ~ ~ #minecraft:trapdoors[facing=west] unless block ~ ~ ~ #minecraft:trapdoors[facing=north] run function gm4_double_doors:trapdoor/south_east/check_neighbours