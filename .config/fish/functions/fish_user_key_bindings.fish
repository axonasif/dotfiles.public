function fish_user_key_bindings --description 'My custom keybinds'
	bind -M insert \cF 'pager-toggle-search'
  bind -M insert -m default jk backward-char force-repaint
end
