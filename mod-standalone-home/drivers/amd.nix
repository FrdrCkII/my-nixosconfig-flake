{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    lact
  ];
  systemd.user.services.lactd = {
    Unit = {
      Description = "AMDGPU Control Daemon";
      After = [ "multi-user.target" ];
    };
    Service = {
      ExecStart = "lact daemon";
      Nice = "-10";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "multi-user.target" ];
    };
  };
}
