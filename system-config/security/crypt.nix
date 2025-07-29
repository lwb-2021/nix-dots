{ pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    git-crypt
  ];
}
