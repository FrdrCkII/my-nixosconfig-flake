{ config, pkgs, lib, cfg, ... }:

{
  home.packages = with pkgs; [
    just
  ];
}
