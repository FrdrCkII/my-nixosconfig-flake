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
      enableWaylandSession = true;
      noDesktop = true;
      waylandSessionCompositor = ''
        Hyprland --replace
      '';
    };
  };
  programs = {
    hyprland.enable = true;
  };
  environment.xfce.excludePackages = with pkgs.xfce; [
    xfce4-terminal
    mousepad
  ];
}
