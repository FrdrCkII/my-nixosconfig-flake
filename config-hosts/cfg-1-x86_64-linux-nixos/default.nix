# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, opt-cfg, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
  ];
  system.stateVersion = "25.05";
  system.autoUpgrade.channel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
  boot.kernelPackages = pkgs.linuxPackages_zen;
  programs.zsh.enable = true;
  users.users.${opt-cfg.username} = {
    shell = pkgs.zsh;
  };
}
