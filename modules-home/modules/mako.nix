{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    mako
  ];
  home.file = {
    ".config/mako" = {
      source = ../../config-dotfiles/${configname}/mako;
      recursive = true;
    };
  };
}
