set shell := ["fish", "-c"]

default:
  @just --list

update:
  nix flake update

build:
  nixos-rebuild build --log-format internal-json --flake &| nom --json

rebuild: (rebuild-for ".#") && activate-hm

rebuild-for flake:
  sudo true; nixos-rebuild switch --sudo --log-format internal-json --flake {{flake}} &| nom --json

activate-hm: (activate-hm-for ".#$USER")

activate-hm-for flake:
  home-manager switch --flake {{flake}} -b hm.bak
