{
  description = "My NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Catppuccin
    catppuccin.url = "github:catppuccin/nix";

    # NVF
    nvf.url = "github:notashelf/nvf";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Ghostty
    ghostty.url = "github:ghostty-org/ghostty";

    # Yazi
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ghostty,
    nvf,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#t480'
    nixosConfigurations = {
      t480 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [./nixos/configuration.nix];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#wojtek@t480'
    homeConfigurations = {
      "wojtek@t480" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [
          ./home-manager/home.nix
          catppuccin.homeManagerModules.catppuccin
          nvf.homeManagerModules.default
        ];
      };
    };
  };
}
