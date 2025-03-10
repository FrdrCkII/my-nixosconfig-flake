{ config, lib, pkgs, cfg, ... }: let 
  system-modules = with pkgs; [
    ./packages.nix
  ]
  ++ lib.optionals (builtins.elem "amd" cfg.opt.drivers) [
    ./drivers/amd.nix
  ]
  ++ lib.optionals (builtins.elem "nvidia" cfg.opt.drivers) [
    ./drivers/nvidia.nix
  ];
in {
  imports = system-modules;
  config = {
    system-manager.allowAnyDistro = true;
    nixpkgs.hostPlatform = "x86_64-linux";
  };
}
