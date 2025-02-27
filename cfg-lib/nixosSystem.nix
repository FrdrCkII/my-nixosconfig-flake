{ inputs, lib, cfg }:
{ cfg }: let
  inherit cfg;
  inherit (inputs) nixpkgs home-manager;
  system = cfg.system;
  specialArgs = {
    inherit inputs cfg;
  };
  nur-modules = with inputs.nur.legacyPackages."${system}"; [
  ]
  ++ cfg.mod.nur-modules;
in 
nixpkgs.lib.nixosSystem {
  inherit system specialArgs;
  modules = 
    cfg.mod.nixos-modules
    ++ ( lib.optionals ( ( lib.lists.length cfg.mod.home-modules ) > 0 ) [
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "home-manager.backup";
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users."${cfg.opt.username}".imports = cfg.mod.home-modules;
      }
    ])
    ++ [
      inputs.nur.modules.nixos.default
      inputs.nur.legacyPackages."${system}".repos.iopq.modules.xraya
    ];
}