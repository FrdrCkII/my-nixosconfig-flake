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
    size = 1024*64;
  }];
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
}

