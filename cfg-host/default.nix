{ inputs }:

{
  test = rec {
    hostname = "test";
    configname = "cfg-0-test-null";
    system = "x86_64-linux";
    pkg = import ./${configname}/pkgs.nix {
      inherit system inputs;
    };
    opt = ( import ./${configname}/options.nix {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
      nur = pkg.nur;
    }).options;
    mod = ( import ./${configname}/modules.nix {
      inherit system inputs;
    }).modules;
  };

  NixOSPC = rec {
    hostname = "c2h5oc2h4";
    configname = "cfg-1-x86_64-linux-nixos";
    system = "x86_64-linux";
    pkg = import ./${configname}/pkgs.nix {
      inherit system inputs;
    };
    opt = ( import ./${configname}/options.nix {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
      nur = pkg.nur;
    }).options;
    mod = ( import ./${configname}/modules.nix {
      inherit system inputs;
    }).modules;
  };

  ArchPC = rec {
    hostname = "arch";
    configname = "cfg-2-x86_64-linux-arch";
    system = "x86_64-linux";
    pkg = import ./${configname}/pkgs.nix {
      inherit system inputs;
    };
    opt = ( import ./${configname}/options.nix {
      pkgs = pkg.unstable-pkgs;
      stable-pkgs = pkg.stable-pkgs;
    }).options;
    mod = ( import ./${configname}/modules.nix {
      inherit system inputs;
    }).modules;
  };

}
