# @s = heated water zauber cauldron with {{color}} magicol recipe inside
# at @s (center of block)
# run from recipes/magicol/select_color

# templates/functions/magicol/craft_magicol.mcfunction

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon empty bottle
summon minecraft:item ~ ~.2 ~ {Item:{id:"minecraft:glass_bottle",Count:1b}}

# set cauldron liquid to magicol
# set level
execute if block ~ ~ ~ minecraft:water_cauldron[level=1] run scoreboard players set @s gm4_zc_liquid_level 1
execute if block ~ ~ ~ minecraft:water_cauldron[level=2] run scoreboard players set @s gm4_zc_liquid_level 2
execute if block ~ ~ ~ minecraft:water_cauldron[level=3] run scoreboard players set @s gm4_zc_liquid_level 3
# set liquid type
data modify entity @s data.gm4_zauber_cauldrons.liquid set value {id:"magicol",magicol:{color:"{{color}}"}}

# visuals
summon minecraft:item_display ~ ~.0781 ~ {item:{id:"minecraft:{{color}}_concrete_powder",Count:1b},item_display:"fixed",transformation:[1.984f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1.984f,0f,0f,0f,0f,1f],Tags:["gm4_zc_liquid","gm4_zc_magicol","gm4_zc_{{color}}_magicol"]}
execute align xyz run function gm4_zauber_cauldrons:cauldron/liquid/update/from_score

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
