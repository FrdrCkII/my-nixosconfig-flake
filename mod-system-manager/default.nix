{ config, lib, pkgs, cfg, ... }: let 
  system-modules = with pkgs; [
    ./options.nix
    ./packages.nix
  ];
in {
  imports = system-modules;
  config = {
    system-manager.allowAnyDistro = true;
  };
}
