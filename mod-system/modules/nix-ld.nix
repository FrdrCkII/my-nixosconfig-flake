{ config, pkgs, lib, cfg, ... }: let
  nix-ld-libraries = with pkgs; [
  ]
  ++ cfg.opt.NixldLibs;
in {
  programs.nix-ld = {
    enable = true;
    libraries = nix-ld-libraries;
  };
}
