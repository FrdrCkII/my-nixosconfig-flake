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
  networking.extraHosts = ''
36.152.44.93  www.baidu.com  bd.c
65.49.68.152 *pixiv.net pi.cn
  '';
}
