{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  home.file = {
    ".config/kitty" = {
      source = ../../cfg-dotf/${cfg.configname}/kitty;
      recursive = true;
    };
  };
}
