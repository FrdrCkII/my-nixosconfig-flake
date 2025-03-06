{ config, pkgs, lib, cfg, ... }:

{
  services.nginx = {
    enable = true;
    user = "${cfg.opt.username}";
    virtualHosts = {
      # 主 GitHub 代理
      "github.local" = {
        # 如果要使用 HTTPS 需要配置证书，这里演示 HTTP
        listen = [{ addr = "127.0.0.1"; port = 80; }];
        
        locations."/" = {
          proxyPass = "https://github.com";
          proxySSLVerify = false;  # 跳过 SSL 验证（不建议但常用）
          extraConfig = ''
            proxy_set_header Host "github.com";
            proxy_ssl_server_name on;
            resolver 8.8.8.8;  # 使用可靠 DNS
          '';
        };
      };

      # API 端点代理
      "api.github.local" = {
        listen = [{ addr = "127.0.0.1"; port = 80; }];
        locations."/" = {
          proxyPass = "https://api.github.com";
          extraConfig = ''
            proxy_set_header Host "api.github.com";
            proxy_ssl_server_name on;
          '';
        };
      };

      # Raw 内容代理
      "raw.githubusercontent.local" = {
        listen = [{ addr = "127.0.0.1"; port = 80; }];
        locations."/" = {
          proxyPass = "https://raw.githubusercontent.com";
          extraConfig = ''
            proxy_set_header Host "raw.githubusercontent.com";
            proxy_ssl_server_name on;
          '';
        };
      };
    };
  };
  networking.extraHosts = ''
  
  '';
}
