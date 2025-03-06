{ config, pkgs, lib, cfg, ... }: let
  system-packages = with pkgs; [
    vim wget git
  ]
  ++ cfg.opt.SystemPackages;
in {
  config = {
    environment.systemPackages = system-packages;
  };
}
