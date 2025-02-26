{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    swww
  ];
  home.file = {
    ".config/hypr" = {
      source = ../../cfg-dotf/${configname}/hypr;
      recursive = true;
    };
  };
}
