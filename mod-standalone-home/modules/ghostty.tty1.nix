{ config, pkgs, lib, cfg, ... }:

{
  home.file = {
    ".local/bin/cagetty.sh" = {
      source = ../../cfg-dotf/${cfg.configname}/cagetty.sh;
    };
  };
  programs.zsh.profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      ~/.local/bin/cagetty.sh
    fi
  '';
}
