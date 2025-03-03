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
      systemd-boot = {
        enable = true;
        consoleMode = "keep";
      };
    };
    kernelParams = [
      "video=1920x1080@60"
      "loglevel=5"
      "nowatchdog"
    ];
  };
}
