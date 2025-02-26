{ config, pkgs, lib, cfg, ... }:

{
  environment.systemPackages = with pkgs; [
    caddy nssTools
  ];
  systemd.services = {
    caddy = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "Steam & Github Reverse Proxy";
      serviceConfig = {
        WorkingDirectory = "/home/${cfg.opt.username}/tools/SteamDeck_302";
        ExecStart = "${pkgs.caddy}/bin/caddy run --config steamcommunity_302.caddy.json --adapter caddyfile";
      };
    };
  };
  security.pki.certificateFiles = [
    /home/${cfg.opt.username}/tools/SteamDeck_302/steamcommunityCA.pem
  ];
  networking.extraHosts = ''
    127.0.0.1 steamcommunity.com
    127.0.0.1 www.steamcommunity.com
    127.0.0.1 store.steampowered.com
    127.0.0.1 checkout.steampowered.com
    127.0.0.1 api.steampowered.com
    127.0.0.1 help.steampowered.com
    127.0.0.1 login.steampowered.com
    127.0.0.1 store.akamai.steamstatic.com
    127.0.0.1 steambroadcast.akamaized.net
    127.0.0.1 steamvideo-a.akamaihd.net
    127.0.0.1 steamusercontent-a.akamaihd.net
    127.0.0.1 steamstore-a.akamaihd.net
    127.0.0.1 steamcommunity-a.akamaihd.net
    127.0.0.1 steamcdn-a.akamaihd.net
    127.0.0.1 steamuserimages-a.akamaihd.net
    127.0.0.1 community.akamai.steamstatic.com
    127.0.0.1 avatars.akamai.steamstatic.com
    127.0.0.1 community.steamstatic.com
    127.0.0.1 cdn.akamai.steamstatic.com
    127.0.0.1 avatars.steamstatic.com
    127.0.0.1 shared.akamai.steamstatic.com
    127.0.0.1 clan.akamai.steamstatic.com
    127.0.0.1 cdn.cloudflare.steamstatic.com
    127.0.0.1 community.cloudflare.steamstatic.com
    127.0.0.1 store.cloudflare.steamstatic.com
    127.0.0.1 avatars.cloudflare.steamstatic.com
    127.0.0.1 clan.cloudflare.steamstatic.com
    127.0.0.1 shared.cloudflare.steamstatic.com
    127.0.0.1 www.google.com
    127.0.0.1 steam-chat.com
    127.0.0.1 github.com
    127.0.0.1 www.github.com
    127.0.0.1 gist.github.com
    127.0.0.1 api.github.com
    127.0.0.1 raw.github.com
    127.0.0.1 raw.githubusercontent.com
    127.0.0.1 camo.githubusercontent.com
    127.0.0.1 cloud.githubusercontent.com
    127.0.0.1 avatars.githubusercontent.com
    127.0.0.1 avatars0.githubusercontent.com
    127.0.0.1 avatars1.githubusercontent.com
    127.0.0.1 avatars2.githubusercontent.com
    127.0.0.1 avatars3.githubusercontent.com
    127.0.0.1 private-user-images.githubusercontent.com
    127.0.0.1 user-images.githubusercontent.com
    127.0.0.1 github-releases.githubusercontent.com
    127.0.0.1 objects.githubusercontent.com
    127.0.0.1 analytics.githubassets.com
    127.0.0.1 assets-cdn.github.com
    127.0.0.1 github.githubassets.com
    127.0.0.1 support-assets.githubassets.com
    127.0.0.1 codeload.github.com
    127.0.0.1 pages.github.com
    127.0.0.1 docs.github.com
    127.0.0.1 services.github.com
    127.0.0.1 resources.github.com
    127.0.0.1 developer.github.com
    127.0.0.1 partner.github.com
    127.0.0.1 desktop.github.com
    127.0.0.1 support.github.com
    127.0.0.1 education.github.com
    127.0.0.1 enterprise.github.com
    127.0.0.1 lab.github.com
    127.0.0.1 classroom.github.com
    127.0.0.1 central.github.com
    127.0.0.1 desktop.githubusercontent.com
    127.0.0.1 guides.github.com
    127.0.0.1 copilot.github.com
    127.0.0.1 github.io
    127.0.0.1 www.github.io
    127.0.0.1 *.github.io #[Please change the prefix to support github.io]
    127.0.0.1 store-images.s-microsoft.com
    127.0.0.1 images-eds.xboxlive.com
    127.0.0.1 static.wikia.nocookie.net
    127.0.0.1 img.wikia.nocookie.net
    127.0.0.1 img1.wikia.nocookie.net
    127.0.0.1 img2.wikia.nocookie.net
    127.0.0.1 img3.wikia.nocookie.net
    127.0.0.1 img4.wikia.nocookie.net
    127.0.0.1 img5.wikia.nocookie.net
    127.0.0.1 images.wikia.nocookie.net
    127.0.0.1 images1.wikia.nocookie.net
    127.0.0.1 images2.wikia.nocookie.net
    127.0.0.1 images3.wikia.nocookie.net
    127.0.0.1 images4.wikia.nocookie.net
    127.0.0.1 images5.wikia.nocookie.net
    127.0.0.1 vignette.wikia.nocookie.net
    127.0.0.1 vignette1.wikia.nocookie.net
    127.0.0.1 vignette2.wikia.nocookie.net
    127.0.0.1 vignette3.wikia.nocookie.net
    127.0.0.1 vignette4.wikia.nocookie.net
    127.0.0.1 vignette5.wikia.nocookie.net
    127.0.0.1 steamcloud-ugc.storage.googleapis.com
    127.0.0.1 cdn.jsdelivr.net
    127.0.0.1 www.youtube.com
    127.0.0.1 xgpuweb.gssv-play-prod.xboxlive.com
    127.0.0.1 xsts.auth.xboxlive.com
    127.0.0.1 xgpuwebf2p.gssv-play-prod.xboxlive.com
    127.0.0.1 xhome.gssv-play-prod.xboxlive.com
    127.0.0.1 steamcloud-eu-ams.storage.googleapis.com
    127.0.0.1 steamcloud-eu-fra.storage.googleapis.com
    127.0.0.1 steamcloud-finland.storage.googleapis.com
    127.0.0.1 steamcloud-saopaulo.storage.googleapis.com
    127.0.0.1 steamcloud-singapore.storage.googleapis.com
    127.0.0.1 steamcloud-sydney.storage.googleapis.com
    127.0.0.1 steamcloud-taiwan.storage.googleapis.com
    127.0.0.1 steamcloud-eu.storage.googleapis.com
    127.0.0.1 ajax.googleapis.com
    127.0.0.1 assets1.xboxlive.com
    127.0.0.1 assets2.xboxlive.com
    127.0.0.1 xvcf1.xboxlive.com
    127.0.0.1 xvcf2.xboxlive.com
    127.0.0.1 download.epicgames.com
    127.0.0.1 download2.epicgames.com
    127.0.0.1 download3.epicgames.com
    127.0.0.1 download4.epicgames.com
    127.0.0.1 epicgames-download1.akamaized.net
    127.0.0.1 fastly-download.epicgames.com
    127.0.0.1 mega.io
    127.0.0.1 www.mega.io
    127.0.0.1 blog.mega.io
    127.0.0.1 help.mega.io
    127.0.0.1 transparency.mega.io
    127.0.0.1 mega.nz
    127.0.0.1 help.mega.nz
    127.0.0.1 g.api.mega.co.nz
    127.0.0.1 eu.api.mega.co.nz
    127.0.0.1 store.st.dl.eccdnx.com
    127.0.0.1 media.st.dl.eccdnx.com
    127.0.0.1 avatars.st.dl.eccdnx.com
    127.0.0.1 clan.st.dl.eccdnx.com
    127.0.0.1 video.st.dl.eccdnx.com
    127.0.0.1 shared.st.dl.eccdnx.com

    104.16.0.100 nexusmods.com #UHE_
    104.16.0.100 www.nexusmods.com #UHE_
    104.16.0.100 cf-files.nexusmods.com #UHE_
    104.16.0.100 skyrim.nexusmods.com #UHE_
    104.16.0.100 forums.nexusmods.com #UHE_
    104.16.0.100 xcom.nexusmods.com #UHE_
    104.16.0.100 staticdelivery.nexusmods.com #UHE_
    104.16.0.100 static-2.nexusmods.com #UHE_
    104.16.0.100 fallout3.nexusmods.com #UHE_
    104.16.0.100 newvegas.nexusmods.com #UHE_
    104.16.0.100 static-3.nexusmods.com #UHE_
    104.16.0.100 wiki.nexusmods.com #UHE_
    104.16.0.100 dragonage.nexusmods.com #UHE_
    104.16.0.100 neverwinter.nexusmods.com #UHE_
    104.16.0.100 darksouls.nexusmods.com #UHE_
    104.16.0.100 static-6.nexusmods.com #UHE_
    104.16.0.100 xrebirth.nexusmods.com #UHE_
    104.16.0.100 grimrock.nexusmods.com #UHE_
    104.16.0.100 farcry.nexusmods.com #UHE_
    104.16.0.100 witcher.nexusmods.com #UHE_
    104.16.0.100 static-5.nexusmods.com #UHE_
    104.16.0.100 oblivion.nexusmods.com #UHE_
    104.16.0.100 static-4.nexusmods.com #UHE_
    104.16.0.100 morrowind.nexusmods.com #UHE_
    104.16.0.100 mountandblade.nexusmods.com #UHE_
    104.16.0.100 images.nexusmods.com #UHE_
    104.16.0.100 static-7.nexusmods.com #UHE_
    104.16.0.100 rd.nexusmods.com #UHE_
    104.16.0.100 tes.nexusmods.com #UHE_
    104.16.0.100 registry.nexusmods.com #UHE_
    104.16.0.100 wasteland.nexusmods.com #UHE_
    104.16.0.100 x.nexusmods.com #UHE_
    104.16.0.100 wfto.nexusmods.com #UHE_
    104.16.0.100 staticstats.nexusmods.com #UHE_
    104.16.0.100 le-15.nexusmods.com #UHE_
    104.16.0.100 users.nexusmods.com #UHE_
    104.16.0.100 dungeondefenders.nexusmods.com #UHE_
    104.16.0.100 le-4.nexusmods.com #UHE_
    104.16.0.100 logs.nexusmods.com #UHE_
    104.16.0.100 mbwithfireandsword.nexusmods.com #UHE_
    104.16.0.100 legacy-api.nexusmods.com #UHE_
    104.16.0.100 le-87.nexusmods.com #UHE_
    104.16.0.100 le-109.nexusmods.com #UHE_
    104.16.0.100 static-8.nexusmods.com #UHE_
    104.16.0.100 worldoftanks.nexusmods.com #UHE_
    104.16.0.100 static-1.nexusmods.com #UHE_
    104.16.0.100 upload.nexusmods.com #UHE_
    104.16.0.100 mbwarband.nexusmods.com #UHE_
    104.16.0.100 fallenenchantress.nexusmods.com #UHE_
    104.16.0.100 global.nexusmods.com #UHE_
    104.16.0.100 pw.nexusmods.com #UHE_
    104.16.0.100 media.nexusmods.com #UHE_
    104.16.0.100 data.nexusmods.com #UHE_
    104.16.0.100 neverwinter2.nexusmods.com #UHE_
    104.16.0.100 chivalrymw.nexusmods.com #UHE_
    104.16.0.100 le-88.nexusmods.com #UHE_
    104.16.0.100 privatebin.nexusmods.com #UHE_
    104.16.0.100 sso.nexusmods.com #UHE_
    104.16.0.100 staging.nexusmods.com #UHE_
    104.16.0.100 api.nexusmods.com #UHE_
    104.16.0.100 shadowrunreturns.nexusmods.com #UHE_
    104.16.0.100 witcher2.nexusmods.com #UHE_
    104.16.0.100 search.nexusmods.com #UHE_
    104.16.0.100 projecteternity.nexusmods.com #UHE_
    104.16.0.100 notifications.nexusmods.com #UHE_
    104.16.0.100 dragonage2.nexusmods.com #UHE_
    104.16.0.100 next.nexusmods.com #UHE_
    104.16.0.100 warden.nexusmods.com #UHE_
    104.16.0.100 le-2.nexusmods.com #UHE_
    104.16.0.100 le-49.nexusmods.com #UHE_
    104.16.0.100 forum.nexusmods.com #UHE_
    104.16.0.100 warhorse.nexusmods.com #UHE_
    104.16.0.100 le-72.nexusmods.com #UHE_
    104.16.0.100 le-41.nexusmods.com #UHE_
    104.16.0.100 file-metadata.nexusmods.com #UHE_
  '';
}