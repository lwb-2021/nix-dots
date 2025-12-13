{ ... }:
{
  networking = {
    hostName = "lwb";
    networkmanager = {
      enable = true;
    };
    nftables = {
      enable = true;
    };
  };
}
