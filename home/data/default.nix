{
  config,
  lib,
  pkgs,
  ...
}:
{

  imports = [
    ./home-data-preclude.nix
  ];

  options = with lib; {
    data = {
      directories = mkOption {
        type = types.listOf types.anything;
      };
      files = mkOption {
        type = types.listOf types.anything;
      };
      local = {
        directories = mkOption {
          type = types.listOf types.anything;
        };
        files = mkOption {
          type = types.listOf types.anything;
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
      "/nix/persistence" = {
        hideMounts = true;
        directories = [

        ]
        ++ config.data.directories;
        files = [

        ]
        ++ config.data.files;
      };
      "/nix/persistence/local" = {
        hideMounts = true;
        directories = [
          ".cache/rclone"
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
        remote = {
          config = {
            type = "compress";
            compress-mode = "zstd";
            remote = "remote-encrypted:/";
          };
          mounts = {
            "" = {
              mountPoint = "${config.home.homeDirectory}/Cloud";
              options = {
                fuse-flag = "x-gvfs-hide";
              };
            };
          };
        };

        remote-encrypted = {
          config = {
            type = "crypt";
            remote = "remote-raw:EncryptedData";
          };
          secrets.password = config.sops.secrets."rclone/crypt/password".path;
        };
        remote-raw = {
          config = {
            # type = "union";
            # upstreams = "jianguoyun:/";
            type = "alias";
            remote = "jianguoyun:/";
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

    services.restic = {
      # enable = true;
      backups = {
        home-data = {
          initialize = true;
          passwordFile = config.sops.secrets."restic/password".path;
          paths = [
            "/nix/persistence/home/${config.home.username}"
          ];
          repository = "rclone:remote-raw:Backups/${config.home.username}-home-data";
          extraBackupArgs = [ "--compression auto" ];
          pruneOpts = [ "--keep-last 4" ];
        };
      };
    };

  };
}
