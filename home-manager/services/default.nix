{
  imports = [./1password.nix];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
