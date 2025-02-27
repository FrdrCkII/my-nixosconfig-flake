{ config, lib, pkgs, cfg, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
  ];
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs = {
    hyprlock.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
      };
    };
  };
}
