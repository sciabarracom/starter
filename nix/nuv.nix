{ lib
, stdenv
, pkgs
, fetchFromGitHub
}:

let
    version = "3.0.1-beta.2405062139";
in 

stdenv.mkDerivation {
  
  pname = "nuv";
  inherit version;

  src = fetchFromGitHub {
    owner = "nuvolaris";
    repo = "nuv";
    rev = version;
    sha256 = "sha256-WQib0zbwIROM9jyQ74x0jeFbHsdUar/OffeeedPDS+U=";
  };

  buildInputs = with pkgs; [ which go less jq curl git go-task kubectl eksctl kind k3sup coreutils];

  preBuild = ''
    export HOME=$(mktemp -d)
    export GOPROXY=direct
  '';

  buildPhase = ''
    runHook preBuild
    task build VERSION=$version
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp bin/nuv $out/bin
    #for cmd in kubectl eksctl kind k3sup coreutils
    #do cp "$$(which $$cmd)" $out/bin/$$cmd
    #done
    runHook postInstall
  '';

}