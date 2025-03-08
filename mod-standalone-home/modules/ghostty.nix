{ config, pkgs, lib, cfg, ... }:

{
  home.file = {
    ".config/ghostty" = {
      source = ../../cfg-dotf/${cfg.configname}/ghostty;
      recursive = true;
    };
  };
}
