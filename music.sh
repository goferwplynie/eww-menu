#!/bin/bash

metadata=$(playerctl metadata --player=spotify --format '{{mpris:artUrl}}|{{title}}|{{artist}}')

IFS='|' read -r url title artist <<< "$metadata"

temp_image="/tmp/current-song-image.jpg"

if [[ -n "$url" ]]; then
  curl -s -o "$temp_image" "$url"
fi

echo "{\"url\":\"$temp_image\", \"title\":\"$title\", \"artist\":\"$artist\"}"

