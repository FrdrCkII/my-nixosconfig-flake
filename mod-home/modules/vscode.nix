{ config, pkgs, lib, cfg, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      github.vscode-pull-request-github
      jnoortheen.nix-ide
    ];
  };
}
