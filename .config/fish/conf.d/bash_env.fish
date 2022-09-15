#!/usr/bin/fish

set blacklist_regex '^(SHLVL|PWD|SHELL|PS1|OLDPWD|LS_COLORS|BASH_FUNC.*|_)<<;``;>>';
for value in (bash -c 'compgen -e | while read -r var; do \echo -n "${var}<<;\`\`;>>${!var}<<;##;>>"; done' | string split '<<;##;>>')
	if string match --quiet --regex --invert $blacklist_regex $value;
		set -gx (string split "<<;``;>>" value)
	end
end
