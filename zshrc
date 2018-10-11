ostype="$(uname -s)"
isosx=false
islinux=false
case "$ostype" in
  Linux*) islinux=true;;
  Darwin*) isosx=true;;
esac

[ "$isosx" = true ] &&
  export ZSH=/Users/bartoszmaka/.oh-my-zsh &&
  plugins=(git tmux common-aliases rails zsh-autosuggestions zsh-syntax-highlighting alias-tips brew)

[ "$islinux" = true ] &&
  export ZSH=/home/bartoszmaka/.oh-my-zsh &&
  plugins=(git tmux common-aliases rails zsh-autosuggestions zsh-syntax-highlighting alias-tips)

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

export DEFAULT_USER='bartoszmaka'
export DISABLE_SPRING=1
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function tattach() { tmux new-session -s `uuidgen` -t $1 }
function npmdo { $(npm bin)/$@ }

test -e "~/.bin/tmuxinator.zsh" && source "~/.bin/tmuxinator.zsh"

alias vi="nvim -u ~/.noplugin_vimrc"
alias minivim="nvim -u ~/.minimal_vimrc"
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias tmuxrc="$EDITOR ~/.tmux.conf"
alias tnew="tmux new-session -t bartosz"
alias tmuxrc="$EDITOR ~/.tmux.conf"
alias dotfiles="cd ~/.repos/dotfiles"
alias ra="ranger"

alias -g F='| fzf --exact'
alias -g C='| column -t -s " "'
alias -g G!='| grep -v'

alias bers="bundle exec rails server"
alias berc="bundle exec rails console"
alias berr="bundle exec rake routes F C"
alias brp="echo 'pry-remote -w';pry-remote -w"
alias yri="rm -rf yarn.lock node_modules/ && yarn install"
alias yrm="rm -rf yarn.lock node_modules/"
alias ys="yarn start"
alias yi="yarn install"

alias :wq=exit
alias :qa=exit
alias :wqa=exit

RPROMPT='%D{%K:%M:%S}'
export PATH="$PATH:$HOME/.rvm/bin"
fpath=(/usr/local/share/zsh-completions $fpath)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/bin:$PATH" # make sure homebrew bins are before osx bins

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
