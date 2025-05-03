{ config, lib, pkgs, ... }: {
    programs.vscode = {
        enable = true;
        profiles.default = {
            extensions = with pkgs.vscode-extensions; [
                bbenoist.nix
                ms-python.python
            ];
        };
    };
}
