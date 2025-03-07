{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    mako
  ];
  home.file = {
    ".config/mako" = {
      source = ../../cfg-dotf/${cfg.configname}/mako;
      recursive = true;
    };
  };
}
