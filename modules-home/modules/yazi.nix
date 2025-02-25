{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];
  # home.file = {
  #   ".config/yazi" = {
  #     source = ../../config-dotfiles/${configname}/yazi;
  #     recursive = true;
  #   };
  # };
}
