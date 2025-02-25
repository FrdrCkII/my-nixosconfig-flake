{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    just
  ];
  home.file = {
    ".config/kitty" = {
      source = ../../config-dotfiles/${configname}/kitty;
      recursive = true;
    };
  };
}
