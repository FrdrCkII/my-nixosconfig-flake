{ config, lib, pkgs, cfg, ... }:

{
  options.cfg.opt = {
    non-nixos = lib.mkOption {
      type = lib.types.nullOr lib.types.bool;
      default = false;
      description = "other linux distro";
    };
  };
  config = lib.mkMerge [
    (lib.mkIf ( cfg.opt.is-otherlinux == true ) {
      targets.genericLinux.enable = true;
    })
  ];
}
