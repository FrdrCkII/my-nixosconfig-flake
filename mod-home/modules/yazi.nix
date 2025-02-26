{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];
  # home.file = {
  #   ".config/yazi" = {
  #     source = ../../cfg-dotf/${configname}/yazi;
  #     recursive = true;
  #   };
  # };
}
