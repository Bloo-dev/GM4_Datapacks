# selects the material of the toggle marker in question
# @s = marker entity with the gm4_double_doors_auto_toggle_marker tag
# at @s align xyz
# run from gm4_double_doors:auto_toggle_marker/maintain

# load target state from marker (this was stored when the door was opened by a player and therefore stores the state the door should be returned to)
execute store result score $target_door_state gm4_double_doors_data run data get entity @s data.gm4_double_doors.target_door_state

# check if desired target door state was already achieved (this can happen if the door was triggered by redstone or sneak-clicked by the player)
# if so, i.e. if a $target_door_state 0 [1] (to be closed [opened]) marker is already in a a closed [open] door or a non-door block, return
execute if score $target_door_state gm4_double_doors_data matches 0 unless block ~ ~ ~ #minecraft:doors[open=true] run return 0
execute if score $target_door_state gm4_double_doors_data matches 1 unless block ~ ~ ~ #minecraft:doors[open=false] run return 0

# set flag which marks this toggle action as being executed via an auto toggle marker
scoreboard players set $triggered_by_auto_toggle gm4_double_doors_data 1

# TODO the auto toggle still activates even if the player manually toggled the door already, i.e. if an autotoggle is scheduled to close a door but the door was already closed manually the door closing sound still plays on the auto toggle. This is an issue.

for material_name in ctx.meta['wood_types']:
    execute unless score $toggled_door gm4_double_doors_data matches 1.. if entity @s[tag=f"gm4_double_doors_{material_name}"] run function f"gm4_double_doors:{material_name}/door/get_facing"
    execute if score $play_sound gm4_double_doors_data matches 1 if score $target_door_state gm4_double_doors_data matches 0 run playsound ctx.meta['sound_ids'][material_name].close block @a[distance=..16] ~ ~ ~
    execute if score $play_sound gm4_double_doors_data matches 1 if score $target_door_state gm4_double_doors_data matches 1 run playsound ctx.meta['sound_ids'][material_name].open block @a[distance=..16] ~ ~ ~
    execute if score $play_sound gm4_double_doors_data matches 1 run scoreboard players reset $play_sound gm4_double_doors_data

scoreboard players reset $toggled_door gm4_double_doors_data
scoreboard players reset $triggered_by_auto_toggle gm4_double_doors_data
