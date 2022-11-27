# shellcheck shell=bash
# .bash_profile
# is used for interactive login shells
# .bashrc is used for non-login interactive shells

set -a; # All export

if test -e /etc/default/locale; then 
  . /etc/default/locale;
fi
if test -z "${LANG:-}" || test -z "${LANG:-}"; then
  LANG="en_US.UTF-8";
  LC_ALL="$LANG";
  LANGUAGE="$LANG";
  LC_CTYPE="$LANG";
fi

set +a;

# Get the aliases and functions
if test -f "$HOME/.bashrc"; then
  . "$HOME/.bashrc";
fi

