{
  system,
  nixpkgs,
  nixpkgs-stable,
  nur,
  ...
}:
rec {
  SysModPath = "../../modules-system/modules";
  HomeModPath = "../../modules-home/modules";
  allowed-unfree-packages = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
    "amdgpu-pro"

    "xow_dongle-firmware"
    "steam-unwrapped"
    "steam"

    "p7zip-rar"
    "p7zip"
    "microsoft-edge"
    "vscode"
    
    "wechat-uos"
    "dingtalk"
    "qq"
  ];
  allowed-insecure-packages = [
  ];
  stable-pkgs = import nixpkgs-stable {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
  };
  unstable-pkgs = import nixpkgs {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
  };
}
