# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ./system-config/audio.nix
            ./system-config/bluetooth.nix
            ./system-config/network.nix
            ./system-config/nvidia.nix
            
            ./system-config/va-api.nix
            
            ./system-config/fish-shell.nix
            
            ./system-config/hyprland.nix
            ./system-config/hyprland-autostart.nix
        ];

# Use the systemd-boot EFI boot loader.
#boot.loader.systemd-boot.enable = true;
#boot.loader.efi.canTouchEfiVariables = true;
    boot.loader = {
        efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot/efi";
        };
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            extraEntries = ''
                menuentry "Windows"{
                    search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                        chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
                }
            '';
        };
    };

# networking.hostName = "nixos"; # Define your hostname.
# Pick only one of the below networking options.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
# networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

# Set your time zone.
    time.timeZone = "Asia/Shanghai";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
# i18n.defaultLocale = "en_US.UTF-8";
# console = {
#   font = "Lat2-Terminus16";
#   keyMap = "us";
#   useXkbConfig = true; # use xkb.options in tty.
# };
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8"];
# Enable the X11 windowing system.
# services.xserver.enable = true;




# Configure keymap in X11
# services.xserver.xkb.layout = "us";
# services.xserver.xkb.options = "eurosign:e,caps:escape";

# Enable CUPS to print documents.
    services.printing.enable = true;

# Enable sound.
# services.pulseaudio.enable = true;
# OR

# Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

    services.v2raya = {
        enable = true;
    };
    services.tor = {
        enable = true;
        client.enable = true;
        settings = {
            UseBridges = true;
            ClientTransportPlugin = "webtunnel exec ${pkgs.obfs4}/bin/lyrebird";
            Bridge = [ 
                "webtunnel [2001:db8:c525:22a6:6b6a:e916:9ef7:8152]:443 8A1EE5824071CA39E7D76BD579FB2AEF2B52E524 url=https://c.img-cdn.net/yE4s7KehTFyj/ ver=0.0.1"
                "webtunnel [2001:db8:345b:f823:7fe0:dec9:ee74:7525]:443 98A44ED60781F69A41B3CB4DCBA5ECE70D0AF247 url=https://b.img-cdn.net/3DV2SZvE8CrQ/ ver=0.0.1"
            ];
        };
    };

# Define a user account. Don't forget to set a password with ‘passwd’.
# users.users.alice = {
#   isNormalUser = true;
#   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
#   packages = with pkgs; [
#     tree
#   ];
# };
    users.users.lwb = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
    };

    programs.firefox.enable = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = [
#pkgs.neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        pkgs.wget
            pkgs.git
            pkgs.kitty
#inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    ];
    # Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
    networking.firewall.enable = false;


    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        extra-substituters = lib.mkForce [ 
            "https://hyprland.cachix.org"
        ];
        extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
# to actually do that.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "25.05"; # Did you read the comment?

}

