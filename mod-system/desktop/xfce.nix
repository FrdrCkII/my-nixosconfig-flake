{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver = {
    enable = true;
    resolutions = [
      { x = 1920; y = 1080; }
      { x = 1600; y = 900; }
    ];
    desktopManager.xfce = {
      enable = true;
      enableScreensaver = true;
      enableXfwm = true;
    };
  };
  programs = {
    xfconf.enable = true;
  };
  environment.xfce.excludePackages = with pkgs; [
    xfce.ristretto
    xfce.xfce4-appfinder
    xfce.xfce4-notifyd
    xfce.xfce4-screenshooter
    xfce.mousepad
    xfce.thunar
    xfce.parole
    xterm
  ];
}
