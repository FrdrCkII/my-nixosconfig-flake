{ config, pkgs, lib, opt-cfg, ... }:

{
  imports = [
    ./modules/kitty.nix
    ./modules/musicfox.nix
    ./modules/ssh.nix
    ./modules/vscode.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
    ./packages.nix
  ]
  ++lib.optionals (builtins.elem "hyprland" opt-cfg.desktop) [
    ./desktop/hyprland.nix
    ./modules/mako.nix
    ./modules/rofi.nix
    ./modules/waybar.nix
  ]
  ++lib.optionals (builtins.elem "kde" opt-cfg.desktop) [
    ./desktop/kde.nix
  ]
  ++lib.optionals (builtins.elem "xfce" opt-cfg.desktop) [
    ./desktop/xfce.nix
  ];
  programs.home-manager.enable = true;
  home = {
    username = opt-cfg.username;
    homeDirectory = "/home/${opt-cfg.username}";
    stateVersion = opt-cfg.HomeManagerVersion;
  };
  programs.git = {
    enable = true;
    userName = opt-cfg.gitname;
    userEmail = opt-cfg.gitmail;
    signing.format = "ssh";
  };
}
