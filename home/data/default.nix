{
  config,
  lib,
  pkgs,
  ...
}:
{

  imports = [
    ./home-data-preclude.nix
    ./rclone.nix
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
