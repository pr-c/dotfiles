{ pkgs, lib, inputs, ... } : 
let 
    freerdpPkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/e7fccb1ad3ed.tar.gz";
    }) {
        system = pkgs.stdenv.hostPlatform.system;
    };
in 
    {
        nixpkgs.overlays = [
            (final: prev: {
                freerdp = freerdpPkgs.freerdp;
            })
        ];
        environment.systemPackages = with pkgs; [
            freerdp
            remmina
            xpra
        ];
    }

