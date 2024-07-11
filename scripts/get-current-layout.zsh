LAYOUT=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[1].xkb_active_layout_name' | sed 's/"//g')

if [[ $(echo $LAYOUT| tr '[:upper:]' '[:lower:]') == *"french"* ]]; then
  echo 󰌌 $LAYOUT 🇫🇷
else
  echo 󰌌 $LAYOUT
fi
