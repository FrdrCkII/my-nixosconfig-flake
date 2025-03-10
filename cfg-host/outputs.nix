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
  system-manager = import ../cfg-lib/systemManager.nix {
    inherit inputs lib cfg;
  };
in {
  nixosConfigurations = with cfg; {
    "${test.hostname}" = nixos { cfg = test; };
    "${nixos-pc.hostname}" = nixos { cfg = nixos-pc; };
  };
  homeConfigurations = with cfg; {
    "${arch-pc.hostname}" = home-manager { cfg = arch-pc; };
  };
  systemConfigs = with cfg; {
    "${nixos-pc.hostname}" = system-manager { cfg = nixos-pc; };
    "${arch-pc.hostname}" = system-manager { cfg = arch-pc; };
  };
}