{ config, pkgs, lib, ... }: {
    imports = [ 
        ./plugins 
    ];
    programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;

        opts = {
            #tabstop = 4;
            #softtabstop = 4;
            #shiftwidth = 4;
            expandtab = true;

            number = true;
            cursorline = true;
            termguicolors = true;
            showmode = false;
        };
        
        
    };
}
