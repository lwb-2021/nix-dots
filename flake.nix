{
  description = "My NixOS flake";
  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #

    ags = {
      url = "github:Aylur/ags";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae = {
      url = "git+https://github.com/vicinaehq/vicinae?shallow=1";
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
          inputs.stylix.nixosModules.stylix
          inputs.catppuccin.nixosModules.catppuccin
          inputs.sops-nix.nixosModules.sops
          inputs.nix-flatpak.nixosModules.nix-flatpak

          ./stylix

          ./configuration.nix
        ];
      };
      homeConfigurations.lwb = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          inputs.sops-nix.homeManagerModules.sops
          inputs.stylix.homeModules.stylix
          inputs.catppuccin.homeModules.catppuccin
          inputs.nix-flatpak.homeManagerModules.nix-flatpak

          inputs.vicinae.homeManagerModules.default
          inputs.niri.homeModules.niri

          ./stylix
          ./stylix/home.nix

          ./home/lwb.nix
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
