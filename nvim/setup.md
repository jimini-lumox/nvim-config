Clangd:
```
mkdir -p ~/packages/
cd ~/packages

wget --no-check-certificate https://github.com/clangd/clangd/releases/download/16.0.2/clangd-linux-16.0.2.zip
wget --no-check-certificate https://github.com/clangd/clangd/releases/download/16.0.2/clangd_indexing_tools-linux-16.0.2.zip
unzip clangd_indexing_tools-linux-16.0.2.zip
unzip -o clangd-linux-16.0.2.zip
```

Fonts:
```sh
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/IBMPlexMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/DejaVuSansMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/BitstreamVeraSansMono.zip

unzip -d ~/.local/share/fonts/ IBMPlexMono.zip
unzip -d ~/.local/share/fonts/ DejaVuSansMono.zip
unzip -d ~/.local/share/fonts/ BitstreamVeraSansMono.zip
# update fontcache
fc-cache -f -v
```

TODO get & install nvim-linux64-tar.gz from its repo

```sh
mkdir -p ~/packages/
cd ~/packages
wget --no-check-certificate https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz -C ~/
rsync -crvl ~/nvim-linux64/ ~/.local/
# Add ~/.local/bin to ~/.bashrc
## export PATH="$HOME/.local/bin:$PATH"
```

```sh
sudo apt-get install ripgrep
# or: wget --no-check-certificate https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
tar xzf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-13.0.0-x86_64-unknown-linux-musl/rg ~/.local/bin/
```

```sh
mkdir -p ~/.local/share/nvim/site/pack/packer/start
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

# Copy our configs
```
mkdir -p ~/.config
rsync -crvl config/ ~/.config/
```

# Prepare
```sh
nvim
# ignore errors due to missing packages
# then run the following to install & update packages.
# Note the initial install may fail, but the update will subsequently work
:PackerCompile
:PackerInstall
:PackerUpdate

:MasonInstall rust-analyzer codelldb
:Mason
```

build the fzf finder
```sh
cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim/
make
```
