{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = with lib; {
    data = {
      directories = mkOption {
        type = types.listOf types.str;
      };
      files = mkOption {
        type = types.listOf types.str;
      };
      local = {
        directories = mkOption {
          type = types.listOf types.str;
        };
        files = mkOption {
          type = types.listOf types.str;
        };
      };
    };
  };
  config = {
    data = {
      directories = lib.mkDefault [ ];
      files = lib.mkDefault [ ];
      local = {
        directories = lib.mkDefault [ ];
        files = lib.mkDefault [ ];
      };
    };
    home.persistence = {
      "/nix/persistence/${config.home.username}" = {
        hideMounts = true;
        allowOther = false;
        directories = [

        ]
        ++ config.data.directories;
        files = [

        ]
        ++ config.data.files;
      };
      "/nix/persistence/local/home/${config.home.username}" = {
        hideMounts = true;
        allowOther = false;
        directories = [
          ".cache"
        ]
        ++ config.data.local.directories;
        files = [
        ]
        ++ config.data.local.files;
      };
    };

    programs.rclone = {
      enable = true;
      remotes = {
        remotes-sync = {
          config = {
            type = "compress";
            compress-mode = "zstd";
            remote = "remotes-sync-encrypted:Compressed";
          };
        };

        remotes-sync-encrypted = {
          config = {
            type = "crypt";
            remote = "remotes-sync-raw:Encrypted";
          };
          secrets.password = config.sops.secrets."rclone/crypt/password".path;
        };
        remotes-sync-raw = {
          config = {
            # type = "union";
            # upstreams = "jianguoyun:Sync";
            type = "alias";
            remote = "jianguoyun:Sync";
          };
        };
        jianguoyun = {
          config = {
            type = "webdav";
            url = "https://dav.jianguoyun.com/dav/";
            user = "lwb-2021@qq.com";
            vendor = "other";
          };
          secrets.pass = config.sops.secrets."rclone/jianguoyun/password".path;
        };
      };
    };
    systemd.user.services.sync-home-data = {
      Unit = {
        After = [ "network-online.target" ];
      };
      Service = {
        ExecStart = "${lib.getExe pkgs.rclone}  bisync /nix/persistence/${config.home.username} remotes-sync:NixOS/${config.home.username} --checksum";
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}
