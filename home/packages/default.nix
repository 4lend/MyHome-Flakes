{ pkgs, config, ... }:

let
  packages = with pkgs; [
    javaCup  dbus_java  maven  glib  lua  xdg-desktop-portal  xdg-desktop-portal-wlr xdg-desktop-portal-gnome  dbus  nodePackages.npm  nodePackages_latest.pnpm  nodePackages_latest.npm-check-updates  yarn  yarn2nix  twitterBootstrap  nim  jq  nodejs  mariadb  apacheHttpd  php  cachix  direnv  nix-direnv  ruby_3_2  yajl  

    graphqlmap
    json_c
    jsoncpp
    # dotnet-runtime

    # color picker
    deepin.deepin-picker
    xcolor
    eyedropper
    wl-color-picker
    colorpicker

    # # keyboard
    # bucklespring

    apktool
    ascii
    atool
    audacious
    bat
    cargo
    dbus
    electron
    exfat
    font-manager
    gnupg
    gparted
    veracrypt
    input-remapper
    kitty-themes
    pcmanfm
    # plank
    subdl
    trash-cli
    ueberzug
    xorg.xkill
    # killall
    p7zip
    fuse-7z-ng
    tmuxinator # Manage complex tmux sessions easily

    # python
    python311Packages.dbus-python  
    python310Packages.urllib3
    python311Full
    python311Packages.pip
    pipx  # Install and run Python applications in isolated environments

    # an
    # hakuneko
    yacreader
    # anime-downloader
    # anup  # An anime tracker for AniList featuring a TUI
    # adl  # popcorn anime-downloader + trackma wrapper
    filebot
    # nhentai
    # HentaiAtHome

    # share
    opendrop
    owl  # An open Apple Wireless Direct Link (AWDL) implementation written in C

    # social
    discord
    # whatsapp-for-linux
    mailspring
    # thunderbird
    headset
    giara
    # slack
    tdesktop
    # weechat
    element-web
    element-desktop
    ferdium
    turses  # A Twitter client for the console
    # cawbird
    # franz
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
    haxor-news
    circumflex

    # audio
    wireplumber
    easyeffects
    pulseeffects-legacy
    pipewire
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
    tor
    dnscrypt-proxy2
    doggo
    openssl
    linux-wifi-hotspot
    protonvpn-cli
    protonvpn-gui
    python310Packages.protonvpn-nm-lib
    speedtest-cli
    firewalld
    # busybox
    dig

    # media player
    cmus
    # cmusfm  # Last.fm and Libre.fm standalone scrobbler for the cmus music player
    cava
    streamlink
    python310Packages.deemix  
    python310Packages.deezer-python  
    # nuclear
    spotify
    spotify-qt
    spotify-tui
    spotifyd
    spotify-player
    spotify-cli-linux
    termusic
    yewtube

    # terminal
    ghq
    cmatrix
    tig
    lazygit
    git-crypt
    gitkraken
    smartgithg
    gh
    glab
    # gitlab
    # gitlab-ee
    # gitlab-shell
    # gitlab-pages
    ranger  findutils  mlocate  
    deer
    # pistol
    exa
    terminal-typeracer
    ttyper
    internetarchive
    vim
    spacevim
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
    pssh
    cowsay

    # text editor
    geany
    vscode
    sublime4
    texlive.combined.scheme-full
    texmaker
    texstudio
    # engine
    godot
    # godot_4 
    godot-server
    godot-headless
    godot-export-templates
    gdtoolkit  # Independent set of tools for working with Godot's GDScript - parser, linter and formatter
    pixelorama  # A free & open-source 2D sprite editor, made with the Godot Engine!

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
    tor-browser-bundle-bin
    google-chrome
    microsoft-edge
    opera
    chromium
    tvbrowser

    # downloader
    motrix
    qbittorrent
    webtorrent_desktop  # Streaming torrent app for Mac, Windows, and Linux
    yt-dlp
    youtube-dl 
    ytmdl
    youtube-music
    youtube-tui
    httpie
    python310Packages.httpie
    instaloader
    uget
    uget-integrator
    axel 
    downonspot  # A spotify downloader writter in rust
    spotdl  # Download your Spotify playlists and songs along with album art and metadata
    popcorntime
    ariang
    gdown
    lgogdownloader
    megacmd

    # productive
    obsidian
    glow
    notepadqq
    okular
    foliate
    nomacs  # Qt-based image viewer
    inkscape
    gimp-with-plugins
    darktable
    digikam
    synfigstudio
    libreoffice
    mdds  # need by libreoffice
    onlyoffice-bin
    libtiff  # need by wpsoffice
    wpsoffice
    xchm
    shotwell
    shotcut
    flowblade
    simplenote
    standardnotes
    rednotebook
    obs-studio
    zoom-us
    # joplin
    # joplin-desktop  # An open source note taking and to-do application with synchronisation capabilities
    trilium-desktop  # Hierarchical note taking application with focus on building large personal knowledge bases
    trilium-server
    notion-app-enhanced  # Notion Desktop builds with Notion Enhancer for Windows, MacOS and Linux.
    anytype  # P2P note-taking tool
    appflowy  # An open-source alternative to Notion
    bitwarden
    bitwarden-cli
    zim
    # taskwarrior  # Highly flexible command-line tool to manage TODO lists
    # taskwarrior-tui  # A terminal user interface for taskwarrior 
    todo  # Simple todo cli program written in rust
    todoist  # Todoist CLI Client
    todoist-electron  # The official Todoist electron app
    # gtg  #  A personal tasks and TODO-list items organizer
    # taskell  # A command-line kanban board/task manager
    # lifeograph
    # nextcloud-client  # Nextcloud themed desktop client
    qownnotes  # Plain-text file notepad and todo-list manager with markdown support and Nextcloud/ownCloud integration
    vimwiki-markdown
    audio-recorder
    kazam
    simplescreenrecorder
    pomodoro
    uair
    pomotroid
    lunatask
    freeplane
    libnotify  # A library that sends desktop notifications to a notification daemon
    notify-desktop  # Little application that lets you send desktop notifications with one command
    # odoo
    firefly-desktop
    logseq

    # ai
    # chatgpt-cli
    shell_gpt
    aichat
    
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
    # cinnamon.nemo

    # qt package
    libsForQt5.dolphin
    libsForQt5.kturtle
    libsForQt5.kget
    libsForQt5.konqueror
    libsForQt5.kdenlive
    libsForQt5.libopenshot
    libsForQt5.libopenshot-audio

    # shell
    bashInteractive
    fish

    # configuration dotfiles
    # home-manager
    rcm

    # terminal display system information
    dwt1-shell-color-scripts
    pokemon-colorscripts-mac
    btop
    htop
    neofetch
    bottom
    checkip
    freshfetch
    ipfetch
    pfetch
    hyfetch
    pridefetch

    # virtual machine
    # anbox
    waydroid
    flatpak
    gnome.gnome-boxes
    gnome.gnome-tweaks
    qemu_kvm
    # vmware-workstation
    # virtualbox
    # qtemu
    # virtualboxWithExtpack
    # kodi-gbm
    # docker  
    # docker-compose
    # wine
    # playonlinux
    # bottles
    lutris
    # darling-dmg  # Darling lets you open macOS dmgs on Linux
    android-tools  # Android SDK platform tools
    adb-sync  # A tool to synchronise files between a PC and an Android devices using ADB (Android Debug Bridge)
    adbfs-rootless  # Mount Android phones on Linux with adb, no root required
    # gnirehtet  # Reverse tethering over adb for Android
    autoadb  # Execute a command whenever a device is adb-connected
    usbmuxd  # A socket daemon to multiplex connections from and to iOS devices
    ifuse  # A fuse filesystem implementation to access the contents of iOS devices
    libimobiledevice  # A software library that talks the protocols to support iPhone®, iPod Touch® and iPad® devices on Linux
    libimobiledevice-glue  # Library with common code used by the libraries and tools around the libimobiledevice project.
    joystickwake
    pcsx2
    minigalaxy
    grapejuice
    rpcs3

    # appimage
    appimagekit
    appimage-run
    appstream
    zsync
    
    # website
    wayback_machine_downloader
    suckit

    homebank
    jamesdsp-pulse
    xmind
    coursera-dl
    tabnine
  ];

  steamPackages = with pkgs.steamPackages; [
    steam
    steamcmd
    steam-runtime-wrapped
    # steam-fhsenv-without-steam
    # steam-original
    # steam-runtime
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
    paperwm
  ];

  # php = with pkgs; [
  #   php
  #   phpunit
  #   phpactor
  #   php82
  # ];
in
{
  nixpkgs.config = { 
    allowUnfree = true; 
    # packageOverrides = pkgs: {
    #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    #     inherit pkgs;
    #   };
    # };
  };
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"  # etcher
    "python-2.7.18.6"
  ];
  home.packages = packages ++ xfcePkgs ++ gnomeExtension;
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = pkgs.nur.repos.congee.sncli.pkgs;
  # };
}

# onic gebian
