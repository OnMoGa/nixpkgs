{
  lib,
  buildHomeAssistantComponent,
  fetchurl,
  glocaltokens,
}:

buildHomeAssistantComponent rec {
  owner = "leikoilja";
  domain = "google_home";
  version = "1.13.3";

  # use `nix store prefetch-file "https://github.com/leikoilja/ha-google-home/archive/refs/tags/v1.13.3.tar.gz"` to get the hash
  src = fetchurl {
    url = "https://github.com/${owner}/ha-google-home/archive/refs/tags/v${version}.tar.gz";
    hash = "sha256-azbP7szu/qqlIUJ0zUv89GE4pS3R05+FBMgwvia6944=";
  };

  sourceRoot = "ha-google-home-${version}";

  dependencies = [
    glocaltokens
  ];

  meta = {
    description = "Home Assistant custom component for Google Home devices (alarms, timers, Do Not Disturb)";
    homepage = "https://github.com/leikoilja/ha-google-home";
    changelog = "https://github.com/leikoilja/ha-google-home/releases/tag/v${version}";
    license = lib.licenses.mit;
    teams = [ lib.teams.home-assistant ];
  };
}
