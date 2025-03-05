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
  system-gen = import ../cfg-lib {
    inherit inputs cfg lib;
    pkgs = cfg.pkg.unstable-pkgs;
  };
in {
  nixosConfigurations = with cfg; {
    "${test.hostname}" = system-gen.nixos { cfg = test; };
    "${NixOSPC.hostname}" = system-gen.nixos { cfg = NixOSPC; };
  };
  homeConfigurations = with cfg; {
    "${ArchPC.hostname}" = system-gen.home-manager { cfg = ArchPC; };
  };
}