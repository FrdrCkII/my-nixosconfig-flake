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
    pkg = import ./${configname}/pkgs.nix {
      inherit system;
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    mod = (import ./${configname} {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
    }).modules;
    opt = (import ./${configname} {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
    }).options;
  };

  MyNixOSPC = rec {
    hostname = "c2h5oc2h4";
    configname = "cfg-1-x86_64-linux-nixos";
    system = "x86_64-linux";
    pkg = import ./${configname}/pkgs.nix {
      inherit system;
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    mod = (import ./${configname} {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
    }).modules;
    opt = (import ./${configname} {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
    }).options;
  };
}
