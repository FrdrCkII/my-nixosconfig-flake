{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];
  # home.file = {
  #   ".config/yazi" = {
  #     source = ./yazi;
  #     recursive = true;
  #   };
  # };
}
