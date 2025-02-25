{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];
  home.file = {
    ".config/waybar" = {
      source = ../../config-dotfiles/${configname}/waybar;
      recursive = true;
    };
  };
}
