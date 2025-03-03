{ config, lib, pkgs, cfg, ... }: let 
  system-modules = with pkgs; [
    ./options.nix
    ./packages.nix
  ]
  ++ lib.optionals (builtins.elem "amd" cfg.opt.drivers) [
    ./drivers/amd.nix
  ]
  ++ lib.optionals (builtins.elem "nvidia" cfg.opt.drivers) [
    ./drivers/nvidia.nix
  ]
  ++ lib.optionals (builtins.elem "hyprland" cfg.opt.desktop) [
    ./desktop/hyprland.nix
  ]
  ++ lib.optionals (builtins.elem "kde" cfg.opt.desktop) [
    ./desktop/kde.nix
  ]
  ++ lib.optionals (builtins.elem "xfce" cfg.opt.desktop) [
    ./desktop/xfce.nix
  ];
in {
  imports = system-modules;
  networking.hostName = cfg.hostname;
  networking.networkmanager.enable = true;
  nixpkgs.config = {
    allowUnfreePredicate = cfg.pkg.allowed-unfree-packages;
    permittedInsecurePackages = cfg.pkg.allowed-insecure-packages;
  };
  users.users.${cfg.opt.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
