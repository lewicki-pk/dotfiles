# configFiles

## about

My config files such as .vimrc, .bashrc, etc.
This also contains some simple scripts in bin directory.

To work with neovim it requires to create symbolic link ~/.config/nvim/init.vim pointing to ~/.nvimrc
You can create one with "mkdir -p ~/.config/nvim ; ln -s ~/.nvimrc ~/.config/nvim/init.vim"

## colors of the terminal

Simply use built-in Solarized-dark theme or get one from the following repo: https://github.com/Anthony25/gnome-terminal-colors-solarized

## fonts

https://github.com/powerline/fonts

## neovim stuff

Everything needed to run neovim smoothly


    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update

    sudo apt-get install neovim python-dev python-pip python3-dev python3-pip curl
    sudo pip install neovim
    sudo pip3 install neovim

Other stuff that is required to run smoothly

    sudo apt install clang libclang-dev cscope exuberant-ctags meld
