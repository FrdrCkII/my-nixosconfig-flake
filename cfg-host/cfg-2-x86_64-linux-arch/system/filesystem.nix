{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" ];
    "/var".options = [ "compress=zstd" ];
    "/root".options = [ "compress=zstd" ];
    "/swap".options = [ "compress=zstd" ];
    "/tmp".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
  };
  swapDevices = [{
    device = "/swap/swapfile";
    size = 1024*32;
  }];
  boot.kernelParams = ["resume_offset=533760"];
  boot.resumeDevice = "/dev/disk/by-uuid/41c98965-5fe7-4bf3-8803-67980a898741";
  boot.loader.efi.efiSysMountPoint = "/efi";
}
