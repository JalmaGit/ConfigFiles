#!/bin/bash

echo "Kitty Configs..."
cp -r ${HOME}/.config/kitty/ files/kitty/

echo ".vimrc..."
cp -r ${HOME}/.vimrc files/

echo "gnome-keybinds..."
dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ > files/gnome_shortcuts/custom_keybinds.dconf.bak
dconf dump /org/gnome/desktop/wm/keybindings/ > files/gnome_shortcuts/wm-keybindings.dconf.bak

echo "python \"General\" venv..."
${HOME}/PythonEnv/General/bin/pip freeze > files/python/requirements.txt

