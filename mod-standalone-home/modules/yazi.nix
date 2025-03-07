{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];
  # home.file = {
  #   ".config/yazi" = {
  #     source = ../../cfg-dotf/${cfg.configname}/yazi;
  #     recursive = true;
  #   };
  # };
}
