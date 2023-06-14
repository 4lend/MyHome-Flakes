{ pkgs, config, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "nightfox";
      # editor = {        
      #   line-number = "relative";
      #   lsp.display-message = true;
      # };
      # keys.normal = {
      #   C-s = "file_picker";
      # }; 
    };
  };
}
