{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      catppuccin,
      ...
    }@inputs:
    let
      inherit (builtins) mapAttrs;
      helpers = import ./helpers.nix;

      homeConfig = username: {
        home = {
          inherit username;
          homeDirectory = if username == "root" then "/root" else "/home/${username}";
        };
        imports = [
          ./home
          catppuccin.homeManagerModules.catppuccin
        ];
      };
      homeConfigs = {
        root = homeConfig "root";
        eggstrom = homeConfig "eggstrom";
      };

      system = "x86_64-linux";
      pkgsAttrs = {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs pkgsAttrs;
      pkgs-stable = import nixpkgs-stable pkgsAttrs;

      specialArgs = {
        inherit
          inputs
          system
          pkgs-stable
          helpers
          ;
      };
      extraSpecialArgs = specialArgs;
    in
    {
      nixosConfigurations.eggos = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hardware-configuration.nix
          ./system
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              inherit extraSpecialArgs;
              users = homeConfigs;
            };
          }
          catppuccin.nixosModules.catppuccin
        ];
      };

      homeConfigurations =
        homeConfigs
        |> mapAttrs (
          _: homeConfig:
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs extraSpecialArgs;
            modules = [ homeConfig ];
          }
        );

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
