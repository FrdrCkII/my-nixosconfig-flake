{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      lact
    ];
    systemd.services = {
      lactd = {
        enable = true;
        serviceConfig = {
          ExecStart = "lact daemon";
          Nice = "-10";
          Restart = "on-failure";
        };
        wantedBy = [ "system-manager.target" ];
      };
    };
  };
}
