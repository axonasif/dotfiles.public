status is-interactive
or exit 0

function lazy_dotfiles_jobs --on-event fish_prompt
    if test -e "$HOME/.nix-profile/etc/profile.d/nix.sh"
        source $__fish_config_dir/conf.d/bash_env.fish
    end
    if not functions -q z; and command -q zoxide
        functions -e z lazy_dotfiles_jobs
        zoxide init fish | source
        abbr -a -g -- la 'exa -la'
        abbr -a -g -- ll 'exa -lh'
        abbr -a -g -- ls exa
        abbr -a -g -- l exa
        abbr -a -g -- cat bat
        abbr -a -g -- cd z
    end
end