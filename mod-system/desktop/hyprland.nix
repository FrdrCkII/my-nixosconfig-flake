{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs = {
    hyprlock.enable = true;
    hyprland = {
      enable = true;
      withUWSM = false;
    };
  };
}
