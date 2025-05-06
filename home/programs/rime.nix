{ config, pkgs, ... }: { 
    i18n = { 
        inputMethod = { 
            enable = true; 
            type = "fcitx5"; 
            fcitx5 = { 
                addons = with pkgs;[
                    fcitx5-gtk
                    fcitx5-rime
                    fcitx5-mellow-themes
                ]; 
                waylandFrontend = true; 
                settings = { 
                    addons = { 
                        classicui.globalSection = {
                            Theme = "kwinblur-mellow-graphite-dark";
                            # DarkTheme = "plasma"; 
                        };
                    };
                };
            };
        };
    };
}
