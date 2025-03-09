{ config, pkgs, lib, cfg, ... }: let
  system-packages = with pkgs; [
  ]
  ++ cfg.opt.SystemPackages;
in {
  config = {
    environment.systemPackages = system-packages;
  };
}
