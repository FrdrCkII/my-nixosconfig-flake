{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  home.file = {
    ".config/kitty" = {
      source = ../../cfg-dotf/${configname}/kitty;
      recursive = true;
    };
  };
}
