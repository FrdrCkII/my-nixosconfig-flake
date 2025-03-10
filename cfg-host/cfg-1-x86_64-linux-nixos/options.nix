{ pkgs, stable-pkgs, nur, ... }:

{
  options = rec {
    is-nixos = true;
    username = "FrdrCkII";
    rootpw = "$y$j9T$YHvpqmryW6Uk4LsBPj3S41$bAMv6EQYDOrQ3kAagjf.2TPFndEAuEjllKFeFrBlfM9";
    userpw = "$y$j9T$fenbjjJWwGfICJPdwhI561$3Aiwlijs42HSUNPptXm444QDxBrWI9rPwFrOmqcqo2.";
    gitname = "FrdrCkII";
    gitmail = "c2h5oc2h4@outlook.com";
    drivers = [
      "amd"
    ];
    desktop = [
      "hyprland"
      "kde"
    ];

    SystemVersion = "25.05";
    SystemChannel = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable";
    KernelPackages = pkgs.linuxPackages_zen;
    NixOSPackages = with pkgs; [
      btrfs-assistant
      snapper
      p7zip-rar
      fastfetch
      nix-tree
    ];

    NixldLibs = with pkgs; [
      glibc
      zlib
      libz
      openssl
      libGL
      xorg.libX11
      icu
      skia
    ];

    HomeManagerVersion = "25.05";
    HomePackages = with pkgs; [
      libreoffice
      ffmpeg gimp
      brave
      motrix
      wine-staging
      winePackages.fonts
      wine64Packages.fonts
      wineWowPackages.fonts
      wineWow64Packages.fonts
      winetricks
      prismlauncher
      wechat-uos qq
    ];

    SystemPackages = with pkgs; [

    ];
  };
}