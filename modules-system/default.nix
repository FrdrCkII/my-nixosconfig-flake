{
  config, lib, pkgs,
  allowed-unfree-packages,
  allowed-insecure-packages,
  hostname,
  configname,
  opt-cfg,
  ...
}: let 
  system-modules = with pkgs; [
    ../config-hosts/${configname}
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/nix.nix
    ./options.nix
    ./packages.nix
  ]
  ++ opt-cfg.SystemModules
  ++ lib.optionals (builtins.elem "hyprland" opt-cfg.desktop) [
    ./desktop/hyprland.nix
    ./modules/mako.nix
    ./modules/rofi.nix
    ./modules/waybar.nix
  ]
  ++ lib.optionals (builtins.elem "amd" opt-cfg.drivers) [
    ./drivers/amd.nix
  ]
  ++ lib.optionals (builtins.elem "nvidia" opt-cfg.drivers) [
    ./drivers/nvidia.nix
  ]
  ++ lib.optionals (builtins.elem "hyprland" opt-cfg.desktop) [
    ./desktop/hyprland.nix
  ]
  ++ lib.optionals (builtins.elem "kde" opt-cfg.desktop) [
    ./desktop/kde.nix
  ]
  ++ lib.optionals (builtins.elem "xfce" opt-cfg.desktop) [
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
  users.users.${opt-cfg.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
