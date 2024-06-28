{
  description = "A CAD modeling tool for artists";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
        icestudio-pkg = pkgs.callPackage ./pkg.nix {};
      in {
        packages = {
          icestudio = icestudio-pkg;
          default = icestudio-pkg;
        };

        apps = let
          icestudio = {
            type = "app";
            program = "${icestudio-pkg}/bin/icestudio";
          };
        in {
          inherit icestudio;
          default = icestudio;
        };
      }
    );
}
