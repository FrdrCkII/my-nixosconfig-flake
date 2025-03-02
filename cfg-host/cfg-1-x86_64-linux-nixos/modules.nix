{ system, inputs }:

{
  modules = rec {
    nixos-modules = [
      ./system
      ../../mod-system
      ../../mod-system/modules/caddy.nix
      ../../mod-system/modules/clash.nix
      # ../../mod-system/modules/nginx.nix
      ../../mod-system/modules/nix-ld.nix
      ../../mod-system/modules/steam.nix
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