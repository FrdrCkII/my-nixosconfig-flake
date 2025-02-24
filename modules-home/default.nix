{ config, pkgs, lib, opt-cfg, ... }:

{
  imports = [
    ./packages.nix
    ./modules/ssh
    ./modules/zsh
    ./modules/yazi
    ./modules/kitty
    ./modules/musicfox
  ]
  ++lib.optionals (builtins.elem "kde" opt-cfg.desktop) [
    ./desktop/kde
  ]
  ++lib.optionals (builtins.elem "hyprland" opt-cfg.desktop) [
    ./desktop/hyprland
    ./modules/rofi
  ];
  programs.home-manager.enable = true;
  home = {
    username = "${opt-cfg.username}";
    homeDirectory = "/home/${opt-cfg.username}";
    stateVersion = "25.05";
  };
  programs.git = {
    enable = true;
    userName = "${opt-cfg.gitname}";
    userEmail = "${opt-cfg.gitmail}";
    signing.format = "ssh";
  };
}
