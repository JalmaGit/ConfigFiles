#!/bin/bash

WORK_DIR="${PWD}"


echo "Configuring folder structure"

sleep 2

mkdir -p ${HOME}/GitHub
mkdir -p ${HOME}/PythonEnv
mkdir -p ${HOME}/PythonEnv/General
mkdir -p ${HOME}/KiCad
mkdir -p ${HOME}/Programs

echo "Starting with installation"

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y gcc g++ make automake cmake linux-headers-$(uname -r) \
                    rust-1.91-all \
                    git vim neovim wget \
                    python3-dev \
                    steam \
                    mono-xbuild golang nodejs npm \
                    clang-format clang-tidy clangd black cmake-format shfmt

sudo update-alternatives --install /usr/bin/cargo cargo /usr/bin/cargo-1.91 100
sudo update-alternatives --install /usr/bin/rustc rustc /usr/bin/rustc-1.91 100

sudo apt remove -y $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)

# Add Docker's official GPG key:
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo docker run hello-world

sudo add-apt-repository ppa:kicad/kicad-9.0-releases -y
sudo apt update
sudo apt install kicad -y

wget "https://github.com/bambulab/BambuStudio/releases/download/v02.05.00.67/Bambu_Studio_ubuntu-24.04_PR-9540.AppImage" -P ${HOME}/Programs/

curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install 0xProto
echo 'eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/rudolfs-dark.omp.json)"' >> ${HOME}/.bashrc

cargo install --locked typst-cli
echo 'export PATH="$PATH:${HOME}/.cargo/bin"' >> $HOME/.bashrc

echo "Moving config files"

echo "kitty..."
mkdir -p ${HOME}/.config/kitty
cp -r files/kitty/ ${HOME}/.config/

echo ".vimrc..."
cp files/.vimrc ${HOME}/
cp files/coc-settings.json ${HOME}/.vim/
vim +PluginInstall +qall


echo "python venv..."
VENV_PATH="${HOME}/PythonEnv/General"
python3 -m venv "${VENV_PATH}"
$VENV_PATH/bin/pip install --upgrade pip
$VENV_PATH/bin/pip install -r files/python/requirements.txt


echo "Installation Complete"
