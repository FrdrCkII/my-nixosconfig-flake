{ system, inputs }: let 
  sysModDir = ../../mod-nixos;
  homeModDir = ../../mod-nixos-home;
in {
  modules = rec {
    sysytem-modules = [
      ./system
      ${sysModDir}
      ${sysModDir}/config/boot.nix
      # ${sysModDir}/config/boot.systemd-boot.nix
      ${sysModDir}/config/hardware.nix
      ${sysModDir}/config/i18n.nix
      ${sysModDir}/config/nix.nix
      # ${sysModDir}/modules/caddy.nix
      ${sysModDir}/modules/caddy.old.nix
      ${sysModDir}/modules/clash.nix
      # ${sysModDir}/modules/nginx.nix
      ${sysModDir}/modules/nix-ld.nix
      ${sysModDir}/modules/steam.nix
    ];
    home-modules = [
      ${homeModDir}
      ${homeModDir}/modules/firefox.nix
      ${homeModDir}/modules/just.nix
      ${homeModDir}/modules/kitty.nix
      ${homeModDir}/modules/musicfox.nix
      ${homeModDir}/modules/ssh.nix
      ${homeModDir}/modules/vscode.nix
      ${homeModDir}/modules/yazi.nix
      ${homeModDir}/modules/zsh.nix
    ];
  };
}