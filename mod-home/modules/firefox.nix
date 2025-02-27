{ config, pkgs, lib, cfg, ... }: let
  mozilla-overlays = fetchTarball {
      url = https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz;
  };
in {
  nixpkgs.overlays = [ (import "${mozilla-overlays}/firefox-overlay.nix") ];
  xdg.configFile."nixpkgs/config.nix".source = mozilla-overlays;
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];
    package = pkgs.latest.firefox-nightly-bin;
  };
}
