# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # <home-manager/nixos>
  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      timeout = 3;
    };
  };

  # boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_2;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_10;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_stable.zfs;
  services.xserver.videoDrivers = [];

  ## networking ##
  networking = {
    hostName = "nixos";
    # hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # ## PROXY ##
    # # Configure network proxy if necessary
    # proxy.allProxy = "http://192.168.49.1:8000";
    # proxy.httpProxy = "http://192.168.49.1:8000";
    # proxy.httpsProxy = "http://192.168.49.1:8000";
    # proxy.default = "http://192.168.49.1:8000";
    # proxy.ftpProxy = "http://192.168.49.1:8000";
    # proxy.rsyncProxy = "http://192.168.49.1:8000";
    # # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager = {
      enable = true;
      # dns = "dnsmasq";  # one of "default", "dnsmasq", "unbound", "systemd-resolved", "none"
      # enableStrongSwan = true;
    };
  };

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.utf8";
    LC_IDENTIFICATION = "id_ID.utf8";
    LC_MEASUREMENT = "id_ID.utf8";
    LC_MONETARY = "id_ID.utf8";
    LC_NAME = "id_ID.utf8";
    LC_NUMERIC = "id_ID.utf8";
    LC_PAPER = "id_ID.utf8";
    LC_TELEPHONE = "id_ID.utf8";
    LC_TIME = "id_ID.utf8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  ### DESKTOP ENVIRONMENT ### 
  services.xserver = {
    enable = true;

    # GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # # PANTHEON #
    # displayManager.lightdm.enable = true;
    # desktopManager = 
    # {
    #   pantheon = 
    #   {
    #     enable = true;
    #     debug = false;
    #     # extraWingpanelIndicators = "";
    #     # extraSwitchboardPlugs = "";
    #     # extraGSettingsOverrides = "";
    #     # extraGSettingsOverridePackages = "";
    #   };
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
  
  # Configure keymap in X11
  console.useXkbConfig = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "ctrl:swapcaps";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  ### service ###
  services = {
    # ## adguardhome ##
    # adguardhome = 
    # {
    #   enable = true;
    #   openFirewall = true;
    #   settings =
    #   {
    #     dns =
    #     {
    #       bind_host = 
    #         # "1.1.1.1";
    #         "173.245.48.0";
    #     
    #       bind_port = "20";

    #       # query logging
    #       querylog_enabled = true;
    #       querylog_file_enabled = true;
    #       querylog_interval = "24h";
    #       querylog_size_memory = 1000;   # entries
    #       anonymize_client_ip = true;   # for now

    #       # adguard
    #       protection_enable = true;
    #       blocking_mode = "default";
    #       filtering_enable = true;

    #       # cloudflare DNS
    #       cloudflare.dns =
    #       [
    #         "1.1.1.1"
    #         "1.0.0.1"
    #       ];

    #       # caching
    #       cache_size = 536870912;  # 512 MB
    #       cache_ttl_min = 1800;    # 30 min
    #       cache_optimistic = true; # return stale and then refresh
    #     };
    #   };
    # };

    ## DNSCRYPT-PROXY2 ##
    dnscrypt-proxy2 = {
      enable = true;
      upstreamDefaults = true;
      settings = {
        sources.public-resolvers = {
          urls = [ "https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.md" ];
          cache_file = "public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          refresh_delay = 72;
        };
      };
    };

    ## CLOUDFLARE-CFDYNDNS ##
    cfdyndns = {
      enable = true;
      email = "syifa.alfurqoni@gmail.com";
      apikeyFile = "b471ab42b2489466d2477f86c9205cfaecd16";  # Global API Key
      # apikeyFile = "v1.0-09b4cfce06f682b668b66023-77c6005c9c09f946f0938929d87513c0543df963ea4c5d450a2b1129452610ef536e3ef1509446c5ad1363be9122c5b537dde4a5426f8a3ea7a6bf24d101a2d268ab75a49a4ff6db46";
    };  # Origin CA Key
  };


  ## USERS ##

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.alfurqani = { 
      isNormalUser = true;
      description = "4LEND";
      extraGroups = [ "networkmanager" "wheel" ];
      useDefaultShell = true;
    };
    # Default Shells
    defaultUserShell = pkgs.fish;
  };

  # packages = with pkgs; [
  # ];

  ### PROGRAMS CONFIGURATION ###

  virtualisation.docker ={
    enable = true;
  };

  ## PROGRAMS ##
  programs = {
    # ## PANTHEON ##
    # pantheon-tweaks.enable = true;
    fish.enable = true;

    ## THEFUCK ##
    thefuck = {
      enable = true;
      alias = "";
    };

    ## AUTOJUMP ##
    autojump.enable = true;
  };

  ### FONTS ### 
  fonts = 
  {
    enableDefaultFonts = true;
    fonts = with pkgs; 
    [
      ( nerdfonts.override { fonts = [ "JetBrainsMono" "CodeNewRoman" "SpaceMono" ]; })
      nerd-font-patcher
      comic-mono
      comic-neue
      comic-relief
      noto-fonts
      noto-fonts-extra
      noto-fonts-emoji
      vistafonts
      helvetica-neue-lt-std
      victor-mono
      ibm-plex
      smiley-sans  # A condensed and oblique Chinese typeface seeking a visual balance between the humanist and the geometric
      lxgw-wenkai  # An open-source Chinese font derived from Fontworks' Klee One
      lexend  # A variable font family designed to aid in reading proficiency
      comfortaa
      lexend
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
	      emoji		=  [ "nerdfonts" ];
        monospace	=  [ "JetBrains Mono NL Regular Nerd Font Complete" ];
        sansSerif	=  [ "JetBrains Mono NL Regular Nerd Font Complete" ];
        serif		=  [ "JetBrains Mono NL Regular Nerd Font Complete" ];
        # monospace	=  [ "ComicMono" ];
        # sansSerif	=  [ "ComicMono" ];
        # serif		=  [ "ComicMono" ];
	      # emoji		=  [ "Material-Design-Icons" ];
      };
    };
  };


  ### PACKAGES ###
  environment = 
  {
    variables = 
    {
      EDITOR = "nvim";
      VISUAL = "nvim"; 
    };

    # EXCLUDE GNOME PACKAGE
    gnome.excludePackages = (with pkgs; 
    [
    gnome-photos
    gnome-tour
    ]) ++ (with pkgs.gnome; [
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

  };

  # NIXPKGS CONFIG
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"  # etcher
		"python-2.7.18.6"
	];

  nixpkgs.config = { allowUnfree = true; };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
   services.flatpak.enable = true;
   xdg.portal.enable = true;
   xdg.portal.wlr.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall.enable = true;

  ### SYSTEM CONFIGURATION ## 
  system = {
    stateVersion = "nixos-unstable"; 
    autoUpgrade = { 
      enable = true;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    sshServe = {
      enable = true;
      keys = []; 
    };
  };
}
