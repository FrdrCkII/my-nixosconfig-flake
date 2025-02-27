{ config, lib, pkgs, cfg, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    i2c = {
      enable = true;
      group = [  ];
    };
  };
  services.pipewire = {
    enable = true;
  };
}
