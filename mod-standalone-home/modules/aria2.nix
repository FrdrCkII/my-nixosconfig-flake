{ config, pkgs, lib, cfg, ... }:

{
  home.file = {
    ".aria2" = {
      source = ../../cfg-dotf/${cfg.configname}/aria2;
      recursive = true;
    };
  };
  systemd.user.services.aria2cd = {
    Unit = {
      Description = "Aria2 Daemon";
    };
    Service = {
      ExecStart = "/usr/bin/aria2c --conf-path=/home/${cfg.opt.username}/.aria2/aria2.conf";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
