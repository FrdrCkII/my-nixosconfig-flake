{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    go-musicfox
  ];
  home.file = {
    ".config/go-musicfox" = {
      source = ../../config-dotfiles/${configname}/go-musicfox;
      recursive = true;
    };
  };
}
