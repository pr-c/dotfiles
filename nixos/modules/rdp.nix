{ pkgs, ... }:

let
  pinnedFreeRdp = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/3ec636362e1816bc2f0888fa0fa2c69f1bc9e504.tar.gz";
  }) {
    system = pkgs.system;
  };
in
{
  environment.systemPackages = [
    pinnedFreeRdp.freerdp
    pkgs.remmina
    pkgs.xpra
  ];
}
