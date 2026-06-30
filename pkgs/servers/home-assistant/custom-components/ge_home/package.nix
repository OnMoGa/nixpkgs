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
  version = "2026.6.0";

  # use `nix store prefetch-file "https://github.com/simbaja/ha_gehome/archive/refs/tags/v2026.6.0.tar.gz"` to get the hash
  src = fetchurl {
    url = "https://github.com/${owner}/ha_gehome/archive/refs/tags/v${version}.tar.gz";
    hash = "sha256-KKHDaQRYNHAN4e8kwRI8sRMyfbrBopBmVG3FHobHUE=";
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
