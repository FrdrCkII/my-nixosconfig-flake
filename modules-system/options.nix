{ config, lib, pkgs, opt-cfg, ... }:

{
  options.opt-cfg = {
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
      type = lib.types.listOf lib.types.attrs;
      default = [ pkgs.linuxPackages ];
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
    (lib.mkIf (opt-cfg.SystemVersion != null) {
      system.stateVersion = opt-cfg.SystemVersion;
    })
    (lib.mkIf (opt-cfg.SystemChannel != null) {
      system.autoUpgrade.channel = opt-cfg.SystemChannel;
    })
    (lib.mkIf (opt-cfg.KernelPackages != []) {
      boot.kernelPackages = opt-cfg.KernelPackages;
    })
    (lib.mkIf (opt-cfg.rootpw != null) {
      users.users.root.hashedPassword = opt-cfg.rootpw;
    })
    (lib.mkIf (opt-cfg.userpw != null) {
      users.users.${opt-cfg.username}.hashedPassword = opt-cfg.userpw;
    })
  ];
}
