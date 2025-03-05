{ config, pkgs, lib, cfg, ... }:

{
  home.file = {
    ".aria2" = {
      source = ../../cfg-dotf/${cfg.configname}/aria2;
      recursive = true;
    };
  };
}
