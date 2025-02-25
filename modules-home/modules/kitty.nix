{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  home.file = {
    ".config/kitty" = {
      source = ../../config-dotfiles/${configname}/kitty;
      recursive = true;
    };
  };
}
