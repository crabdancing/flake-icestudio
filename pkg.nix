{
  appimageTools,
  lib,
  fetchurl,
}:
appimageTools.wrapType2 rec {
  pname = "icestudio";
  version = "0.12";

  src = fetchurl {
    url = "https://github.com/FPGAwars/icestudio/releases/download/v${version}/icestudio-${version}-linux64.AppImage";
    sha256 = "sha256-s+hvD+S2f30u8GrYadFOIjexmyicw6bOlFOvyYyjHeE=";
  };

  meta = with lib; {
    description = "Visual editor for open FPGA boards";
    homepage = "https://github.com/FPGAwars/icestudio";
    license = licenses.gpl2;
    maintainers = with maintainers; [];
    mainProgram = "icestudio";
    platforms = ["x86_64-linux"];
  };
}
