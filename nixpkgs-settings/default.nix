{
  lib,
  inputs,
}:
{
  config = import ./config.nix { inherit lib; };
  overlays = import ./overlays.nix { inherit inputs; };

}
