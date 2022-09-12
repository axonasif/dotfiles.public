if status is-interactive
    # Commands to run in interactive sessions can go here
    for script in $__fish_config_dir/scripts/*;
        source $script;
    end
end