{ config, lib, pkgs, cfg, ... }: let 
  system-modules = with pkgs; [
    ./packages.nix
  ];
in {
  imports = system-modules;
  config = {
    system-manager.allowAnyDistro = true;
    nixpkgs.hostPlatform = "x86_64-linux";
  };
}
