Clangd:
```
mkdir -p ~/packages/
cd ~/packages

# If unable to install clang using system packages, can just install locally
wget https://github.com/clangd/clangd/releases/download/18.1.3/clangd-linux-18.1.3.zip
wget https://github.com/clangd/clangd/releases/download/18.1.3/clangd_indexing_tools-linux-18.1.3.zip
unzip clangd_indexing_tools-linux-18.1.3.zip
unzip -o clangd-linux-18.1.3.zip
# Copy into ~/.local/{bin,lib}
mkdir -p ~/.local/
rsync -crvl clangd-linux_18.1.3/* $HOME/.local/
```

Rust:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Python:
```
# Get the jedi-language-server
```

Fonts:
```sh
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/BitstreamVeraSansMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip

unzip -d ~/.local/share/fonts/ IBMPlexMono.zip
unzip -d ~/.local/share/fonts/ DejaVuSansMono.zip
unzip -d ~/.local/share/fonts/ BitstreamVeraSansMono.zip
# update fontcache
fc-cache -f -v
```

```sh
mkdir -p ~/packages/
cd ~/packages
# Get v0.9.1 - note that nightly started having issues with Telescope windows not showing 
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz
##wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz -C ~/
rsync -crvl ~/nvim-linux64/ ~/.local/
# Add ~/.local/bin to ~/.bashrc
## export PATH="$HOME/.local/bin:$PATH"
```

```sh
sudo apt-get install ripgrep
# or: wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
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
# Optionally un-comment the line at the top of the ~/.config/nvim/init.lua to source the ~/.vimrc
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

# For rust
:MasonInstall rust-analyzer codelldb
# For python (requires python3-venv system package)
:MasonInstall ruff-lsp jedi-language-server
:Mason
```

build the fzf finder
```sh
cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim/
make
```
