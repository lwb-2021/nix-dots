{ ... }: {
  services.mako = {
    enable = true;
    settings = {
      sort = "-time";
      layer = "overlay";
      background-color = "#2e34407f";
      width = 240;
      height = 60;
      border-size = 1;
      border-color = "#99c0d0";
      border-radius = 12;
      icons = 0;
      max-icon-size = 64;
      default-timeout = 5000;
      ignore-timeout = 0;
      font="\"Source Han Sans CN\" 12";
      margin = 12;
      padding= "6, 10";

      "urgency=low" = {
        border-color = "#cccccc";
      };
      "urgency=normal" = {
        border-color = "#99c0d0";
      };

      "urgency=critical" = {
        border-color = "#bf616a";
        default-timeout = 0;
      };
      
    };
  };
}
