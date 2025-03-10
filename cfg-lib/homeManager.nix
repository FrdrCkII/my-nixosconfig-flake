{ inputs, lib, cfg }:
{ cfg }: let
  inherit cfg;
  inherit (inputs) nixpkgs home-manager;
  system = cfg.system;
  extraSpecialArgs = {
    inherit inputs cfg;
  };
in 
home-manager.lib.homeManagerConfiguration {
  inherit extraSpecialArgs;
  pkgs = cfg.pkg.unstable-pkgs;
  modules = cfg.mod.home-modules;
}