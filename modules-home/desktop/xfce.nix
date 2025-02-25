{ config, pkgs, lib, ... }:

{
  home.file = {
    ".config/xfce4/xfconf" = {
      source = ../../config-dotfiles/${configname}/xfce4/xfconf;
      recursive = true;
    };
  };
}