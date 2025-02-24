{ config, lib, pkgs, ... }:

{
  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
