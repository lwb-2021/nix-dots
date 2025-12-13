{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];
  gtk = {
    # cursorTheme = {
    #   name = "phinger-cursors-dark";
    #   package = pkgs.phinger-cursors;
    #   size = 24;
    # };
    iconTheme = {
      name = "BeautyLine";
      package = pkgs.beauty-line-icon-theme;
    };
  };
}
