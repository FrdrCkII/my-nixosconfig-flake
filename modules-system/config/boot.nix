{ config, lib, pkgs, ... }:

{
  boot = {
    enableContainers = false;
    supportedFilesystems = {
      btrfs = true;
    };
    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = lib.mkDefault "/boot";
      grub = {
        enable = true;
        device = lib.mkDefault "nodev";
        efiSupport = lib.mkDefault true;
        gfxmodeEfi = lib.mkDefault "1920x1080";
        configurationName = lib.mkDefault "NixOS";
      };
    };
    kernelParams = [
      "splash"
      "loglevel=5"
      "nowatchdog"
    ];
  };
}
