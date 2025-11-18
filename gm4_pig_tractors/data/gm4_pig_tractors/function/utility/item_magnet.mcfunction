# Teleports nearby items to the player
# @s = item to be teleported to player
# at location of player on a pig tractor
# run from functions in gm4_pig_tractors:harvest/block/ and gm4_pig_tractors:till/block/

# decrease pickup delay
data modify entity @s PickupDelay set value 0

# teleport items
tp @s ~ ~ ~
