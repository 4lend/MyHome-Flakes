{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    };
  };

  hardware.bluetooth = {
    enable = true;
    hsphfpd.enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
   };
  };

  services.blueman.enable = true;

  systemd.services.upower.enable = true;

}

