# ln -s ~/Documents/work/dotfiles.public/.zshrc /Users/palanikannan/.zshrc
export ZSH="$HOME/.oh-my-zsh"

#oh-my-zsh plugins
plugins=(
  zsh-autosuggestions #for autocompletion suggestion from history
  zsh-syntax-highlighting #for basic syntax highlighting
  zsh-history-substring-search #for searching using a keyword from the history using up and down arrows
)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# history-substring-search options
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# tmux-sessionizer
bindkey -s ^f "tmux-sessionizer\n"

#alias for vim
alias vi="nvim"
alias vim="nvim"

export FZF_DEFAULT_COMMAND="fd . $HOME/Documents/work\n"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$(tty)
