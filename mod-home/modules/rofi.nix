{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  home.file = {
    ".config/rofi" = {
      source = ../../cfg-dotfiles/${configname}/rofi;
      recursive = true;
    };
  };
}
