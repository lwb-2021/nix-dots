{ lib, pkgs-native, inputs }: {
  config = import ./config.nix { inherit lib; };
  overlays = import ./overlays.nix { inherit pkgs-native inputs; };
  
}
