{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> {} }:

with pkgs;
stdenv.mkDerivation {
    name = "run";
    buildInputs = [ bash getopt mailsend coreutils ];
}
