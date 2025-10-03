{ pkgs, ... }:
{
  home.packages = [
    (pkgs.buildFHSEnv {
      name = "nvim";
      targetPkgs = (
        pkgs: with pkgs; [
          stdenv.cc
          neovim-unwrapped
          unzip
          luarocks
          wl-clipboard
        ]
      );
      runScript = "nvim";
    })

  ];
}
