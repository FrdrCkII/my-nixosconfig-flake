{ system, inputs }:

{
  modules = rec {
    sysytem-modules = [
      ./system
      ../../mod-system-manager
    ];
    home-modules = [
      ./home
      ../../mod-standalone-home
      ../../mod-standalone-home/modules/aria2.nix
      ../../mod-standalone-home/modules/ghostty.nix
      ../../mod-standalone-home/modules/ghostty.tty1.nix
      ../../mod-standalone-home/modules/musicfox.nix
      ../../mod-standalone-home/modules/ssh.nix
      ../../mod-standalone-home/modules/yazi.nix
      ../../mod-standalone-home/modules/zsh.nix
    ];
  };
}