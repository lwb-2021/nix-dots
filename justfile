set shell := ["fish", "-c"]

default:
  @just --list

update:
  nix flake update

build:
  nixos-rebuild build --log-format internal-json --flake &| nom --json

rebuild: (rebuild-for ".#") && activate-hm-for-current-user

rebuild-for flake:
  sudo true; nixos-rebuild switch --sudo --log-format internal-json --flake {{flake}} &| nom --json

activate-hm-for-current-user: (activate-hm "$USER")

activate-hm user:
  eval (systemctl show -p ExecStart --value home-manager-{{user}}.service | grep -oP "argv\[\]=\K[^;]+")
