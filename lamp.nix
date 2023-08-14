{ config, pkgs, lib, ... }:
{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.httpd = {
    enable = true;
    adminAddr = "syifa.alfurqonii@protonmail.com";
    enablePHP = true; # oof... not a great idea in my opinion
  };

  services.httpd.virtualHosts."www" = {
    # documentRoot = "/run/systemd/unit-root/var/mysql"; 
    documentRoot = "/var/www/html";
    # want ssl + a let's encrypt certificate? add `forceSSL = true;` right here
    # enableACME = true;
  };

  services.mysql = {
    enable = true;
    package = pkgs.mysql;
    dataDir = "/run/systemd/unit-root/var/mysql";
  };

  users = {
    mysql = {
      enable = true;
      user = "alfurqani";
      host = "localhost";
      database = "auth";
      passwordFile = "/run/secrets/mysql-auth-db-passwd";

      nss = {
        # getgrent = null;
      };

      pam = {
        table = "users";
        userColumn = "username";
        passwordColumn = "password";
        passwordCrypt = "sha256";
      };
    };
  };

  # hacky way to create our directory structure and index page... don't actually use this
  systemd.tmpfiles.rules = [
    "d /var/www/example.org"
    "f /var/www/example.org/index.php - - - - <?php phpinfo();"
  ];
}
