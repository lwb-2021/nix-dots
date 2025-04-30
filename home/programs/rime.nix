{ config, pkgs, ... }: { 

    i18n = { 
        inputMethod = { 
            enable = true; 
            type = "fcitx5"; 
            fcitx5 = { 
                addons = with pkgs;[ 
                    fcitx5-rime
                ]; 
                waylandFrontend = true; 
                settings = { 
                    addons = { 
                        classicui.globalSection = {
                            Theme = "plasma";
                            DarkTheme = "plasma"; 
                        };
                    };
                };
            };
        };
    };
}
