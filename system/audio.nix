{ config, pkgs, ... }:
{
  # Enable sound with pipewire.
  # service.xserver.displayManager.xpra.pulseaudio = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    audio.enable = true;
    socketActivation = true;
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };
  # enable sound with pulseaudio
  # hardware = {
  #   pulseaudio.enable = true;
  #   pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
  # };
}
