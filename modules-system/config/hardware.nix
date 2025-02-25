{ config, lib, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.pulseaudio = {
    enable = true;
  };
}
