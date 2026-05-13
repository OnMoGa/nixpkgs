{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "magicattr";
  version = "0.1.6";
  format = "wheel";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    hash = "sha256-2WsY7kW17oOwnBfhXTRZpk3mLVOICML3EYJ3fdnbu98=";
  };

  pythonImportsCheck = [ "magicattr" ];

  meta = {
    description = "getattr and setattr that works on nested objects, lists, and dicts without eval";
    homepage = "https://github.com/frmdstryr/magicattr";
    license = lib.licenses.mit;
    teams = [ lib.teams.home-assistant ];
  };
}
