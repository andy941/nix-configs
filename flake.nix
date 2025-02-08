{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";

    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, catppuccin, ... }:
    let version = "24.11";
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit version inputs; };
          modules = [
            ./hosts/nixos/configuration.nix
            ./nixos_modules
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = ".hm.bk";
              home-manager.extraSpecialArgs = {
                inherit version inputs;
                unstable = import inputs.nixpkgs-unstable {
                  system = "x86_64-linux";
                  config.allowUnfree = true;
                };
              };
              home-manager.users.andrea = {
                imports = [
                  ./users/andrea/home.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
              home-manager.sharedModules = [ ./hm_modules ];
            }
          ];
        };
      };
    };
}
