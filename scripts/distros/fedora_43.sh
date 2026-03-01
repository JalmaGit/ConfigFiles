#!/bin/bash

echo "Starting with installation"
sleep 0.5

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update -y

sudo dnf install -y gcc g++ make automake cmake kernel-devel \
										rust cargo rustfmt clippy rust-src \
										git vim vim-default-editor neovim \
										python3-devel \
										steam discord \
										xbuild go node npm \

sudo dnf install -y akmod-nvidia-open
sudo dnf install -y xorg-x11-drv-nvidia-cuda

sudo dnf install -y kitty
curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install 0xProto
echo 'eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/rudolfs-dark.omp.json)"' >> ~/.bashrc 

sudo dnf remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo -y
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo docker run hello-world

echo "Configuring folder structure"

mkdir -p ${HOME}/GitHub
mkdir -p ${HOME}/PythonEnv
mkdir -p ${HOME}/PythonEnv/General


echo "Moving config files"

echo "kitty..."
mkdir -p ${HOME}/.config/kitty
cp -r files/kitty/* ${HOME}/.config/kitty/

echo ".vimrc..."
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
cp files/.vimrc ${HOME}/
vim +PluginInstall +qall

WORK_DIR="${PWD}"
cd ${HOME}/.vim/bundle/YouCompleteMe
./install.py --all
cd ${WORK_DIR}
vim +PluginInstall +qall

echo "gnome-keybinds..."
dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ < files/gnome_shortcuts/custom_keybinds.dconf.bak
dconf load /org/gnome/desktop/wm/keybindings/ < files/gnome_shortcuts/wm-keybindings.dconf.bak

echo "python venv..."
VENV_PATH="${HOME}/PythonEnv/General"
python -m venv "${VENV_PATH}"
$VENV_PATH/bin/pip install --upgrade pip
$VENV_PATH/bin/pip install -r files/python/requirements.txt 


echo "Installation Complete"
