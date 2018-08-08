case "$(uname -s)" in
  Darwin)
      brew install brew-cask automake python3 the_silver_searcher zsh-completions unrar ccrypt ntfs-3g neovim
      brew install libevent ncurses reattach-to-user-namespace tmux
      brew cask install iterm2 spectacle flux
      brew cask install pgadmin4
      brew install node
    ;;

  Linux)
      sudo add-apt-repository -y ppa:neovim-ppa/unstable
      sudo apt update -y
      sudo apt install -y gcc perl autoconf pkg-config curl wget zsh xclip python-dev python-pip python3-dev python3-pip neovim silversearcher-ag
      sudo apt install -y libncurses5 libncurses5-dev libevent-dev
      sudo apt install -y postgresql postgresql-contrib libpq-dev
    ;;
esac
