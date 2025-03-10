{ config, lib, pkgs, ... }:

{
  # config = {
  #   environment.systemPackages = with pkgs; [
  #     lact
  #   ];
  #   # systemd.services = {
  #   #   lactd = {
  #   #     enable = true;
  #   #     unitConfig = {
  #   #       Description = "AMDGPU Control Daemon";
  #   #       After = [ "multi-user.target" ];
  #   #     };
  #   #     serviceConfig = {
  #   #       Environment = "";
  #   #       ExecStart = "lact daemon";
  #   #       Nice = "-10";
  #   #       Restart = "on-failure";
  #   #     };
  #   #     wantedBy = [ "multi-user.target" ];
  #   #   };
  #   # };
  #   systemd.packages = with pkgs; [ lact ];
  #   systemd.services.lactd.wantedBy = ["multi-user.target"];
  # };
}
