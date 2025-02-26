{ config, pkgs, lib, opt-cfg, ... }: let
  nix-ld-libraries = with pkgs; [
  ]
  ++ opt-cfg.NixldLibs;
in {
  programs.nix-ld = {
    enable = true;
    libraries = nix-ld-libraries;
  };
}
