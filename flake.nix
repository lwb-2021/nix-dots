{
  description = "My NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixpak = {
      url = "github:nixpak/nixpak";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit
          (import ./nixpkgs-settings {
            inherit inputs;
            inherit (nixpkgs) lib;
          })
          config
          overlays
          ;
        localSystem = {
          inherit system;
        };

      };
    in
    {
      nixosConfigurations.lwb = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = { inherit inputs; };
        modules = [

          inputs.impermanence.nixosModules.impermanence
          ./configuration.nix
          inputs.catppuccin.nixosModules.catppuccin
          inputs.sops-nix.nixosModules.sops
        ];
      };
      homeConfigurations.lwb = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          inputs.sops-nix.homeManagerModules.sops
          inputs.catppuccin.homeModules.catppuccin
          ./home/lwb.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
