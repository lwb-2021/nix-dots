{
  pkgs,
  ...
}:
{
  programs.gpg = {
    enable = true;
    settings = {

      #
      personal-cipher-preferences = "AES256";
      personal-digest-preferences = "SHA512";
      default-preference-list = "SHA512 SHA384 SHA256 RIPEMD160 AES256 TWOFISH BLOWFISH ZLIB BZIP2 ZIP Uncompressed";
      cipher-algo = "AES256";
      digest-algo = "SHA512";
      cert-digest-algo = "SHA512";
      compress-algo = "ZLIB";
      disable-cipher-algo = "3DES";
      weak-digest = "SHA1";
      s2k-cipher-algo = "AES256";
      s2k-digest-algo = "SHA512";
      s2k-mode = "3";
      s2k-count = "65011712";
    };
  };
  services.gpg-agent = {
    enable = true;
    enableFishIntegration = true;
    pinentry.package = pkgs.pinentry-all;
  };
  home.packages = with pkgs; [
    age
  ];
}
