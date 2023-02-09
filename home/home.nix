{ config, pkgs, ... }:

let
  username = "alfurqani";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

in
{
  home.username = "alfurqani";
  home.homeDirectory = "/home/alfurqani";
  home.stateVersion = "23.05";

  imports = [
    ./alacritty
    ./aria2
    ./fzf
    ./git
    ./kitty
    ./mpv
    ./neovim
    ./packages
    ./shell
    ./tmux
    ./yt-dlp
  ];

  xdg = {
    inherit configHome;
    enable = true;
  };

  home = {
    packages = with pkgs; [
      # javaCup  dbus_java  maven  dotnet-sdk  dotnet-runtime  glib  lua  xdg-desktop-portal  xdg-desktop-portal-wlr  dbus  nodejs  nodePackages_latest.npm  nodePackages.npm  yarn  jq  nim  nimble-unwrapped

      # ascii
      # atool
      # audacious
      # bat
      # cargo
      # cmatrix
      # darktable
      # dbus
      # electron
      # exa
      # firewalld
      # font-manager
      # gnupg
      # gparted
      # input-remapper
      # kitty-themes
      # libsForQt5.dolphin
      # libreoffice
      # inkscape
      # mdds  # need by libreoffice
      # nomacs
      # notepadqq
      # okular
      # onlyoffice-bin
      # pcmanfm
      # pfetch
      # plank
      # protonvpn-cli
      # protonvpn-gui
      # python310Packages.protonvpn-nm-lib
      # qbittorrent
      # shotwell
      # subdl
      # speedtest-cli
      # trash-cli
      # ueberzug
      # wpsoffice
      # libtiff  # need by wpsoffice
      # xorg.xkill

      # # python
      # python310Packages.dbus-python  
      # python310Full    
      # python310Packages.pip  
      # python310Packages.urllib3
      # python310Packages.types-urllib3
      # python310Packages.soupsieve
      # python310Packages.idna
      # python310Packages.certifi
      # python310Packages.requests
      # python310Packages.beautifulsoup4
      # python310Packages.soupsieve

      # # an
      # hakuneko
      # yacreader
      # anime-downloader
      # anup
      # adl
      # filebot
      # nhentai
      # HentaiAtHome

      # # share
      # opendrop

      # # social
      # discord
      # whatsapp-for-linux
      # mailspring
      # headset
      # giara
      # slack
      # tdesktop
      # weechat
      # element-web
      # element-desktop
      # schildichat-web
      # # twitter-archive https://github.com/jarulsamy/Twitter-Archive
      # python310Packages.tweepy
      # python310Packages.charset-normalizer
      # python310Packages.urllib3
      # python310Packages.tqdm
      # python310Packages.python-dotenv
      # python310Packages.oauthlib
      # python310Packages.idna
      # python310Packages.certifi
      # python310Packages.requests
      # python310Packages.requests-oauthlib

      # # audio
      # wireplumber
      # easyeffects
      # pipewire
      # # pipewire-media-session
      # ninja
      # ffmpeg
      # freac  boca

      # # archiver
      # archiver
      # xarchiver
      # fsarchiver
      # zip
      # unrar
      # p7zip
      # unzip

      # # network
      # adguardhome
      # tor
      # dnscrypt-proxy2
      # openssl

      # # media player
      # vlc
      # cmus
      # cmusfm
      # cava
      # streamlink
      # python310Packages.deemix  
      # python310Packages.deezer-py  
      # python310Packages.deezer-python  
      # nuclear
      # spotify
      # spotify-tui
      # termusic
      # yewtube

      # # terminal
      # git
      # ranger
      # joshuto
      # deer
      # pistol
      # terminal-typeracer
      # vim
      # neovim-remote
      # page
      # duf
      # spacevim
      # nvimpager
      # neovide
      # uivonim
      # z-lua
      # peco
      # autojump
      # pazi
      # fasd
      # yank
      # xsel
      # xclip
      # mov-cli
      # vifm
      # # vifm-full
      # wget
      # # alternative man tools / unix documentation
      # bro
      # cheat  # Create and view interactive cheatsheets on the command-line
      # cht-sh  # CLI client for cheat.sh, a community driven cheat sheet
      # navi  # An interactive cheatsheet tool for the command-line and application launchers
      # tldr  # Simplified and community-driven man pages
      # tealdeer  # A very fast implementation of tldr in Rust
      # wiki-tui  # A simple and easy to use Wikipedia Text User Interface
      # fltrdr  # A TUI text reader for the terminal

      # # text editor
      # geany
      # obsidian
      # vscode-with-extensions 

      # # nix
      # nix
      # nix-index
      # nix-prefetch
      # nix-prefetch-hg
      # nix-prefetch-git
      # nix-prefetch-github
      # nix-prefetch-scripts
      # nix-prefetch-docker

      # # browser
      # firefox
      # librewolf
      # brave
      # chromium
      # tor-browser-bundle-bin
      # google-chrome
      # opera

      # # downloader
      # yt-dlp
      # youtube-dl 
      # ytmdl
      # httpie
      # python310Packages.httpie
      # uget
      # uget-integrator
      # axel 
      # downonspot  # A spotify downloader writter in rust
      # spotdl  # Download your Spotify playlists and songs along with album art and metadata
      # # motrix  # handle by flatpak

      # # productive
      # simplenote
      # standardnotes
      # joplin
      # joplin-desktop
      # kanboard

      # # cloud drive
      # rclone
      # rclone-browser

      # # usb bootable
      # woeusb
      # woeusb-ng
      # etcher
      # ventoy-bin
      # unetbootin
      # ntfs3g
      # fd

      # # # pantheon package
      # # pantheon.switchboard
      # # pantheon-tweaks
      # # pantheon.wingpanel
      # # pantheon.wingpanel-indicator-a11y
      # # pantheon.wingpanel-with-indicators
      # # pantheon.wingpanel-indicator-network

      # # cinnamon package
      # cinnamon.nemo

      # # xfce package
      # xfce.ristretto
      # xfce.thunar
      # xfce.thunar-archive-plugin
      # xfce.tumbler

      # # qt package
      # libsForQt5.dolphin
      # libsForQt5.kturtle

      # # shell
      # zsh
      # bashInteractive

      # # configuration dotfiles
      # home-manager
      # rcm

      # # terminal display system information
      # btop
      # htop
      # neofetch
      # bottom
      # checkip
      # freshfetch
      # ipfetch
      # hyfetch
      # pridefetch

      # # virtual machine
      # anbox
      # waydroid
      # flatpak
      # gnome.gnome-boxes
      # vmware-workstation
      # virtualbox
      # qemu
      # qemu_kvm
      # qtemu
      # # virtualboxWithExtpack
      # libreelec-dvb-firmware
      # kodi
      # kodi-gbm
      # kodi
      # docker  
      # docker-compose
      # wine
      # wine64
      # playonlinux
      # bottles
      # darling-dmg  # Darling lets you open macOS dmgs on Linux
      # android-tools  # Android SDK platform tools
      # adb-sync  # A tool to synchronise files between a PC and an Android devices using ADB (Android Debug Bridge)
      # adbfs-rootless  # Mount Android phones on Linux with adb, no root required
      # gnirehtet  # Reverse tethering over adb for Android
      # autoadb  # Execute a command whenever a device is adb-connected
      # usbmuxd  # A socket daemon to multiplex connections from and to iOS devices

      # # gnome extensions
      # gnomeExtensions.simple-system-monitor
      # gnomeExtensions.tilingnome
      # gnomeExtensions.window-state-manager

      # # appimage
      # appimagekit
      # appimage-run
    ];
    ## keyboard ##
    keyboard = 
    {
      layout = "us";
      variant = "qwerty";
      options = 
      [
        "grp:win_space_toggle"
        "grp:caps_toggle,grp_led:scroll"
      ];
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
