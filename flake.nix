{
    description = "My NixOS flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        hyprland.url = "github:hyprwm/Hyprland";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        ags.url = "github:Aylur/ags";
        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, home-manager, nixvim , sops-nix,  ... }@inputs: {
        nixosConfigurations.lwb = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix 
                nixvim.nixosModules.default
                ./nixvim
                home-manager.nixosModules.home-manager {
                    imports = [ 
                        ./home/programs/desktop/ags/flake-module.nix 
                    ];
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.lwb = import ./home/lwb.nix;
                }	
                {
                    nix.settings = {
                        substituters = [

                            "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
                            "https://mirrors.ustc.edu.cn/nix-channels/store"

                            "https://cache.nixos.org"
                        ];
                        trusted-public-keys = [
                            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                        ];
                    };
                }
                sops-nix.nixosModules.sops
            ];
        };
    };
}
