{ system, inputs }:

{
  modules = rec {
    sysytem-modules = [
      ./system
      # ../../mod-system-manager
      # ../../mod-system-manager/config/boot.nix
      # ../../mod-system-manager/config/hardware.nix
      # ../../mod-system-manager/config/i18n.nix
      # ../../mod-system-manager/config/nix.nix
      # ../../mod-system-manager/modules/clash.nix
      # ../../mod-system-manager/modules/steam.nix
    ];
    home-modules = [
      ../../mod-home
      ../../mod-home/modules/aria2.nix
      ../../mod-home/modules/kitty.nix
      ../../mod-home/modules/musicfox.nix
      ../../mod-home/modules/ssh.nix
      ../../mod-home/modules/yazi.nix
      ../../mod-home/modules/zsh.nix
    ];
  };
}