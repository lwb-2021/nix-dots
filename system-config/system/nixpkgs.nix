{ config, lib, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ([
      "p7zip"

      "nvidia-x11"
      "nvidia-settings"

      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "xow_dongle-firmware"

      "zerotierone"

      "qq"
      "wechat"

      "wemeet"
      "libwemeetwrap"

      "obsidian"

      "vscode-extension-github-copilot"
      "vscode-extension-MS-python-vscode-pylance"

      "tampermonkey"
    ]
      ++ lib.mapAttrsToList (n: lib.getName) (lib.filterAttrs (n: v: lib.isDerivation v) pkgs.cudaPackages)
    );
  };
}
