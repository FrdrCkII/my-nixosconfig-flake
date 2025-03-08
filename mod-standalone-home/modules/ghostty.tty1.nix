{ config, pkgs, lib, cfg, ... }:

{
  home.file = {
    ".local/bin/cagetty.sh" = {
      source = ../../cfg-dotf/${cfg.configname}/cagetty.sh;
    };
  };
  programs.zsh.profileExtra = ''
    if [ -z "$\{WAYLAND_DISPLAY\}" ] && [ "$\(tty\)" = "/dev/tty1" ]; then
      ~/.local/bin/start-cage.sh
    fi
  '';
}
