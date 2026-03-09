#!/bin/bash


WORK_DIR="${PWD}"

echo "Configuring folder structure"

mkdir -p ${HOME}/GitHub
mkdir -p ${HOME}/PythonEnv
mkdir -p ${HOME}/PythonEnv/General
mkdir -p ${HOME}/KiCad
mkdir -p ${HOME}/Programs

echo "Starting with installation"

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y gcc g++ make automake cmake linux-headers-$(uname -r) \
                    rustc cargo rustfmt clippy rust-src \
                    git vim neovim wget \
                    python3-dev \
                    steam discord \
                    mono-xbuild golang nodejs npm

curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install 0xProto
echo 'eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/rudolfs-dark.omp.json)"' >> ${HOME}/.bashrc


