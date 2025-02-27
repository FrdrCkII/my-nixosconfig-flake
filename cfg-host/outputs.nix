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
  system-gen = import ../cfg-lib/nixosSystem.nix {
    inherit inputs cfg lib;
  };
in {
  nixosConfigurations = with cfg; {
    "${test.hostname}" = system-gen { cfg = test; };
    "${MyNixOSPC.hostname}" = system-gen { cfg = MyNixOSPC; };
  };
}