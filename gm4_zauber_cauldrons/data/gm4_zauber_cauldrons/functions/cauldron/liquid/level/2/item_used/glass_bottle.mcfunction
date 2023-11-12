# hands handling of the interaction to expansions, or enforces default behavior if no expansion handles the liquid in question
# @s = cauldron that was emptied
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/level/1/reconstruct_interaction

# check if an expansion handles this liquid type being removed via bottle.
# expansions must set the fake player $interaction_intercepted in gm4_zc_data to 1 if they successfully handled the interaction.
# checking to see whether this flag was already set before intercepting an interaction is also recommended to prevent conflicts.
# expansions can check the currently present liquid type via checking for the corrosponding tag on the present item_display (at dx=0).
# the player who has interacted with the cauldron is tagged as gm4_zc_actor and their gamemode is available via the fake player
# $actor_gamemode in gm4_zc_data: 0 = survival or adventure, 1 = creative.
# the previous fill level is available via fake player $previous_fill_level gm4_zc_data.
function #gm4_zauber_cauldrons:player/cauldron_interaction/fill_bottle_from_cauldron

# if no expansion handles this liquid type being removed via bottle, fall back to default behavior:
# reset the cauldron to its previous level and return the bottle to the player
# gamemode doesn't matter in this case
execute unless score $interaction_intercepted gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:cauldron/liquid/level/3/set
execute unless score $interaction_intercepted gm4_zc_data matches 1.. as @a[tag=gm4_zc_actor,limit=1] run function gm4_zauber_cauldrons:cauldron/liquid/level/return_glass_bottle

# reset fake player
scoreboard players reset $interaction_intercepted gm4_zc_data
