{ ... }: {
  sops = {
    age.keyFile = "$HOME/.config/sops/age/keys.txt";
    secrets."anki-pwd.txt" = {
      sopsFile = ../../../secrets/anki-pwd.txt;
    };
  };

}
