{ config, pkgs, ... }:
{
  ### DESKTOP ENVIRONMENT ### 
  services.xserver = {
    enable = true;

    # GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # # PANTHEON #
    # displayManager.lightdm.enable = true;
    # desktopManager = {
    #   pantheon = {
    #     enable = true;
    #     debug = false;
    #     # extraWingpanelIndicators = "";
    #     # extraSwitchboardPlugs = "";
    #     # extraGSettingsOverrides = "";
    #     # extraGSettingsOverridePackages = "";
    #   };
    # programs.pantheon-tweaks.enable = true;
    # environment.pantheon.excludePackages = [];
    # services.xserver.desktopManager.pantheon.extraGSettingsOverridePackages = [];
    # };

    # # XFCE & QTILE
    # desktopManager = 
    # {
    #   default = "xfce";
    #   xfce =
    #   {
    #     enable = true;
    #     enableXfwm = false;
    #     noDesktop = true;
    #   };
    #   xterm.enable = true;
    # };
    # windowManager.qtile.enable = true;

    desktopManager.cinnamon.enable = false;
    desktopManager.mate.enable = false;
    desktopManager.xfce.enable = false;
  };

  # ## HYPRLAND ##
  # programs = {
  #   hyprland = {
  #     enable = true;
  #     package = [];
  #     xwayland = {
  #       enable = true;
  #       hidpi = true;
  #     };
  #     nvidiaPatches = false;
  #   };
  # };

  environment.gnome.excludePackages = (with pkgs;
  [ gnome-photos  gnome-tour ]) 
  ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
}
