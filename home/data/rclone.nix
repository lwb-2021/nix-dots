{ config, ... }:
{
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
          type = "union";
          upstreams = "jianguoyun:/:writeback ";
          # type = "alias";
          # remote = "jianguoyun:/";
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
}
