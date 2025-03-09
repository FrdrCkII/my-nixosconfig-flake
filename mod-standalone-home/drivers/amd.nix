{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    mesa
    driversi686Linux.mesa
    lact
  ];
  # systemd.user.services.lactd = {
  #   Unit = {
  #     Description = "LACT Daemon";
  #   };
  #   Service = {
  #     ExecStart = "";
  #   };
  #   Install = {
  #     WantedBy = [ "default.target" ];
  #   };
  # };
}
