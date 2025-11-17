#!/bin/bash
set -e
  echo "Updating and upgrading system..."
  sudo apt update && sudo apt upgrade -y
  echo "Installing common tools..."
  sudo apt install -y git curl wget unzip build-essential cmake gdb nano vim zsh
  # ------------------------
  # Java (JDK 17 + Maven/Gradle)
  # ------------------------
  echo "Installing Java 17, Maven and Gradle..."
  sudo apt install -y openjdk-17-jdk maven gradle
  echo "Setting JAVA_HOME for Java 17..."
  echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.zshrc
  echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
  source ~/.zshrc
  # ------------------------
  # Go
  # ------------------------
  echo "Installing Go..."
  sudo apt install -y golang-go
  echo 'export GOPATH=$HOME/go' >> ~/.zshrc
  echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
  source ~/.zshrc
  # ------------------------
  # Rust
  # ------------------------
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
  # ------------------------
  # Python + Django
  # ------------------------
  echo "Installing Python 3, pip and virtualenv..."
  sudo apt install -y python3 python3-pip python3-venv
#  pip3 install --upgrade pip
#  pip3 install django
  # ------------------------
  # PHP + Laravel
  # ------------------------
  echo "Installing PHP, Composer and Laravel..."
  sudo apt install -y php php-cli php-mbstring php-xml unzip curl
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
  composer global require laravel/installer
  echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  # ------------------------
  # Node.js + Express
  # ------------------------
  echo "Installing Node.js and npm..."
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm install -g npm
  sudo npm install -g express-generator
  # ------------------------
  # Cleanup
  # ------------------------
  echo "Cleaning up..."
  sudo apt autoremove -y
  echo "All setup completed!"
  echo "Please restart your terminal or 'source ~/.zshrc' to load environment
  variables."
