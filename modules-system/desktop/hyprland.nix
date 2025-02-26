{ config, lib, pkgs, ... }:

{
  environment.SystemPackages = with pkgs; {
    pulseaudio
  };
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
