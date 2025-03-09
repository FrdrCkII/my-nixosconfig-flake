{ config, pkgs, lib, cfg, ... }: let 
  home-modules = with pkgs; [
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
    ./modules/mako.nix
    ./modules/rofi.nix
    ./modules/waybar.nix
  ]
  ++ lib.optionals (builtins.elem "kde" cfg.opt.desktop) [
    ./desktop/kde.nix
  ]
  ++ lib.optionals (builtins.elem "xfce" cfg.opt.desktop) [
    ./desktop/xfce.nix
  ];
in {
  imports = home-modules;
  programs.home-manager.enable = true;
  home = {
    username = cfg.opt.username;
    homeDirectory = "/home/${cfg.opt.username}";
    stateVersion = cfg.opt.HomeManagerVersion;
  };
  programs.git = {
    enable = true;
    userName = cfg.opt.gitname;
    userEmail = cfg.opt.gitmail;
    signing.format = "ssh";
  };
}
