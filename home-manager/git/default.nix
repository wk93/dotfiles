{
  lib,
  pkgs,
  ...
}
: {
  programs.git = {
    enable = true;
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };

      user = {
        name = "Wojciech Kania";
        email = "wojtek@kania.sh";
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII7m6r15E4iMooTSqgWN3Qr0AxNEbG4pa/eH3NXPynZ0";
      };
    };
  };
}
