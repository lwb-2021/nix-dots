{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) concatStringsSep;
  inherit (pkgs) runtimeShell writeScript;
  inherit (config.xdg) configHome dataHome;
  inherit (config.xdg.userDirs) download;
  aria2-pkg = pkgs.aria2.overrideAttrs (
    final: prev: { patches = (prev.patches or [ ]) ++ [ ./aria2-fast.patch ]; }
  );
  aria2-bin = "${aria2-pkg}/bin/aria2c";
  coreutils-bin = "${pkgs.coreutils}/bin";
  sessionFile = "${dataHome}/aria2/session";
in
{
  programs.aria2 = {
    enable = true;
    package = aria2-pkg;
    settings = {
      max-concurrent-downloads = 64;
    };
  };
  systemd.user.services.aria2 = {
    Unit.Description = "aria2 download manager";
    Service = {
      ExecStartPre =
        let
          prestart = writeScript "aria2-prestart" ''
            #!${runtimeShell}
            ${coreutils-bin}/mkdir -p ${dataHome}/aria2

            if [ ! -e "${sessionFile}" ]; then
            ${coreutils-bin}/touch ${sessionFile}
            fi
          '';
        in
        "${prestart}";

      ExecStart = concatStringsSep " " [
        "${aria2-bin}"
        "--enable-rpc"
        "--dir=${download}"
        "--conf-path=${configHome}/aria2/aria2.conf"
        "--save-session=${sessionFile}"
        "--save-session-interval=1800"
        "--input-file=${sessionFile}"
      ];

      ExecReload = "${coreutils-bin}/kill -HUP $MAINPID";

      # We don't want to class an exit before downloads finish as a
      # failure if we stop aria2c, since the entire point of it is
      # that it will resume the downloads.
      SuccessExitStatus = "7";

      # We use falloc, so if we use this unit on any other fs it will
      # cause issues
      Slice = "session.slice";
      ProtectSystem = "full";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
  home.packages = with pkgs; [ ariang ];
}
