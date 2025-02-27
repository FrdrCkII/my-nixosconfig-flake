{ inputs, config, pkgs, lib, cfg, ... }:

{
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;

    policies = {
      DisablePocket = true;
      DisplayBookmarksToolbar = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
    };

    profiles.FrdrCkII = {
      id = 0;
      isDefault = true;
      name = "FrdrCkII";
      settings = {
        "intl.locale.requested" = "zh-CN";
        "browser.search.separatePrivateDefault" = false;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "network.trr.mode" = 5;
        "dom.security.https_first" = true;
      };
      extensions = with inputs.firefox-addons; [
        firefoxPackages.zh-cn
      ];
      search = {
        default = "cnbing";
        force = true;
        engines = {
          "cnbing" = {
            urls = [
              {
                template = "https://cn.bing.com";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@g" ];
          };
          "SearXNG" = {
            urls = [
              {
                template = "http://100.108.113.89:8100";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@sx" ];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = false;
        };
      };
    };
  };
}
