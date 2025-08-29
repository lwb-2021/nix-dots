{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    libreoffice-fresh
    (wpsoffice-cn.overrideAttrs {
      postInstall = ''
        for i in $out/share/applications/*;do
          sed -i '/Exec=/d' $i
          echo Exec=\'env XMODIFIERS="@im=fcitx" GTK_IM_MODULE="fcitx" QT_IM_MODULE="fcitx" SDL_IM_MODULE=fcitx GLFW_IM_MODULE=ibus QT_SCALE_FACTOR=1.5\' >> $i
        done
      '';
    })
    nur.repos.rewine.ttf-wps-fonts
  ];
  programs.java = {
    enable = true;
    package = pkgs.openjdk21;
  };

}
