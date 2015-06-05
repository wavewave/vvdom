{ mkDerivation, aeson, base, ghcjs-base, ghcjs-vdom, stdenv }:
mkDerivation {
  pname = "vvdom";
  version = "0.0";
  src = ./.;
  buildDepends = [ aeson base ghcjs-base ghcjs-vdom ];
  description = "virtual virtual dom";
  license = stdenv.lib.licenses.bsd3;
}
