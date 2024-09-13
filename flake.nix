{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {nixpkgs, home-manager, flake-utils, catppuccin, ...}@inputs: 
    flake-utils.lib.eachDefaultSystem (system: {
      defaultPackage = home-manager.defaultPackage."${system}";

      packages = {
        homeConfigurations = {
          lowdewijk = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs { inherit system; };

            # where the magic happens
            modules = [ 
              catppuccin.homeManagerModules.catppuccin
              ./home.nix 
            ];
          };
        };
      };
    });
}
