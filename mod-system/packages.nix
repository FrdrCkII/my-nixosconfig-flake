{ config, pkgs, lib, cfg, ... }: let
  system-packages = with pkgs; [
    vim wget git
  ]
  ++ cfg.opt.SystemPackages;
in {
  environment.systemPackages = system-packages;
}
