if test -n "$HOMEBREW_PREFIX"
  set -a fish_function_path "$HOMEBREW_PREFIX/share/fish/vendor_functions.d"
  set -a fish_complete_path "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
  source "${HOMEBREW_PREFIX}/share/fish/vendor_conf.d"/*
end
