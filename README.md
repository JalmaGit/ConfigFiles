# Config and Autosetup for Linux

This repo contains scripts for auto setup and configuration of linux distroes

## Fetch Local Files and Syncronize

Running `source run.sh fetch` will auto fetch local config files, while running `source run.sh sync` will syncronize local files with the ones in the repo.

**NOTE:** Before fetching and pushing to remote, either create new branch or pull from remote.

## Autosetup

The script will autoinstall a bunch of programs and configure the system how I like it. This means that currently the only supported linux distros are the following:

- Fedora 43
- Ubuntu 22.04 (Comming Soon)
- Ubuntu 24.04 (Comming Soon)
- Mint 22.x (Comming Soon)

Whilst the following is a list of the most important software installed and configurations added:

- Programming languages such as: GCC, Rust, Python
- Programming tools such as: CMAKE, MAKE, Cargo
- Development tools such as: VIM, NEOVIM, KITTY
- Steam
- Discord

