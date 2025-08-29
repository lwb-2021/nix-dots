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
    wechat = prev.wechat.overrideAttrs {
      src = prev.fetchurl {
        url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
        hash = "sha256-gBWcNQ1o1AZfNsmu1Vi1Kilqv3YbR+wqOod4XYAeVKo=";
      };
    };
  })
  (final: prev: {
    anyrun = prev.anyrun.overrideAttrs rec {
      version = "25.9.0.pre-release.1-unstable-2025-08-19";
      src = prev.fetchFromGitHub {
        owner = "anyrun-org";
        repo = "anyrun";
        rev = "af1ffe4f17921825ff2a773995604dce2b2df3cd";
        hash = "sha256-PKxVhfjd2AlzTopuVEx5DJMC4R7LnM5NIoMmirKMsKI=";
      };
      cargoDeps = final.rustPlatform.fetchCargoVendor {
        inherit src;
        hash = "sha256-KpAnfytTtCJunhpk9exv8LYtF8mKDGFUUbsPP47M+Kk=";
      };
      meta.homepage = "https://github.com/anyrun-org/anyrun";
    };
    python3 = prev.python3.override {
      packageOverrides = (
        final-python3: prev-python3: {
          lsprotocol = prev-python3.lsprotocol.overridePythonAttrs rec {
            version = "2023.0.1";

            src = prev.fetchFromGitHub {
              owner = "microsoft";
              repo = "lsprotocol";
              tag = version;
              hash = "sha256-PHjLKazMaT6W4Lve1xNxm6hEwqE3Lr2m5L7Q03fqb68=";
            };
          };
        }
      );
    };
  })
  inputs.nix-vscode-extensions.overlays.default
]
