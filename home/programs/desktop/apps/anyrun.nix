{ config, lib, pkgs, inputs, ... }: {
  programs.anyrun = {
    enable = true;
    package = inputs.anyrun.packages.${pkgs.system}.anyrun;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.4; };
      width = { fraction = 0.35; };
      height = { fraction = 0.2;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = null;
      plugins = with inputs.anyrun.packages.${pkgs.system};[
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        applications
        kidex
        shell
        websearch
      ] ++ [

        ];
    };
    extraCss = /*css */ ''
        window {
          background-color: transparent;
          * { background-color: unset; }
        }
    '';
    extraConfigFiles = {
      "websearch.ron".text = ''
        Config(
          prefix: "@",
          engines: [
            Bing, 
            Custom(
              name: "NixOS Packages",
              url: "search.nixos.org/packages?channel=unstable&query={}",
            ),
            Custom(
              name: "NixOS Options",
              url: "search.nixos.org/options?channel=unstable&query={}",
            ),
          ], 
        )
      '';
      "shell.ron".text = ''
        prefix: "$",
        shell: None,
      '';
    };

  };

}
