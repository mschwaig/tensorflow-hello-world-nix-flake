{
  description = "A hello-world project for testing if TensorFlow 2 is properly installed and available via Nix on x86_64 and aarch64";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    mach-nix = {
      url = "github:DavHau/mach-nix/3.1.1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, mach-nix }:
  flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
  let
    pkgs = import nixpkgs { inherit system; };
    mach-nix-utils = import mach-nix { inherit pkgs; python = "python3"; };
  in {
    devShell = mach-nix-utils.mkPythonShell {
      requirements = builtins.readFile ./requirements.txt;
    };

    packages.tensorflow-hello-world = mach-nix-utils.buildPythonPackage {
      pname = "tensorflow-hello-world";
      version = "0.1.0";
      src = ./.;
      requirements = builtins.readFile ./requirements.txt;
    };

    defaultPackage = self.packages.${system}.tensorflow-hello-world;
  });
}
