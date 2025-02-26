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
        gfxpayloadEfi = lib.mkDefault "keep";
        configurationName = lib.mkDefault "NixOS";
      };
    };
    kernelParams = [
      "video=1920x1080@60"
      "loglevel=5"
      "nowatchdog"
    ];
  };
}
