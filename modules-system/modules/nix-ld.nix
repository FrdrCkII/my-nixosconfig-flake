{ config, pkgs, lib, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc
      zlib
      openssl
      libGL
      xorg.libX11
    ];
  };
}