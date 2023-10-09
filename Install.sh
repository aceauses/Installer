# Type: Bash Script
# Description: Install required packages for programming
# Configuration: None
# Version: 1.0
# Author: Aceauses - GitHub

# Usage: ./install_req.sh [OPTION]
# Options:
#   -h, --help      Display help
#   -v, --version   Display version
#   -a, --all       Install all packages

# Check options
if [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: ./install_req.sh [OPTION]"
    echo "Help: "
    echo " Installs required packages for programming"
    echo " Like: gcc, g++, python, python3, java, etc."
    echo " Also: oh-my-zsh, zsh, git, etc."
    exit 0
elif [[ $1 == "-v" || $1 == "--version" ]]; then
    echo "install_req.sh version 1.0"
    exit 0
elif [[ $1 == "-a" || $1 == "--all" ]]; then
    echo "Installing packages... (This may take a while)"
elif [[ $1 == "-s" || $1 == "--select" ]]; then
    echo "Installing selected packages..."
else
    echo "Usage: ./install_req.sh [OPTION]"
    echo "Options:"
    echo "  -h, --help      Display help"
    echo "  -v, --version   Display version"
    echo "  -a, --all       Install all packages"
    echo "  -s, --select    Install selected packages"
    exit 1
fi

# Check OS
# Install packages for macos
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Install packages
    brew install gcc
    brew install g++
    brew install python
    brew install python3
    brew install java
    brew install node
    brew install npm
    brew install yarn
    brew install zsh
    brew install git
    brew install wget
    brew install curl
    brew install vim
    brew install neovim
    brew install tmux
    brew install htop
    brew install tree
    brew install nmap
    brew install netcat
    brew install wireshark
    brew install nasm
    brew install qemu
    brew install gdb
    brew install radare2
    brew install ghidra
    brew install wireshark
    brew install nasm
    brew install qemu
    brew install gdb
    brew install radare2
    brew install ghidra
    brew install oh-my-zsh
    brew install zsh-autosuggestions
    brew install zsh-syntax-highlighting
    brew install zsh-completions
    brew install zsh-history-substring-search
    brew install zsh-navigation-tools
    brew install zsh-you-should-use
    brew install zshdb
    brew install zsh-interactive-cd
    brew install zsh-git-sync
    brew install zsh-256color
    brew install zsh-apple-touchbar
    brew install zsh-autopair
    brew install zsh-better-npm-completion
    brew install zsh-completions
    brew install zsh-dwim
    brew install zsh-git-prompt
    brew install zsh-history-substring-search
    brew install zsh-navigation-tools
    brew install zsh-syntax-highlighting
    brew install zsh-you-should-use
    brew install zshdb
    brew install zshmarks
    brew install zshuery
    brew install zsh-vi-mode
    brew install zshdb
    brew install zshmarks
    brew install zshuery
    brew install zsh-vi-mode
    brew install zsh-you-should-use
    brew install zshdb
    brew install z
# Install for Linux
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Install packages
    sudo apt install gcc
    sudo apt install g++
    sudo apt install python
    sudo apt install python3
    sudo apt install java
    sudo apt install node
    sudo apt install npm
    sudo apt install yarn
    sudo apt install zsh
    sudo apt install git
    sudo apt install wget
    sudo apt install curl
    sudo apt install vim
    sudo apt install neovim
    sudo apt install tmux
    sudo apt install htop
    sudo apt install tree
    sudo apt install nmap
    sudo apt install netcat
    sudo apt install wireshark
    sudo apt install nasm
    sudo apt install qemu
    sudo apt install gdb
    sudo apt install radare2
    sudo apt install ghidra
    sudo apt install oh-my-zsh
    sudo apt install zsh-autosuggestions
    sudo apt install zsh-syntax-highlighting
    sudo apt install zsh-completions
    sudo apt install zsh-history-substring-search
    sudo apt install zsh-navigation-tools
    sudo apt install zsh-you-should-use
    sudo apt install zshdb
    sudo apt install zsh-interactive-cd
    sudo apt install zsh-git-sync
    sudo apt install zsh-256color
    sudo apt install zsh-apple-touchbar
    sudo apt install zsh-autopair
    sudo apt install zsh-better-npm-completion
    sudo apt install zsh-completions
    sudo apt install zsh-dwim
    sudo apt install zsh-git-prompt
    sudo apt install zsh-history-substring-search
    sudo apt install zsh-navigation-tools
    sudo apt install zsh-syntax-highlighting
    sudo apt install zsh-you-should-use
    sudo apt install zshdb
    sudo apt install zshmarks
    sudo apt install zshuery
    sudo apt install zsh-vi-mode
    sudo apt install zshdb
    sudo apt install zshmarks
    sudo apt install zshuery
    sudo apt install zsh-vi-mode
    sudo apt install zsh-you-should-use
    sudo apt install zshdb
    sudo apt install z
fi