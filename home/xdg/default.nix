{ options, config, lib, pkgs, ... }:

# with lib;
# with ../home.nix;

let
  cfg = config.xdg;

  # with (import ../home.nix);
  homeDefault = import ../home.nix;

  # fileType = (import ../home.nix {
  #   inherit (config.home) homeDirectory;
  #   # inherit configHome;
  #   inherit lib pkgs;
  # }).fileType;

  # defaultConfigHome = configHome;
  # defaultConfigHome = "${config.home.homeDirectory}/.config";
  # defaultCacheHome = "${config.home.homeDirectory}/.cache";
  # defaultDataHome = "${config.home.homeDirectory}/.local/share";
  # defaultStateHome = "${config.home.homeDirectory}/.local/state";

  # getEnvFallback = name: fallback:
  #   let value = builtins.getEnv name;
  #   in if value != "" then value else fallback;

in { 
  xdg = {
  # inherit configHome;
  enable = true;
  };
  # inherit homeDefault;
  # xdg.configFile."nvim".source = ./nvim;

  # options.xdg = {
  # enable = mkEnableOption "management of XDG base directories";
  # };

  # configFile = mkOption {
  #   type = fileType "xdg.configFile" "{var}`xdg.configHome`" cfg.configHome;
  #   default = { };
  #   description = ''
  #     Attribute set of files to link into the user's XDG
  #     configuration home.
  #   '';
  # };
}

  # config = mkMerge [
  #   (let
  #     variables = {
  #       XDG_CACHE_HOME = cfg.cacheHome;
  #       XDG_CONFIG_HOME = cfg.configHome;
  #       XDG_DATA_HOME = cfg.dataHome;
  #       XDG_STATE_HOME = cfg.stateHome;
  #     };
  #   in mkIf cfg.enable {
  #     xdg.cacheHome = mkDefault defaultCacheHome;
  #     xdg.configHome = mkDefault defaultConfigHome;
  #     xdg.dataHome = mkDefault defaultDataHome;
  #     xdg.stateHome = mkDefault defaultStateHome;

  #     home.sessionVariables = variables;
  #     systemd.user.sessionVariables =
  #       mkIf pkgs.stdenv.hostPlatform.isLinux variables;
  #   })

  #   # Legacy non-deterministic setup.
  #   (mkIf (!cfg.enable && versionOlder config.home.stateVersion "20.09") {
  #     xdg.cacheHome =
  #       mkDefault (getEnvFallback "XDG_CACHE_HOME" defaultCacheHome);
  #     xdg.configHome =
  #       mkDefault (getEnvFallback "XDG_CONFIG_HOME" defaultConfigHome);
  #     xdg.dataHome = mkDefault (getEnvFallback "XDG_DATA_HOME" defaultDataHome);
  #   })

  #   # "Modern" deterministic setup.
  #   (mkIf (!cfg.enable && versionAtLeast config.home.stateVersion "20.09") {
  #     xdg.cacheHome = mkDefault defaultCacheHome;
  #     xdg.configHome = mkDefault defaultConfigHome;
  #     xdg.dataHome = mkDefault defaultDataHome;
  #     xdg.stateHome = mkDefault defaultStateHome;
  #   })

  #   {
  #     home.file = mkMerge [
  #       (mapAttrs' (name: file: nameValuePair "${cfg.configHome}/${name}" file)
  #         cfg.configFile)
  #       (mapAttrs' (name: file: nameValuePair "${cfg.dataHome}/${name}" file)
  #         cfg.dataFile)
  #       { "${cfg.cacheHome}/.keep".text = ""; }
  #     ];
  #   }
  # ];
