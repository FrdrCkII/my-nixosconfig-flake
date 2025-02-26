{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    waybar
  ];
  home.file = {
    ".config/waybar" = {
      source = ../../cfg-dotf/${cfg.configname}/waybar;
      recursive = true;
    };
  };
}
