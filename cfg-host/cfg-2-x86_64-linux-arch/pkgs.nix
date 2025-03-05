{ system, inputs }:

rec {
  allowed-unfree-packages = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [
    "wechat-uos"
    "dingtalk"
    "qq"
  ];
  allowed-insecure-packages = [
  ];
  stable-pkgs = import inputs.nixpkgs-stable {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
    # overlays.default = [ inputs.nur.overlay ];
  };
  unstable-pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
    # overlays.default = [ inputs.nur.overlay ];
  };
}
