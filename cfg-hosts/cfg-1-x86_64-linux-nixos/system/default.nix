{ config, lib, pkgs, opt-cfg, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
  ];
  programs.zsh.enable = true;
  users.users.${opt-cfg.username} = {
    shell = pkgs.zsh;
  };
}
