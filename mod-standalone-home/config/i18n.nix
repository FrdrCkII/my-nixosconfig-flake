{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    material-design-icons
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
