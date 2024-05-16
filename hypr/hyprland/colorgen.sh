#!/bin/bash

counter=0
output=$(schemer2 -format img::colors -in ~/pictures/wallpaper)
kittyoutput=$(schemer2 -minBright 70 -format img::kitty -in ~/pictures/wallpaper)
echo "#vim: set ft=conf:" > ~/.config/hypr/hyprland/colors.conf
echo "$output" | while read -r p; do
  counter=$((counter+1))
  echo "\$color${counter} = rgba(${p:1}ff) $p" >> ~/.config/hypr/hyprland/colors.conf
  if [ $counter == 16 ]; then
    sed -i "s/COLOR (#\w\{6\}/COLOR ($p/" ~/.config/glava/bars.glsl
    # pkill glava; nohup glava --desktop &>/dev/null &!
  fi
done

counter=0
echo "#vim: set ft=conf:" > ~/.config/kitty/kittycolors.conf
echo "$kittyoutput" | while read -r p; do
  counter=$((counter+1))
  echo "$p" >> ~/.config/kitty/kittycolors.conf
  if [ $counter == 15 ]; then
    h=$(echo $p | sed "s/color\w\{1,2\}/color0/")
    sed -i "s/color0.*/$h/" ~/.config/kitty/kittycolors.conf
  fi
done
