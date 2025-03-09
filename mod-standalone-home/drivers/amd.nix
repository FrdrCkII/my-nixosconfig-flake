{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
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
