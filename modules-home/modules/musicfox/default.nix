{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    go-musicfox
  ];
  home.file = {
    ".config/go-musicfox" = {
      source = ./go-musicfox;
      recursive = true;
    };
  };
}
