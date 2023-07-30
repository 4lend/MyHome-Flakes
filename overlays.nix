
stdenv.mkDerivation rec {
  pname = "NvChad";
  # version = "6.0.0-rc1";

  # meta = with lib; {
  #   description = "GUI Firewall Management Application";
  #   homepage    = "https://github.com/fwbuilder/fwbuilder";
  #   license     = licenses.gpl2;
  #   platforms   = platforms.linux;
  #   maintainers = [ maintainers.elatov ];
  # };

  src = fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "v${version}";
    hash = "00a4wazmxmrnb2da0x4im4iwr0df0kh5jn73hclp517r73m3fi4w";
  };
}
