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
    inherit (inputs.nixpkgs) lib;
    cfg = import ./cfg-host {
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    system-gen = import ./cfg-lib/nixosSystem.nix;
  in {
    nixosConfigurations = with cfg; {
      "${test.hostname}" = system-gen { cfg = test; };
      "${MyNixOSPC.hostname}" = system-gen { cfg = MyNixOSPC; };
    };
  };
}