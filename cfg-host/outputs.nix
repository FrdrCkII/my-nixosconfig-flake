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
  nixosConfigurations = with cfg; {
    "${test.hostname}" = nixos { cfg = test; };
    "${NixOSPC.hostname}" = nixos { cfg = NixOSPC; };
  };
  homeConfigurations = with cfg; {
    "${ArchPC.hostname}" = home-manager { cfg = ArchPC; };
  };
}