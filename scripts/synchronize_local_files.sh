#!/bin/bash

git pull

echo "gnome-keybinds..."
dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ < files/gnome_shortcuts/custom_keybinds.dconf.bak
dconf load /org/gnome/desktop/wm/keybindings/ < files/gnome_shortcuts/wm-keybindings.dconf.bak


echo "kitty..."
mkdir -p ${HOME}/.config/kitty
cp -r files/kitty/ ${HOME}/.config/


echo ".vimrc..."
cp files/.vimrc ${HOME}/
vim +PluginInstall +qall

if [[ ! -d ${HOME}/.vim/bundle/YouCompleteMe ]]; then
	WORK_DIR="${PWD}"
	cd ${HOME}/.vim/bundle/YouCompleteMe
	./install.py --all
	cd ${WORK_DIR}
	vim +PluginInstall +qall
fi


echo "python venv..."
VENV_PATH="${HOME}/PythonEnv/General"
$VENV_PATH/bin/pip install --upgrade pip
$VENV_PATH/bin/pip install -r files/python/requirements.txt 

