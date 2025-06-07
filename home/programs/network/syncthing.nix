{ config, lib, pkgs, ... }: {
    services.syncthing = {
        enable = true;
        #overrideDevices = false;
        settings = {
            devices = {
                "phone" = {
                    id = "3BI7JEJ-BWL5V3R-SSHNDPI-JNR5FCU-3YPHXKL-ZQSFKD5-P36NRWQ-RIRGLQ2";
                    addresses = [
                        "tcp://192.168.10.5:22000"
                    ];
                };
            };
            folders = {
                "~/Documents/Syncthing" = {
                    id = "default";
                    devices = [ "phone" ];
                };
                "~/Documents/Obsidian" = {
                    id = "obsidian";
                    devices = [ "phone" ];
                };
            };

        };
    };

}
