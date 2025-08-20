{ lib, ... }: {
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

    "tampermonkey"

    "vscode-extension-ms-python-vscode-pylance"
    "vscode-extension-github-copilot"
  ]);
  cudaSupport = true;
  packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };

}
