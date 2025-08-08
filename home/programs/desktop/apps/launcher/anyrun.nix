{ ... }: {
  programs.anyrun = {
    enable = true;
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
      plugins = [
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        "libapplications.so"
        "libshell.so"
        "libwebsearch.so"
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
  wayland.launcher.exec = "anyrun";

}
