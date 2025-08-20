{ pkgs-native, ... }: {
  environment.systemPackages = with pkgs-native;[
    cmake
    gcc
  ];
}
