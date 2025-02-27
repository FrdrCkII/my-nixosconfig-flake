{ config, lib, pkgs, cfg, ... }:

{
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs = {
    hyprlock.enable = true;
    hyprland = {
      enable = true;
      withUWSM = false;
    };
  };
  environment.systemPackages = with pkgs; [
    ddcutil
  ];
  # boot.kernelModules = [ "i2c-dev" ];
  # services.udev.extraRules = ''
  #   KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  # '';
  # users.users.${cfg.opt.username}.extraGroups = [ "i2c" ];
}
