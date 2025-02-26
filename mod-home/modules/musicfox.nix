{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    go-musicfox
  ];
  home.file = {
    ".config/go-musicfox" = {
      source = ../../cfg-dotf/${configname}/go-musicfox;
      recursive = true;
    };
  };
}
