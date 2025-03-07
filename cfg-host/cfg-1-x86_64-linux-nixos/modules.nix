{ system, inputs }:

{
  modules = rec {
    sysytem-modules = [
      ./system
      ./../mod-nixos
      ./../mod-nixos/config/boot.nix
      # ./../mod-nixos/config/boot.systemd-boot.nix
      ./../mod-nixos/config/hardware.nix
      ./../mod-nixos/config/i18n.nix
      ./../mod-nixos/config/nix.nix
      # ./../mod-nixos/modules/caddy.nix
      ./../mod-nixos/modules/caddy.old.nix
      ./../mod-nixos/modules/clash.nix
      # ./../mod-nixos/modules/nginx.nix
      ./../mod-nixos/modules/nix-ld.nix
      ./../mod-nixos/modules/steam.nix
    ];
    home-modules = [
      ../../mod-nixos-home
      ../../mod-nixos-home/modules/firefox.nix
      ../../mod-nixos-home/modules/just.nix
      ../../mod-nixos-home/modules/kitty.nix
      ../../mod-nixos-home/modules/musicfox.nix
      ../../mod-nixos-home/modules/ssh.nix
      ../../mod-nixos-home/modules/vscode.nix
      ../../mod-nixos-home/modules/yazi.nix
      ../../mod-nixos-home/modules/zsh.nix
    ];
  };
}