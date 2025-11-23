Clangd:
```
mkdir -p ~/packages/
cd ~/packages

# If unable to install clang using system packages, can just install locally
wget https://github.com/clangd/clangd/releases/download/21.1.0/clangd-linux-21.1.0.zip
wget https://github.com/clangd/clangd/releases/download/21.1.0/clangd_indexing_tools-linux-21.1.0.zip
unzip clangd_indexing_tools-linux-21.1.0.zip
unzip -o clangd-linux-21.1.0.zip
# Copy into ~/.local/{bin,lib}
mkdir -p ~/.local/
rsync -crvl clangd-linux_21.1.0/* $HOME/.local/
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
wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz -C ~/
rsync -crvl ~/nvim-linux-x86_64/ ~/.local/
# Add ~/.local/bin to ~/.bashrc
## export PATH="$HOME/.local/bin:$PATH"
```

```sh
sudo apt-get install ripgrep
# or: wget https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
tar xzf ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-15.1.0-x86_64-unknown-linux-musl/rg ~/.local/bin/
```

## NVIM setup using 'Lazy'
based on: https://lazy.folke.io/installation
```sh
mkdir -p ~/.config
rsync -crvl config-lazy/ ~/.config/
```

Remove any old nvim share files:
```sh
rm -rf ~/.local/share/nvim
```

Maybe remove the old lock file
```sh
rm -f ~/.config/nvim/lazy-lock.json
```

Run nvim and it should retrieve everything required
```sh
nvim
```


#--- OLD nvim Packer Configuration

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
