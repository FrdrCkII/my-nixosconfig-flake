{ config, lib, pkgs, cfg, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    i2c = {
      enable = true;
      group = [ "${cfg.opt.username}" ];
    };
  };
  services.pipewire = {
    enable = true;
  };
}
