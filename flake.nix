{
  description = "NixOS configuration";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixosConfigurations = let system = "x86_64-linux";
      in {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
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
                  inherit system;
                  config.allowUnfree = true;
                };
              };
              home-manager.users.andrea = {
                imports =
                  [ ./users/andrea/home.nix catppuccin.homeModules.catppuccin ];
              };
              home-manager.sharedModules = [ ./hm_modules ];
            }
          ];
        };
      };

      templates = {
        quartoForDataScience = {
          path = ./templates/quartoForDataScience;
          descritpion = ''
            Quarto setup for data science allowing the use of both R and Python with Knitr and reticulate.

            Easily compile your work in a website ready to be hosted on services like GitHub Pages.
          '';
          welcomeText = ''
            Welcome to your data science project powered by Quarto!
          '';
        };
      };
    };
}
