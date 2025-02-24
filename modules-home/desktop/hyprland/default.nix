{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprlock
    waybar
    swww
    mako
  ];
  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
    ".config/mako" = {
      source = ./mako;
      recursive = true;
    };
    ".config/waybar" = {
      source = ./waybar;
      recursive = true;
    };
  };
}
