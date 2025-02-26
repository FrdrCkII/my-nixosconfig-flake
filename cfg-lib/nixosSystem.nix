{ cfg-host }:let
      system = cfg-host.system;
      cfg = cfg-host;
      specialArgs = {
        inherit inputs cfg;
      };
    in nixpkgs.lib.nixosSystem {
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
        ]);
    };