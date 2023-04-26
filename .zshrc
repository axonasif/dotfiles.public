# ln -s ~/Documents/work/dotfiles.public/.zshrc /Users/palanikannan/.zshrc
export ZSH="$HOME/.oh-my-zsh"

#zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

#oh-my-zsh plugins
plugins=(
  zsh-autosuggestions #for autocompletion suggestion from history
  zsh-syntax-highlighting #for basic syntax highlighting
  zsh-history-substring-search #for searching using a keyword from the history using up and down arrows
)

source $ZSH/oh-my-zsh.sh

#history-substring-search options
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey -s ^f "tmux-sessionizer\n"

#alias for vim
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_DEFAULT_COMMAND="fd . $HOME/Documents/work\n"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$(tty)

# pnpm
export PNPM_HOME="/Users/palanikannan/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH="/Users/palanikannan/.detaspace/bin:$PATH"
export PATH="/usr/local/opt/jpeg/bin:$PATH"
