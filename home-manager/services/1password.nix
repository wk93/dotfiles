{pkgs, ...}: {
  systemd.user.services."1password-autostart" = {
    Unit = {
      Description = "Start 1Password on login";
      After = ["graphical-session.target"]; # Możesz użyć też "default.target"
      Wants = ["network.target"];
    };

    Service = {
      ExecStart = "${pkgs._1password-gui}/bin/1password --silent";
      Restart = "always";
      RestartSec = 3;
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
