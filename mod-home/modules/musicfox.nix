{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    go-musicfox
  ];
  home.file = {
    ".config/go-musicfox" = {
      source = ../../cfg-dotf/${cfg.configname}/go-musicfox;
      recursive = true;
    };
  };
}
