{ pkgs, config, ... }:

let
  packages = with pkgs; [
  javaCup  dbus_java  maven  glib  lua  xdg-desktop-portal  xdg-desktop-portal-wlr  dbus  nodePackages.npm  yarn  nim  jq  nodejs  

  apktool
  ascii
  atool
  audacious
  bat
  cargo
  cmatrix
  darktable
  dbus
  electron
  exa
  firewalld
  font-manager
  gnupg
  gparted
  input-remapper
  kitty-themes
  libsForQt5.dolphin
  libreoffice
  inkscape
  mdds  # need by libreoffice
  nomacs
  notepadqq
  okular
  onlyoffice-bin
  pcmanfm
  pfetch
  plank
  protonvpn-cli
  protonvpn-gui
  python310Packages.protonvpn-nm-lib
  qbittorrent
  shotwell
  subdl
  speedtest-cli
  trash-cli
  ueberzug
  wpsoffice
  libtiff  # need by wpsoffice
  xorg.xkill
  killall

  # python
  python310Packages.dbus-python  
  python310Full    
  python310Packages.pip  
  python310Packages.urllib3
  python310Packages.types-urllib3
  python310Packages.soupsieve
  python310Packages.idna
  python310Packages.charset-normalizer
  python310Packages.certifi
  python310Packages.requests
  python310Packages.beautifulsoup4
  python310Packages.soupsieve
  python310Packages.gpt-2-simple
  python310Packages.yt-dlp

  # an
  hakuneko
  yacreader
  anime-downloader
  anup
  adl
  filebot
  nhentai
  HentaiAtHome

  # share
  opendrop

  # social
  discord
  whatsapp-for-linux
  mailspring
  headset
  giara
  slack
  tdesktop
  weechat
  element-web
  element-desktop
  turses
  cawbird
  franz
  # twitter-archive https://github.com/jarulsamy/Twitter-Archive
  # python310Packages.tweepy
  # python310Packages.charset-normalizer
  # python39Packages.charset-normalizer
  # python310Packages.urllib3
  # python310Packages.tqdm
  # python310Packages.python-dotenv
  # python310Packages.oauthlib
  # python310Packages.idna
  # python310Packages.certifi
  # python310Packages.requests
  # python310Packages.requests-oauthlib

  # audio
  wireplumber
  easyeffects
  pipewire
  # pipewire-media-session
  ninja
  ffmpeg
  freac  boca

  # archiver
  archiver
  xarchiver
  fsarchiver
  zip
  unrar
  p7zip
  unzip

  # network
  adguardhome
  tor
  dnscrypt-proxy2
  openssl

  # media player
  cmus
  cmusfm
  cava
  streamlink
  python310Packages.deemix  
  python310Packages.deezer-python  
  nuclear
  spotify
  spotify-tui
  termusic
  yewtube

  # terminal
  ghq
  tig
  git-crypt
  ranger  findutils  mlocate  
  deer
  pistol
  terminal-typeracer
  vim
  neovim-remote
  page
  duf
  neovide
  z-lua
  peco
  autojump
  pazi
  fasd
  yank
  xsel
  xclip
  mov-cli
  vifm
  wget
  pinentry  # GnuPG’s interface to passphrase input | need by gnupg / gpg generate keys
  bro
  cheat  # Create and view interactive cheatsheets on the command-line
  cht-sh  # CLI client for cheat.sh, a community driven cheat sheet
  navi  # An interactive cheatsheet tool for the command-line and application launchers
  tealdeer  # A very fast implementation of tldr in Rust
  wiki-tui  # A simple and easy to use Wikipedia Text User Interface
  fltrdr  # A TUI text reader for the terminal

  # text editor
  geany
  obsidian
  vscode-with-extensions 

  # nix
  nix
  nix-index
  nix-prefetch
  nix-prefetch-hg
  nix-prefetch-git
  nix-prefetch-github
  nix-prefetch-scripts
  nix-prefetch-docker

  # browser
  firefox
  librewolf
  brave
  chromium
  tor-browser-bundle-bin
  google-chrome
  opera

  # downloader
  motrix
  yt-dlp
  youtube-dl 
  ytmdl
  httpie
  python310Packages.httpie
  uget
  uget-integrator
  axel 
  downonspot  # A spotify downloader writter in rust
  spotdl  # Download your Spotify playlists and songs along with album art and metadata
  # motrix  # handle by flatpak

  # productive
  simplenote
  standardnotes
  joplin
  joplin-desktop
  bitwarden
  bitwarden-cli

  # cloud drive
  rclone
  rclone-browser

  # usb bootable
  woeusb
  etcher
  ventoy-bin
  unetbootin
  ntfs3g
  fd

  # # pantheon package
  # pantheon.switchboard
  # pantheon-tweaks
  # pantheon.wingpanel
  # pantheon.wingpanel-indicator-a11y
  # pantheon.wingpanel-with-indicators
  # pantheon.wingpanel-indicator-network

  # cinnamon package
  cinnamon.nemo

  # qt package
  libsForQt5.dolphin
  libsForQt5.kturtle

  # shell
  zsh
  bashInteractive

  # configuration dotfiles
  # home-manager
  rcm

  # terminal display system information
  dt-shell-color-scripts
  btop
  htop
  neofetch
  bottom
  checkip
  freshfetch
  ipfetch
  hyfetch
  pridefetch

  # virtual machine
  anbox
  waydroid
  flatpak
  gnome.gnome-boxes
  vmware-workstation
  virtualbox
  qemu_kvm
  qtemu
  # virtualboxWithExtpack
  libreelec-dvb-firmware
  kodi-gbm
  docker  
  docker-compose
  wine
  playonlinux
  bottles
  darling-dmg  # Darling lets you open macOS dmgs on Linux
  android-tools  # Android SDK platform tools
  adb-sync  # A tool to synchronise files between a PC and an Android devices using ADB (Android Debug Bridge)
  adbfs-rootless  # Mount Android phones on Linux with adb, no root required
  gnirehtet  # Reverse tethering over adb for Android
  autoadb  # Execute a command whenever a device is adb-connected
  usbmuxd  # A socket daemon to multiplex connections from and to iOS devices

  # appimage
  appimagekit
  appimage-run
  ];

  xfcePkgs = with pkgs.xfce; [
    ristretto
    thunar
    thunar-archive-plugin
    tumbler
  ];

  gnomeExtension = with pkgs.gnomeExtensions; [
    simple-system-monitor
    tilingnome
    window-state-manager
    desktop-icons-ng-ding
  ];
in
{
  nixpkgs.config = { allowUnfree = true; };
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"  # etcher
    "python-2.7.18.6"
  ];
  home.packages = packages ++ xfcePkgs ++ gnomeExtension;
}
