{ pkgs, stable-pkgs, ... }:

{
  config = rec {
    username = "FrdrCkII";
    rootpw = "$y$j9T$YHvpqmryW6Uk4LsBPj3S41$bAMv6EQYDOrQ3kAagjf.2TPFndEAuEjllKFeFrBlfM9";
    userpw = "$y$j9T$fenbjjJWwGfICJPdwhI561$3Aiwlijs42HSUNPptXm444QDxBrWI9rPwFrOmqcqo2.";
    gitname = "FrdrCkII";
    gitmail = "c2h5oc2h4@outlook.com";
    drivers = [
      "amd"
    ];
    desktop = [
      "xfce"
      "hyprland"
    ];

    SystemVersion = "25.05";
    SystemChannel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
    KernelPackages = pkgs.linuxPackages_zen;
    SystemModules = [
      ./modules/caddy.nix
      ./modules/nix-ld.nix
      ./modules/steam.nix
    ];
    SystemPackages = with pkgs; [
      btrfs-assistant
      p7zip-rar
      fastfetch
    ];

    NixldLibs = with pkgs; [
      glibc
      zlib
      openssl
      libGL
      xorg.libX11
    ];

    HomeManagerVersion = "25.05";
    HomeModules = [
      ./modules/just.nix
      ./modules/kitty.nix
      ./modules/musicfox.nix
      ./modules/ssh.nix
      ./modules/vscode.nix
      ./modules/yazi.nix
      ./modules/zsh.nix
    ];
    HomePackages = with pkgs; [
      libreoffice
      ffmpeg
      gimp

      microsoft-edge
      motrix
      
      wechat-uos
      qq
      
      prismlauncher
    ];
  };
}