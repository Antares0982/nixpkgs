{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  dataproperty,
  typepy,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "tabledata";
  version = "1.3.3";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "thombashi";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-84KrXnks76mvIjcEeQPpwd8rPO5SMbH/jfqERaFTrWo=";
  };

  propagatedBuildInputs = [
    dataproperty
    typepy
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = with lib; {
    homepage = "https://github.com/thombashi/tabledata";
    description = "Library to represent tabular data";
    changelog = "https://github.com/thombashi/tabledata/releases/tag/v${version}";
    maintainers = with maintainers; [ genericnerdyusername ];
    license = licenses.mit;
  };
}
