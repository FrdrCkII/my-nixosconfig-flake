{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.xfce = {
      enable = true;
      enableScreensaver = false;
    };
  };
  environment.xfce.excludePackages = with pkgs.xfce; [
  ];
}
