if test -z "${HOMEBREW_PREFIX:-}"; then {
  homebrew_dir="/opt/homebrew";
  if test -e "$homebrew_dir"; then {
    eval "$("$homebrew_dir"/bin/brew shellenv)";
  } fi
  unset homebrew_dir;
} fi

if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then {
  source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
} else {
  for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do {
    [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
  } done
  unset COMPLETION;
} fi

