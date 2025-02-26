# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, cfg, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
  ];
  programs.zsh.enable = true;
  users.users.${cfg.opt.username} = {
    shell = pkgs.zsh;
  };
}
