{
  nixpkgs,
  nixpkgs-stable,
  nur,
  ...
}:

{
  test = rec {
    hostname = "test";
    configname = "cfg-0-test-null";
    system = "x86_64-linux";
    cfg-pkgs = import ./${configname}/pkgs.nix {
      inherit system;
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    config = (import ./${configname}/options.nix {
      pkgs = cfg-pkgs.unstable-pkgs;
      stable-pkgs = cfg-pkgs.stable-pkgs;
    }).config;
  };

  MyNixOSPC = rec {
    hostname = "c2h5oc2h4";
    configname = "cfg-1-x86_64-linux-nixos";
    system = "x86_64-linux";
    cfg-pkgs = import ./${configname}/pkgs.nix {
      inherit system;
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    config = (import ./${configname}/options.nix {
      pkgs = cfg-pkgs.unstable-pkgs;
      stable-pkgs = cfg-pkgs.stable-pkgs;
    }).config;
  };
}
