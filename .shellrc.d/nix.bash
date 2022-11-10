#!/usr/bin/env bash

# if test -z "${NIX_PROFILES:-}"; then {

  for target in "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" \
                "$HOME/.nix-profile/etc/profile.d/nix.sh"; do {

    if test -e "$target"; then {
      . "$target" && break;
    } fi

  } done

  unset target;

# } fi


