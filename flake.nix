{
  description = "Flake for building my IVC project website";

  nixConfig = {
    extra-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flake-root.url = "github:srid/flake-root";

    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {
      inherit inputs;
    } {
      imports = with inputs; [
        flake-root.flakeModule
        treefmt-nix.flakeModule
        devshell.flakeModule
      ];
      systems = [
        "x86_64-linux"
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }: let
        mkPandoc = import ./mkPandoc.nix { pkgs = pkgs; };
        mkPandocDebug = import ./mkPandoc.nix { pkgs = pkgs; debug = true; };
      in {
        treefmt.config = {
          inherit (config.flake-root) projectRootFile;
          package = pkgs.treefmt;

          programs = {
            alejandra.enable = true;
            deadnix.enable = true;
          };
        };

        packages = rec {
          pandoc = mkPandoc.package;
          debug = mkPandocDebug.package;
          default = pandoc;
        };

        devshells.default = {
          packages = [ 
            pkgs.hello
            mkPandocDebug.script
            mkPandocDebug.loop
            mkPandocDebug.server
          ];
        };
      };
    };
}
