{ config, lib, pkgs, cfg, ... }:

{
  imports = [
    
  ];
  programs.zsh.enable = true;
  users.users.${cfg.opt.username} = {
    shell = pkgs.zsh;
  };
}
