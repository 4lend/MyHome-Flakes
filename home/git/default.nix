{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "syifa.alfurqoni@gmail.com";
    userName = "Alfurqani";
    ignores = [ "result" ];
    # signing = 
    # signing.gpgPath = ''

    # '';
    # signing.key = "7EBEA7EC4513EF91";
    signing.key = "553E0E6F94B2548E";
    signing.signByDefault = true;
    extraConfig = {
      rerere.enable = true;
      pull.ff = "only";
      # gpg.program = "gpg";
    };
  };
}
