{ pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    zenity
  ];
}
