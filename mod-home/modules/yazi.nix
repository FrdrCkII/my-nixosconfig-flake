{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];
  # home.file = {
  #   ".config/yazi" = {
  #     source = ../../cfg-dotfiles/${configname}/yazi;
  #     recursive = true;
  #   };
  # };
}
