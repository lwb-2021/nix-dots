{
  description = "My NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    ags.url = "github:Aylur/ags";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    yazi.url = "github:sxyazi/yazi";
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpak = {
      url = "github:nixpak/nixpak";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, nixvim , sops-nix, yazi, nixpak, ... }@inputs: {
    nixosConfigurations.lwb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = let
        mkNixPak = nixpak.lib.nixpak {
          lib = nixpkgs.legacyPackages.x86_64-linux.lib;
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        };
      in [
        ./configuration.nix 
        nixvim.nixosModules.default
        ./nixvim
        home-manager.nixosModules.home-manager 
        {
          home-manager = {
            backupFileExtension = "hm.bak";
            extraSpecialArgs = { inherit inputs; mkNixPak = mkNixPak; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.lwb = ./home/lwb.nix;
          };
        }	
        sops-nix.nixosModules.sops
      ];
    };
  };
}
