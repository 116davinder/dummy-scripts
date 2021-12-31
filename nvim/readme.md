## NVIM Setup
Install neovim using snap or appimage

### dependencies
* git
* curl
* ripgrep `sudo apt install ripgrep -y`
* nerdfonts (optional)
* xclip ( for Linux based system )
```bash
sudo apt install xclip -y
```
* win32yank ( for WSL based system )

Ref: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
```bash
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```
### Install Vim-Plug
Ref: https://github.com/junegunn/vim-plug#neovim
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### Init.vim
```bash
mkdir -p ~/.config/nvim
copy init.vim
```

### Start NVIM
`:PlugInstall`
