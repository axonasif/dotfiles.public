# linkage --> ln -s ~/Documents/work/dotfiles.public/.zshrc /Users/palanikannan/.zshrc
export ZSH="$HOME/.oh-my-zsh"

. $HOME/.asdf/asdf.sh

# tmux-sessionizer
bindkey -s ^f "tmux-sessionizer\n"

#oh-my-zsh plugins
plugins=(
  zsh-autosuggestions #for autocompletion suggestion from history
  zsh-syntax-highlighting #for basic syntax highlighting
  zsh-history-substring-search #for searching using a keyword from the history using up and down arrows
)

source $ZSH/oh-my-zsh.sh

# history-substring-search options
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# pretty prompt
eval "$(starship init zsh)"

#alias for vim
alias vi="nvim"
alias vim="nvim"

export FZF_DEFAULT_COMMAND="fd . $HOME/Documents/work\n"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$(tty)

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Volumes/CodeEdit/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/palanikannan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/palanikannan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/palanikannan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/palanikannan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

