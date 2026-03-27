#!/bin/bash

git pull

if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
	echo "Syncronizing local gnome-keybinds..."
	dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ > files/gnome_shortcuts/custom_keybinds.dconf.bak
	dconf dump /org/gnome/desktop/wm/keybindings/ > files/gnome_shortcuts/wm-keybindings.dconf.bak
else
	echo "Gnome not found..."
fi


echo "kitty..."
mkdir -p ${HOME}/.config/kitty
cp -r files/kitty/ ${HOME}/.config/


echo ".vimrc..."
cp files/.vimrc ${HOME}/
cp files/coc-settings.json ${HOME}/.vim/

vim +PlugInstall +qall

echo "python venv..."
VENV_PATH="${HOME}/PythonEnv/General"
$VENV_PATH/bin/pip install --upgrade pip
$VENV_PATH/bin/pip install -r files/python/requirements.txt 

