{ config, pkgs, lib, ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = lib.mkMerge [
        ({
          hostname = "ssh.github.com";
          port = 443;
          user = "git";
          identityFile = "~/.ssh/github";
        })
      ];
    };
  };
}
