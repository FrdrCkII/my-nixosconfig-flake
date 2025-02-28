{
  config, lib, pkgs,
  allowed-unfree-packages,
  allowed-insecure-packages,
  cfg,
  ...
}: let 
  system-modules = with pkgs; [
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/nix.nix
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
  ]
  ++ lib.optionals (builtins.elem "xfce-hypr" cfg.opt.desktop) [
    ./desktop/xfce-hypr.nix
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
