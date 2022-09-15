#!/usr/bin/fish

set -l var_split '<<;@@;>>'
set -l value_split '<<;##;>>'
set blacklist_regex "^(SHLVL|PWD|SHELL|PS1|OLDPWD|LS_COLORS|BASH_FUNC.*|_)$var_split";
for value in (bash -cli "compgen -e | while read -r var; do \echo -n \"\${var}$var_split\${!var}$value_split\"; done" | string split -n $value_split)
	if string match --quiet --regex --invert $blacklist_regex $value;
		set -gx (string split $var_split $value)
	end
end
