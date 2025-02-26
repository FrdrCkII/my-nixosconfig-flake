{ config, pkgs, lib, opt-cfg, ... }: let
  system-packages = with pkgs; [
    vim wget git
  ]
  ++ opt-cfg.SystemPackages;
in {
  environment.systemPackages = system-packages;
}
