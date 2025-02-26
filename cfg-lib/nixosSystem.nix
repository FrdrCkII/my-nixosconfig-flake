{
  inputs,
  lib,
  system,
  genSpecialArgs,
  nixos-modules,
  home-modules ? [],
  specialArgs ? (genSpecialArgs system),
  cfg,
  ...
}: let
  inherit ( inputs ) nixpkgs home-manager;
in nixpkgs.lib.nixosSystem {
  inherit system specialArgs;
  modules =
    nixos-modules
    ++ ( lib.optionals ( ( lib.lists.length home-modules ) > 0 ) [
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "home-manager.backup";
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users."${cfg.opt.username}".imports = home-modules;
      }
    ]);
}

{ cfg-host }: let
  system = cfg-host.system;
  cfg.opt = cfg-host.config;
  cfg-mod = cfg-host.modules;
  specialArgs = {
    inherit inputs;
    allowed-unfree-packages = cfg-host.cfg-pkgs.allowed-unfree-packages;
    allowed-insecure-packages = cfg-host.cfg-pkgs.allowed-insecure-packages;
    hostname = cfg-host.hostname;
    configname = cfg-host.configname;
    cfg.opt = cfg-host.config;
  };
in nixpkgs.lib.nixosSystem {
  inherit system specialArgs;
  modules = 
    cfg-mod.nixos-modules
    ++ ( lib.optionals ( ( lib.lists.length cfg-mod.home-modules ) > 0 ) [
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "home-manager.backup";
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users."${cfg.opt.username}".imports = cfg-mod.home-modules;
      }
    ]);
}
