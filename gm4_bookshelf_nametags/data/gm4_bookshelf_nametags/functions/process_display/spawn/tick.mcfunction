# text_display extending tick clock
# @s = unspecified
# at unspecified
# schedule from process_display/spawn/init
# schedule from here

scoreboard players set $keep_loop_active gm4_bookshelf_nametags_data 0

execute as @e[type=text_display,tag=gm4_bookshelf_nametags_display.extending] store success score $keep_loop_active gm4_bookshelf_nametags_data run function gm4_bookshelf_nametags:process_display/spawn/process

execute if score $keep_loop_active gm4_bookshelf_nametags_data matches 1 run schedule function gm4_bookshelf_nametags:process_display/spawn/tick 1t
