{ config, lib, pkgs, ... }: {
    programs.vscode = {
        enable = true;
        package = (pkgs.vscode-with-extensions.override {
            vscodeExtensions = with pkgs.vscode-extensions; [
                bbenoist.nix
                ms-python.python
            ];
        });
    };
}
