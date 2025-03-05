{ inputs, lib, cfg, ... }:

{
  nixos = import ./nixosSystem.nix {
    inherit inputs cfg;
  };
  home-manager = import ./homeManager.nix {
    inherit inputs cfg;
  };
}
