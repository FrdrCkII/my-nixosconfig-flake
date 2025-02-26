{
  config, lib, pkgs,
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
    ./config/boot.nix
    ./config/hardware.nix
    ./config/i18n.nix
    ./config/nix.nix
    ./modules/caddy.nix
    ./modules/nix-ld.nix
    ./modules/steam.nix
    ./packages.nix
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
  config = lib.mkMerge [
    (lib.mkIf (opt-cfg.SystemVersion != null) {
      system.stateVersion = opt-cfg.SystemVersion;
    })
    (lib.mkIf (opt-cfg.SystemChannel != null) {
      system.autoUpgrade.channel = opt-cfg.SystemChannel;
    })
    (lib.mkIf (opt-cfg.kernelPackages != null) {
      boot.kernelPackages = opt-cfg.KernelPackages;
    })
    (lib.mkIf (opt-cfg.rootpw != null) {
      users.users.root.hashedPassword = opt-cfg.rootpw;
    })
    (lib.mkIf (opt-cfg.userpw != null) {
      users.users.${opt-cfg.username}.hashedPassword = opt-cfg.userpw;
    })
  ];
}
