{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    swww
  ];
  home.file = {
    ".config/hypr" = {
      source = ../../cfg-dotf/${cfg.configname}/hypr;
      recursive = true;
    };
  };
}
