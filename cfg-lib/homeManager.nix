{ inputs, lib, cfg, pkgs }:
{ cfg }: let
  inherit cfg;
  inherit (inputs) nixpkgs home-manager;
  system = cfg.system;
  extraSpecialArgs = {
    inherit inputs cfg;
  };
  nur-modules = with inputs.nur.legacyPackages."${system}"; [
  ]
  ++ cfg.mod.nur-modules;
in 
home-manager.lib.homeManagerConfiguration {
  inherit system extraSpecialArgs pkgs;
  modules = 
    cfg.mod.home-modules
    ++ [
      inputs.nur.modules.nixos.default
      inputs.nur.legacyPackages."${system}".repos.iopq.modules.xraya
    ]
    ++ [(
      { pkgs, ...}: {
        targets.genericLinux.enable = true;
      }
    )];
}