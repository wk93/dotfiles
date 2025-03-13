# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    ./fonts
    ./hyprland
    ./git
    ./ssh
    ./services
    ./terminal
    ./nvf
    ./catppuccin
    ./waybar
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "wojtek";
    homeDirectory = "/home/wojtek";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    # _1password-cli
    # _1password-gui
    brightnessctl
    nerd-fonts.fira-code
    wl-clipboard
    nodejs
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
    git-crypt
  ];

  catppuccin.waybar.enable = true;
  catppuccin.waybar.mode = "createLink";

  programs.neomutt.enable = true;

  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default; # if you use overlays, you can omit this
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  programs.firefox.enable = true;
  programs.lazygit.enable = true;

  programs.ghostty.enable = true;

  programs.tmux.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
