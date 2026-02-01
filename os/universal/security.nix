{ ... }:
{
  security = {
    sudo = {
      enable = true;
    };

    pam.services =
      let
        gpg = {
          gnupg = {
            enable = true;
            storeOnly = true;
            noAutostart = true;
          };
        };
      in
      {
        login = {
        }
        // gpg;
        greetd = {
        }
        // gpg;
      };
  };

}
