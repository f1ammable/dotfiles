/usr/bin/python3 ~/.config/waybar/mediaplayer.py --player psst | jq '.text |= sub("^(\uf144|\uf28b)\\s*"; "")'
