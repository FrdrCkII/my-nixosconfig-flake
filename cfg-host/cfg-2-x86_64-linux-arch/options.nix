{ pkgs, stable-pkgs, nur, ... }:

{
  options = rec {
    is-otherlinux = true;
    username = "FrdrCkII";
    # rootpw = "$y$j9T$YHvpqmryW6Uk4LsBPj3S41$bAMv6EQYDOrQ3kAagjf.2TPFndEAuEjllKFeFrBlfM9";
    # userpw = "$y$j9T$fenbjjJWwGfICJPdwhI561$3Aiwlijs42HSUNPptXm444QDxBrWI9rPwFrOmqcqo2.";
    gitname = "FrdrCkII";
    gitmail = "c2h5oc2h4@outlook.com";
    drivers = [
      "amd"
    ];
    desktop = [
      
    ];

    HomeManagerVersion = "25.05";
    HomePackages = with pkgs; [
      libreoffice gimp
      wechat-uos qq
    ];

    SystemPackages = with pkgs; [
      fastfetch
      nix-tree
    ];
  };
}