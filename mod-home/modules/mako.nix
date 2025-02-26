{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    mako
  ];
  home.file = {
    ".config/mako" = {
      source = ../../cfg-dotf/${configname}/mako;
      recursive = true;
    };
  };
}
