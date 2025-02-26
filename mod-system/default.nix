{
  config, lib, pkgs,
  allowed-unfree-packages,
  allowed-insecure-packages,
  hostname,
  configname,
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
  ++ cfg.opt.SystemModules
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
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  nixpkgs.config = {
    allowUnfreePredicate = allowed-unfree-packages;
    permittedInsecurePackages = allowed-insecure-packages;
  };
  users.users.${cfg.opt.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
