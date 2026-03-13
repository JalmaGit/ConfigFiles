# Config and Autosetup for Linux

This repo contains scripts for auto setup and configuration of linux distroes

The main text editor used is Vim, alongside kitty as the terminal emulator. This means that inbetween systems the most important files to syncronize are vim, kitty and python.

## Fetch Local Files and Syncronize

Running `source run.sh fetch` will auto fetch local config files, while running `source run.sh sync` will syncronize local files with the ones in the repo.

**NOTE:** Before fetching and pushing to remote, either create new branch or pull from remote.

## Autosetup

The goal of this part of the script is to be able to automaticlay setup and configure a new system install the way I like it. simply run `source run.sh setup` and it will automatically setup the new system

Supported distroes for automatic install and setup of software is the following,

- Fedora 43
- Ubuntu 24.04
- Mint 22.x 
- Ubuntu 22.04 (Comming Soon)

Whilst the following is a list of the most important software installed and configurations added:

- Programming languages such as: GCC, Rust, Python
- Programming tools such as: CMAKE, MAKE, Cargo
- Development tools such as: VIM, NEOVIM, KITTY
- Steam
- Discord

