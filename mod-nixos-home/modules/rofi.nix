{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  home.file = {
    ".config/rofi" = {
      source = ../../cfg-dotf/${cfg.configname}/rofi;
      recursive = true;
    };
  };
}
