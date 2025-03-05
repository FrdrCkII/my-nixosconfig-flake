{ inputs, lib, cfg, ... }:

{
  nixos = import ./nixosSystem.nix {
    inherit inputs lib cfg;
  };
  home-manager = import ./homeManager.nix {
    inherit inputs lib cfg;
  };
}
