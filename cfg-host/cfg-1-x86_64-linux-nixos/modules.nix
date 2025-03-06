{ system, inputs }:

{
  modules = rec {
    sysytem-modules = [
      ./system
      ../../mod-nixos
      ../../mod-nixos/config/boot.nix
      # ../../mod-nixos/config/boot.systemd-boot.nix
      ../../mod-nixos/config/hardware.nix
      ../../mod-nixos/config/i18n.nix
      ../../mod-nixos/config/nix.nix
      # ../../mod-nixos/modules/caddy.nix
      ../../mod-nixos/modules/caddy.old.nix
      ../../mod-nixos/modules/clash.nix
      # ../../mod-nixos/modules/nginx.nix
      ../../mod-nixos/modules/nix-ld.nix
      ../../mod-nixos/modules/steam.nix
    ];
    home-modules = [
      ../../mod-home
      ../../mod-home/modules/firefox.nix
      ../../mod-home/modules/just.nix
      ../../mod-home/modules/kitty.nix
      ../../mod-home/modules/musicfox.nix
      ../../mod-home/modules/ssh.nix
      ../../mod-home/modules/vscode.nix
      ../../mod-home/modules/yazi.nix
      ../../mod-home/modules/zsh.nix
    ];
  };
}