{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
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
      system = "x86_64-linux";
      pkgsAttrs = {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs pkgsAttrs;
      pkgs-stable = import nixpkgs-stable pkgsAttrs;
      settings = import ./settings.nix;
      specialArgs = {
        inherit
          inputs
          system
          pkgs-stable
          settings
          ;
      };
      extraSpecialArgs = specialArgs;
    in
    {
      nixosConfigurations.${settings.hostname} = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hardware-configuration.nix
          ./modules/system
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              inherit extraSpecialArgs;
              users = {
                root = import ./users/root.nix;
                ${settings.username} = import ./users/default.nix;
              };
            };
          }
          catppuccin.nixosModules.catppuccin
        ];
      };

      homeConfigurations = {
        root = home-manager.lib.homeManagerConfiguration {
          inherit pkgs extraSpecialArgs;
          modules = [ ./users/root.nix ];
        };

        ${settings.username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs extraSpecialArgs;
          modules = [ ./users/default.nix ];
        };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
