#!/bin/bash

echo "Fetching local kitty configs..."
cp -r ${HOME}/.config/kitty/ files/

echo "Fetching local .vimrc..."
cp -r ${HOME}/.vimrc files/

if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
	echo "Fetching local gnome-keybinds..."
	dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ > files/gnome_shortcuts/custom_keybinds.dconf.bak
	dconf dump /org/gnome/desktop/wm/keybindings/ > files/gnome_shortcuts/wm-keybindings.dconf.bak
else
	echo "Gnome not found..."
fi

echo "Fetching local python \"General\" venv..."
${HOME}/PythonEnv/General/bin/pip freeze > files/python/requirements.txt

