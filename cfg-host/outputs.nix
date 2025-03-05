{
  self,
  nixpkgs,
  nixpkgs-stable,
  nur,
  home-manager,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  cfg = import ../cfg-host {
    inherit inputs;
  };
  nixos = import ../cfg-lib/nixosSystem.nix {
    inherit inputs lib cfg;
  };
  home-manager = import ../cfg-lib/homeManager.nix {
    inherit inputs lib cfg;
  };
in {
}
  ++ ( lib.optionals cfg.opt.is-nixos {
    nixosConfigurations = with cfg; {
      "${test.hostname}" = nixos { cfg = test; };
      "${NixOSPC.hostname}" = nixos { cfg = NixOSPC; };
    };
  })
  ++ ( lib.optionals cfg.opt.is-otherlinux {
    homeConfigurations = with cfg; {
      "${ArchPC.hostname}" = home-manager { cfg = ArchPC; };
    };
  })