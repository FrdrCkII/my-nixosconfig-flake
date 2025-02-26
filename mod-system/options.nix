{ config, lib, pkgs, cfg, ... }:

{
  options.cfg.opt = {
    systemVersion = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = "25.05";
      description = "system state version";
    };
    SystemChannel = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "system channel";
    };
    KernelPackages = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = pkgs.linuxPackages;
      description = "kernel packages";
    };
    rootpw = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "root hashed password";
    };
    userpw = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "user hashed password";
    };
  };
  config = lib.mkMerge [
    (lib.mkIf (cfg.opt.SystemVersion != null) {
      system.stateVersion = cfg.opt.SystemVersion;
    })
    (lib.mkIf (cfg.opt.SystemChannel != null) {
      system.autoUpgrade.channel = cfg.opt.SystemChannel;
    })
    (lib.mkIf (cfg.opt.KernelPackages != null) {
      boot.kernelPackages = cfg.opt.KernelPackages;
    })
    (lib.mkIf (cfg.opt.rootpw != null) {
      users.users.root.hashedPassword = cfg.opt.rootpw;
    })
    (lib.mkIf (cfg.opt.userpw != null) {
      users.users.${cfg.opt.username}.hashedPassword = cfg.opt.userpw;
    })
  ];
}
