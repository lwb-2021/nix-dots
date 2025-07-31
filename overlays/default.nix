{ inputs, ... }: {
  imports = [
    ./fix.nix
    ./nur.nix
    ./speedup.nix
  ];
}
