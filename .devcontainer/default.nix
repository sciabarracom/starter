
{ pkgs ? import <nixpkgs> {} }:
let
  nuv = pkgs.callPackage ./nuv/default.nix { };
in
pkgs.mkShellNoCC {
  buildInputs = with pkgs; [
    python311
    python311Packages.watchfiles
    python311Packages.pip
    nodejs_20
    nodePackages.http-server
    nuv
  ];
}