{ config, pkgs, lib, cfg, ... }:

{
  home.file = {
    ".config/ghotty" = {
      source = ../../cfg-dotf/${cfg.configname}/ghotty;
      recursive = true;
    };
  };
}
