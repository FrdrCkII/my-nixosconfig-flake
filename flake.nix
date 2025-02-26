{
  description = "Frederick's NixOS Flake";

  nixConfig = {
    experimental-features = [
      "flakes"
      "nix-command"
      "ca-derivations"
    ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # outputs = inputs: import ./flakes/output.nix inputs;

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Stable
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    # NUR
    nur.url = "github:nix-community/NUR";
    # HomeManager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nur,
    home-manager,
    ...
  } @inputs: let
    cfg-host = import ./cfg-host {
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    cfg-lib = import ./cfg-lib;
    system-gen = { cfg-host }:let
      system = cfg-host.system;
      cfg = cfg-host;
      specialArgs = {
        inherit inputs cfg;
      };
    in nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = 
        cfg.mod.nixos-modules
        ++ [
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "home-manager.backup";
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users."${cfg.opt.username}".imports = cfg.mod.home-modules;
          }
        ];
    };
  in {
    nixosConfigurations = with cfg-host; {
      "${test.hostname}" = system-gen { cfg-host = test; };
      "${MyNixOSPC.hostname}" = system-gen { cfg-host = MyNixOSPC; };
    };
  };
}