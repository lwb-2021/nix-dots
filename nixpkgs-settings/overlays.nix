{ inputs }:
[
  (final: prev: {
    nur = import inputs.nur {
      nurpkgs = prev;
      pkgs = prev;
    };
    stable = import inputs.nixpkgs-stable {
      localSystem = "x86_64-linux";
    };
    noCuda = import inputs.nixpkgs {
      localSystem = "x86_64-linux";
      config = {
        cudaSupport = false;
      };
    };
  })
  (final: prev: {
    inherit (final.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena
      ;
  })
  (final: prev: {
    wechat = prev.wechat.overrideAttrs {
      src = prev.fetchurl {
        url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
        hash = "sha256-gBWcNQ1o1AZfNsmu1Vi1Kilqv3YbR+wqOod4XYAeVKo=";
      };
    };
    beauty-line-icon-theme = prev.beauty-line-icon-theme.overrideAttrs rec {
      version = "2.4";
      src = prev.fetchFromGitLab {
        owner = "garuda-linux";
        repo = "themes-and-settings/artwork/beautyline";
        rev = "0df6f5df71c19496f9a873f8a52fbb5e84e95b12";
        hash = "sha256-SsYW4H1qam7kQJ3E4/vHJJOv2E4Pdk3itGncWa6YTqw=";
      };
      sourceRoot = "${src.name}"; # 相当于删除源文件的该属性
    };
  })
  (final: prev: {
  })
  inputs.nix-vscode-extensions.overlays.default
]
