{ system, inputs }:

{
  modules = rec {
    home-modules = [
      ../../mod-home
      ../../mod-home/modules/aria2.nix
      ../../mod-home/modules/just.nix
      ../../mod-home/modules/kitty.nix
      ../../mod-home/modules/musicfox.nix
      ../../mod-home/modules/ssh.nix
      ../../mod-home/modules/yazi.nix
      ../../mod-home/modules/zsh.nix
    ];
  };
}