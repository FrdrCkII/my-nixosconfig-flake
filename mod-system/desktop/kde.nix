{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate okular elisa oxygen gwenview
    plasma-systemmonitor
    kwalletmanager
  ];
}
