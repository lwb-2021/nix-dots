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
    impermanence.url = "github:nix-community/impermanence";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.lwb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules =  [
        {
          nixpkgs.overlays = [
            (final: prev: {
              nur = import inputs.nur {
                nurpkgs = prev;
                pkgs = prev;
              };
            })
          ];
        }
        inputs.impermanence.nixosModules.impermanence
        ./configuration.nix 
        inputs.nixvim.nixosModules.default
        ./nixvim
        home-manager.nixosModules.home-manager 
        {
          home-manager = {
            #sharedModules = [
            # nur.modules.homeManager.default
            #];
            backupFileExtension = "hm.bak";
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.lwb = ./home/lwb.nix;
          };
        }	
        inputs.sops-nix.nixosModules.sops
      ];
    };
  };
}
