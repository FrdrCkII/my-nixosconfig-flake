{ config, lib, pkgs, ... }:

{
  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;
    experimental-features = [
      "flakes"
      "nix-command"
      "ca-derivations"
    ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
  nix.gc = lib.mkDefault {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  boot.loader.systemd-boot.configurationLimit = lib.mkDefault 10;
  boot.loader.grub.configurationLimit = lib.mkDefault 10;
}
