{
  config,
  lib,
  pkgs,
  allowed-unfree-packages,
  allowed-insecure-packages,
  hostname,
  configname,
  opt-cfg,
  ...
}:

{
  imports = [
    ../config-hosts/${configname}
    ./packages.nix
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/nix.nix
    ./desktop/xfce.nix
    ./modules/caddy.nix
    ./modules/steam.nix
  ]
  ++lib.optionals (builtins.elem "amd" opt-cfg.drivers) [
    ./drivers/amd.nix
  ]
  ++lib.optionals (builtins.elem "nvidia" opt-cfg.drivers) [
    ./drivers/nvidia.nix
  ]
  ++lib.optionals (builtins.elem "hyprland" opt-cfg.desktop) [
    ./desktop/hyprland.nix
  ]
  ++lib.optionals (builtins.elem "kde" opt-cfg.desktop) [
    ./desktop/kde.nix
  ]
  ++lib.optionals (builtins.elem "xfce" opt-cfg.desktop) [
    ./desktop/xfce.nix
  ];
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;
  nixpkgs.config = {
    allowUnfreePredicate = allowed-unfree-packages;
    permittedInsecurePackages = allowed-insecure-packages;
  };
  users.users.root.hashedPassword = "${opt-cfg.rootpw}";
  users.users.${opt-cfg.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "${opt-cfg.userpw}";
  };
}
