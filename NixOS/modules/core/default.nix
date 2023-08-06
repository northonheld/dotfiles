{ inputs
, nixpkgs
, self
, ...
}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
      [ (import ./hardware-configuration.nix) ]
      ++ [ (import ./network-config.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./configuration.nix) ]
      ++ [ (import ./pkgs-config.nix) ]
    ;
  };
}
