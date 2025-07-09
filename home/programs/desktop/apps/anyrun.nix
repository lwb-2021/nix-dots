{ config, lib, pkgs, inputs, ... }: {
  programs.anyrun = {
    enable = true;
    package = inputs.anyrun.packages.${pkgs.system}.anyrun;
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.4; };
      height = { fraction = 0.2;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
      plugins = with inputs.anyrun.packages.${pkgs.system};[
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        applications
        kidex
      ] ++ [

        ];
    };
    extraCss = /*css */ ''
        window {
          background-color: transparent;
        }
        box {
          background-color: unset;
        }
    '';

  };

}
