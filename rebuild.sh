#!/usr/bin/env bash
set -e

pushd ~/dotfiles/nixos/

echo "Checking Flake"

git add -N .
nix flake check

echo "NixOS Rebuilding..."
LOG_LOCATION=/tmp/nixos-switch.log

sudo nixos-rebuild boot --flake . |& tee ${LOG_LOCATION} || (cat ${LOG_LOCATION} | grep --color error && exit 1)

current=$(nixos-rebuild list-generations --json | jq -r '.[] | select( .current == true) | .generation');
git add .
git commit -m "NixOS generation $((current)) on $(hostname)" -e

popd
