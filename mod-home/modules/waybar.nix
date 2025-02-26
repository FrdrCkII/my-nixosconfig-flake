{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];
  home.file = {
    ".config/waybar" = {
      source = ../../cfg-dotf/${configname}/waybar;
      recursive = true;
    };
  };
}
