{ pkgs, config, ... }:

let
  fishConfig = ''
    bind \t accept-autosuggestion
    bind X forward-word
    set -U fish_greeting

    bind \co 'tig'

    colorscript exec colortest
  '';

  # colortest, colorwheel, blocks

  shellAliases = {
    l         = "exa -1 -g -l --icons -s type";
    la        = "exa -1 -g -l --icons -s type -a";
    lt        = "exa -1 -g -l --icons -s type -T";
    lat       = "exa -1 -g -l --icons -s type -a -T";
    du        = "${pkgs.du-dust}/bin/dust";

    nb        = "nix build";
    nbs       = "sudo nixos-rebuild switch --flake .#alfurqani";
    nbsi      = "sudo nixos-rebuild switch --flake .#alfurqani --impure";
    nbb       = "sudo nixos-rebuild build --flake .#alfurqani";
    nbbi      = "sudo nixos-rebuild build --flake .#alfurqani --impure";
    nbt       = "sudo nixos-rebuild test --flake .#alfurqani";
    nbti      = "sudo nixos-rebuild test --flake .#alfurqani --impure";
    conix     = "sudo nvim /etc/nixos/configuration.nix";
    nc        = "nix-channel";
    ncl       = "nix-channel --list";
    nca       = "nix-channel --add";
    ncrm      = "nix-channel --remove";
    ncu       = "nix-channel --update";
    hb        = "home-manager build";
    hs        = "home-manager switch";
    hg        = "home-manager generations";

    tls       = "tmux list-sessions";
    tkls      = "tmux kill-session -t";
    kat       = "pkill -f tmux";
    tks       = "tmux kill-server";

    g         = "git";
    gs        = "git status";
    ge        = "git clone";
    gcg       = "git config --global";
    gc        = "git config";
    gcl       = "git config --list";
    gcgl      = "git config --global --list";
    ga        = "git add";
    gal       = "git add -A";
    gcm       = "git commit -m";
    gam       = "git commit -a -m";
    gsi       = "git switch";
    gco       = "git checkout";
    gr        = "git remote";
    gra       = "git remote add";
    grmv      = "git remote remove";
    grv       = "git remote -v";
    gb        = "git branch";
    gbl       = "git branch --list";
    gp        = "git push -u";
    gl        = "git log";
    gd        = "git diff";
    grs       = "git reset";
    grss      = "git reset --soft";
    grsh      = "git reset --hard";

    y         = "yt-dlp";
    yp        = "yt-dlp --proxy 192.168.49.1:8000";
    yy        = "yt-dlp --ignore-config --extract-audio --audio-quality 0";
    yyp       = "yt-dlp --ignore-config --extract-audio --audio-quality 0 --proxy 192.168.49.1:8000";
    c         = "cd";
    d         = "cd ..";
    v         = "vim";
    nv        = "nvim";
    vd        = "neovide";
    p         = "spacevim";
    t         = "tmux";
    e         = "exit";
    lv        = "lvim";
    sp        = "speedtest-cli";
    py        = "python";
    py3       = "python3";
    b         = "bat";
    cl        = "clear";
    s         = "sudo su";
    sd        = "sudo";
    mkd       = "mkdir";
    cpr       = "cp -r";
    rm        = "rm";
    rmf       = "rm -rf";
    a         = "aria2c";
    vf        = "vifm";
    ra        = "ranger";
    pc        = "protonvpn-cli";
    nq        = "notepadqq";
    bs        = "bash";
    whi       = "which";
    whe       = "whereis";
    sn        = "sncli";

    ud        = "udisksctl";
    udm       = "udisksctl mount -b";
    udmd      = "udisksctl unmount -b";
  };
in
{
  programs = {
    fish = {
      enable = true;
      shellAliases = shellAliases;
      shellInit = fishConfig;
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true; 
      enableCompletion = true; 
      enableSyntaxHighlighting = true; 
      historySubstringSearch.enable = true; 
      shellAliases = shellAliases;
    };
    bash = {
      enable = true; 
    };
  };
}
