{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (buildFHSEnv {
      name = "fhs";
      targetPkgs =
        pkgs:
        (with pkgs; [
          stdenv.cc

          # Hardware
          udev
          fuse
          libusb1

          # Libraries
          curl

          zstd
          libz

          # Wayland
          wayland
          glib
          libGL
          fontconfig

          # Gtk + Webview
          gtk3
          pango
          cairo
          harfbuzz
          at-spi2-atk
          atkmm
          gdk-pixbuf

          glib
          libdbusmenu-gtk3

          librsvg
          libsoup_3

          # libayatana-common
          # libayatana-indicator
          # libayatana-appindicator
          # ayatana-ido
          #
          # Unknown
          libepoxy
        ]);
    })
  ];
}
