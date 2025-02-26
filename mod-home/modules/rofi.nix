{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  home.file = {
    ".config/rofi" = {
      source = ../../cfg-dotf/${configname}/rofi;
      recursive = true;
    };
  };
}
