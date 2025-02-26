{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];
  home.file = {
    ".config/waybar" = {
      source = ../../cfg-dotfiles/${configname}/waybar;
      recursive = true;
    };
  };
}
