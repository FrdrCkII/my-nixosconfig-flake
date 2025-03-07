{ inputs, lib, cfg }:
{ cfg }: let
  inherit cfg;
  inherit (inputs) nixpkgs home-manager system-manager;
  system = cfg.system;
  extraSpecialArgs = {
    inherit inputs cfg;
  };
in 
system-manager.lib.makeSystemConfig {
  inherit extraSpecialArgs;
  modules = cfg.mod.sysytem-modules;
}