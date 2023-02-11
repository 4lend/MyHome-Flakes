{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "syifa.alfurqoni@gmail.com";
    userName = "Alfurqani";
    # extraConfig = ''
    #   
    # '';
    # ignores = "result";
    # signing = 
    # signing.gpgPath = "";
    # signing.key = "";
    # signing.signByDefault = true;
  };
}
