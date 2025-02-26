{ config, pkgs, lib, configname, ... }:

{
  home.packages = with pkgs; [
    just
  ];
}
