{ config, pkgs, lib, cfg, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];

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
        "dom.security.https_first" = true;
      };
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          localeCDN
        ];
      };
      search = {
        default = "CNBing";
        force = true;
        engines = {
          "CNBing" = {
            urls = [{
              template = "https://cn.bing.com";
              params = [{
                name = "q";
                value = "{searchTerms}";
              }];
            }];
            definedAliases = [ "@g" ];
          };
          "NixOptions" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
          "NixPackages" = {
            urls = [{
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
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Baidu".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = true;
        };
      };
    };
  };
}
