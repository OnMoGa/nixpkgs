{
  lib,
  buildHomeAssistantComponent,
  fetchurl,
  gehomesdk,
  magicattr,
}:

buildHomeAssistantComponent rec {
  owner = "simbaja";
  domain = "ge_home";
  version = "2026.2.0";

  src = fetchurl {
    url = "https://github.com/${owner}/ha_gehome/archive/refs/tags/v${version}.tar.gz";
    hash = "sha256-p34yBtoqAMVCiAZKyxWPTVOSjPaueD1sb5ZEzWF2OZ4=";
  };

  sourceRoot = "ha_gehome-${version}";

  dependencies = [
    gehomesdk
    magicattr
  ];

  meta = {
    description = "Home Assistant integration for GE WiFi-enabled appliances (SmartHQ)";
    homepage = "https://github.com/simbaja/ha_gehome";
    changelog = "https://github.com/simbaja/ha_gehome/releases/tag/v${version}";
    license = lib.licenses.mit;
    teams = [ lib.teams.home-assistant ];
  };
}
