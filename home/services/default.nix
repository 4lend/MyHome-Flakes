{
  services = {
    network-manager-applet.enable = true;
    blueman-applet.enable = true; 
    gpg-agent = {
      enable = true;
      enableBashIntegration = true; 
      enableFishIntegration = true;
      enableSshSupport = true;
      # sshKeys = '' '';
      grabKeyboardAndMouse = true;
      pinentryFlavor = "gnome3" ;
    }; 
  };
}
