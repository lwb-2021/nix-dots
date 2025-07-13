set shell := ["fish", "-c"]

default:
  @just --list

update:
  nix flake update

rebuild: (rebuild-for ".#")

rebuild-for flake:
  sudo true; nixos-rebuild switch --log-format internal-json --sudo --flake {{flake}} &| nom --json
