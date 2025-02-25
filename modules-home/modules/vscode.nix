{ config, pkgs, lib, configname, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      github.vscode-pull-request-github

      jnoortheen.nix-ide
      tboby.cwtools-vscode
    ];
  };
}
