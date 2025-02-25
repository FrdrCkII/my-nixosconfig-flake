{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
  };
}
