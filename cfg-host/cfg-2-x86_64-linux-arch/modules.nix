{ system, inputs }: let 
  sysModDir = ../../mod-system-manager;
  homeModDir = ../../mod-standalone-home;
in {
  modules = rec {
    sysytem-modules = [
      ./system
      ${sysModDir}
    ];
    home-modules = [
      ${homeModDir}
      ${homeModDir}/modules/aria2.nix
      ${homeModDir}/modules/kitty.nix
      ${homeModDir}/modules/musicfox.nix
      ${homeModDir}/modules/ssh.nix
      ${homeModDir}/modules/yazi.nix
      ${homeModDir}/modules/zsh.nix
    ];
  };
}