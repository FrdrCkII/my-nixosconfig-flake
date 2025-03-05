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
  };
in {
  nixosConfigurations = with cfg; {
    "${test.hostname}" = system-gen.nixos { cfg = test; };
    "${MyNixOSPC.hostname}" = system-gen.nixos { cfg = MyNixOSPC; };
  };
  homeConfigurations = with cfg; {
    "${MyArchPC.hostname}" = system-gen.home-manager { cfg = MyArchPC; };
  };
}