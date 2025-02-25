{ pkgs-conf }:

{
  MyNixOSPC = with pkgs-conf; rec {
    hostname = "c2h5oc2h4";
    configname = "cfg-1-x86_64-linux-nixos";
    config = (import ./${configname}/options.nix {
      pkgs = unstable-pkgs;
      stable-pkgs = stable-pkgs;
    }).config;
  };
}
