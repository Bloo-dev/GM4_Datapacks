# @s = none
# at world spawn
# scheduled by player/multi_use_bottle/cache/populate

# restore original context and start multi use code - unless there is only one use left
execute as @a[predicate=gm4_zauber_cauldrons:player/advancement/use/multi_use_bottle] at @s run function gm4_zauber_cauldrons:player/multi_use_bottle/cache/load
