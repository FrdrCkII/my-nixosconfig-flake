{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
  };
}
