{ pkgs-conf }:

{
  test = with pkgs-conf; rec {
    hostname = "test";
    configname = "cfg-0-test-null";
    config = (import ./${configname}/options.nix {
      pkgs = unstable-pkgs;
      stable-pkgs = stable-pkgs;
    }).config;
  };
  MyNixOSPC = with pkgs-conf; rec {
    hostname = "c2h5oc2h4";
    configname = "cfg-1-x86_64-linux-nixos";
    config = (import ./${configname}/options.nix {
      pkgs = unstable-pkgs;
      stable-pkgs = stable-pkgs;
    }).config;
  };
}
