{ inputs, config, pkgs, lib, cfg, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];
    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
  };
}
