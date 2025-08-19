{ ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      wechat = prev.wechat.overrideAttrs {
        src = prev.fetchurl {
          url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
          hash = "sha256-gBWcNQ1o1AZfNsmu1Vi1Kilqv3YbR+wqOod4XYAeVKo=";
        };
      };
    })
  ];
}
