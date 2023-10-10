# Type: Bash Script
# Description: Install required packages for programming
# Version: 1.0
# Author: Aceauses - GitHub

# Variables
brew_output_file=$(mktemp)
oh_my_zsh_installer="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
brew_installer="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

packages=("gcc" "cmake" "glfw" "rust" "python" "python3" "java" "node" "npm" "yarn" "git" "wget" "curl" "gdb")

# Function for a loading animation
function loading_animation() {
    local -r chars="/-\|"
    local -r delay=0.1
    local i=1
    while true; do
        printf "\r%s [%s]" "$1" "${chars:$i%${#chars}:1}"
        sleep $delay
        ((i++))
    done
    printf "\r%s [%s]" "$1" "="
}

# Check options
if [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: ./Install.sh [OPTION]"
    echo "Help: "
    echo " Installs required packages for programming"
    echo " Like: gcc, g++, python, python3, java, etc."
    echo " Also: oh-my-zsh, zsh, git, etc."
    exit 0
elif [[ $1 == "-v" || $1 == "--version" ]]; then
    echo "Install.sh version 0.1"
    exit 0
elif [[ $1 == "-a" || $1 == "--all" ]]; then
    echo "Installing packages... (This may take a while)"
elif [[ $1 == "-s" || $1 == "--select" ]]; then
    echo "Installing selected packages..."
elif [[ $1 == "-u" || $1 == "--update" ]]; then
    echo "Updating Installer..."
elif [[ $1 == "-r" || $1 == "--remove" ]]; then
    echo "Removing packages..."
else
    echo "Usage: ./install_req.sh [OPTION]"
    echo "Options:"
    echo "  -h, --help      Display help"
    echo "  -v, --version   Display version"
    echo "  -a, --all       Install all packages"
    echo "  -s, --select    Install selected packages"
    echo "  -u, --update    Update Installer"
    echo "  -r, --remove    Remove packages"
    exit 1
fi

# Continue only if -a or --all was selected
# Install packages for macos
if [[ $1 == "-a" || $1 == "--all" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Ask if user wants to install homebrew
        read -p "Do you want to install homebrew? [Y/n] " homebrew
        if [[ $homebrew == "Y" || $homebrew == "y" ]]; then
            echo "Installing homebrew..."
            /bin/bash -c "$(curl -fsSL $brew_installer)"
        else
            echo "Skipping homebrew installation..."
        fi
        # Ask if user wants to install oh-my-zsh
        read -p "Do you want to install oh-my-zsh? [Y/n] " oh_my_zsh
        if [[ $oh_my_zsh == "Y" || $oh_my_zsh == "y" ]]; then
            echo "Installing oh-my-zsh..."
            sh -c "$(curl -fsSL $oh_my_zsh_installer)"
        else
            echo "Skipping oh-my-zsh installation..."
        fi
        clear
        # Install packages
        for package in "${packages[@]}"; do
            loading_animation "Installing $package" &
            pid=$!
            disown
            brew install --quiet "$package" >> "$brew_output_file"
            kill $pid 
            printf "\r%80s\r" ""
        done
        installed_count=$(cat "$brew_output_file" | grep "🍺" | wc -l)
        used_space=$(awk '/MB/ {gsub("MB", "", $5); total += $5} END {print int(total)}' "$brew_output_file")
        echo "Installed $installed_count packages."
        echo "Used ${used_space}MB of disk space."
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Ask if user wants to install homebrew
        read -p "Do you want to install homebrew? [Y/n] " homebrew
        if [[ $homebrew == "Y" || $homebrew == "y" ]]; then
            echo "Installing homebrew..."
            /bin/bash -c "$(curl -fsSL $brew_installer)"
        else
            echo "Skipping homebrew installation..."
        fi
        # Ask if user wants to install oh-my-zsh
        read -p "Do you want to install oh-my-zsh? [Y/n] " oh_my_zsh
        if [[ $oh_my_zsh == "Y" || $oh_my_zsh == "y" ]]; then
            echo "Installing oh-my-zsh..."
            sh -c "$(curl -fsSL $oh_my_zsh_installer)"
        else
            echo "Skipping oh-my-zsh installation..."
        fi
        # Install packages
        for package in "${packages[@]}"; do
            sudo apt install "$package" >> "$brew_output_file"
        done
        # Count the number of installed packages
        installed_count=$(cat "$brew_output_file" | grep "🍺" | wc -l)
        used_space=$(awk '/MB/ {gsub("MB", "", $5); total += $5} END {print int(total)}' "$brew_output_file")
        echo "Installed $installed_count packages."
        echo "Used ${used_space}MB of disk space."
    fi
fi

# Remove packages
if [[ $1 == "-r" || $1 == "--remove" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Remove packages with silent mode
        clear
        for package in "${packages[@]}"; do
            loading_animation "Uninstalling $package" &
            pid=$!
            disown
            brew remove --quiet --ignore-dependencies --force "$package" >> "$brew_output_file"
            kill $pid
            printf "\n"
        done
        echo " "
        # Print the amount of packages removed
        removed_count=$(cat "$brew_output_file" | wc -l)
        used_space=$(awk '/MB/ {gsub("MB", "", $5); total += $5} END {print int(total)}' "$brew_output_file")
        echo "Removed $removed_count packages."
        echo "Removed ${used_space}MB of disk space."
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Not yet implemented
        echo "Not yet implemented"
    fi
fi

# Update Installer
if [[ $1 == "-u" || $1 == "--update" ]]; then
    git pull
    echo "Done!"
fi