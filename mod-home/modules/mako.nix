{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    mako
  ];
  home.file = {
    ".config/mako" = {
      source = ../../cfg-dotfiles/${configname}/mako;
      recursive = true;
    };
  };
}
