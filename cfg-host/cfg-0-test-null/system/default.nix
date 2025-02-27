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
