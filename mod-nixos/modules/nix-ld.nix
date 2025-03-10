{ inputs, config, pkgs, lib, cfg, ... }: let
  nix-ld-libraries = with pkgs; [
    stdenv.cc.cc
  ]
  ++ cfg.opt.NixldLibs;
in {
  programs.nix-ld = {
    enable = true;
    libraries = nix-ld-libraries;
  };
  environment.systemPackages = with inputs.nix-alien.packages.${cfg.system}; [
    nix-alien
  ];
}
