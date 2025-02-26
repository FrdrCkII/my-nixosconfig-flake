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
      ../../mod-system/modules/caddy.nix
      ../../mod-system/modules/nix-ld.nix
      ../../mod-system/modules/steam.nix
    ];
    SystemPackages = with pkgs; [
      btrfs-assistant
      p7zip-rar
      fastfetch
      nix-tree
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
      ../../mod-home/modules/just.nix
      ../../mod-home/modules/kitty.nix
      ../../mod-home/modules/musicfox.nix
      ../../mod-home/modules/ssh.nix
      ../../mod-home/modules/vscode.nix
      ../../mod-home/modules/yazi.nix
      ../../mod-home/modules/zsh.nix
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