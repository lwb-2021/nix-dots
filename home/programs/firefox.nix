{ config, lib, pkgs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-US" "zh-CN"];
    policies = {

    };
    profiles.default = {};
  };
}
