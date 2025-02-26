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
    hosts-conf = import ./cfg-hosts {
      inherit nixpkgs;
      inherit nixpkgs-stable;
      inherit nur;
    };
    system-gen = { host-conf }: nixpkgs.lib.nixosSystem {
      system = host-conf.system;
      specialArgs = {
        inherit inputs;
        allowed-unfree-packages = host-conf.cfg-pkgs.allowed-unfree-packages;
        allowed-insecure-packages = host-conf.cfg-pkgs.allowed-insecure-packages;
        hostname = host-conf.hostname;
        configname = host-conf.configname;
        opt-cfg = host-conf.config;
      };
      modules = [
        ./mod-system
        ./cfg-hosts/${host-conf.configname}/system
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${host-conf.config.username} = import ./mod-home;
          home-manager.extraSpecialArgs =  {
            inherit inputs;
            allowed-unfree-packages = host-conf.cfg-pkgs.allowed-unfree-packages;
            allowed-insecure-packages = host-conf.cfg-pkgs.allowed-insecure-packages;
            hostname = host-conf.hostname;
            configname = host-conf.configname;
            opt-cfg = host-conf.config;
          };
        }
      ];
    };
  in {
    nixosConfigurations = with hosts-conf; {
      "${test.hostname}" = system-gen { host-conf = test; };
      "${MyNixOSPC.hostname}" = system-gen { host-conf = MyNixOSPC; };
    };
  };
}