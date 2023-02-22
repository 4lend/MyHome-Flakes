{
  services = {
    blueman-applet.enable = true; 
    network-manager-applet.enable = true;
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
