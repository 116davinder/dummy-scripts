# How to install SpaceVim and config it

https://spacevim.org/quick-start-guide/#linux-and-macos

# Install NeoVIM
* Download AppImage from here: https://github.com/neovim/neovim/releases
* Copy AppImage to `/usr/loca/bin` and make `root:root` permissions

```bash
$ sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/nvim 60
$ sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 60
```

# Install Search Tools
* https://github.com/ggreer/the_silver_searcher

# Copy Configs
Copy `.SpaceVim.d` into `/home/<user>`
