{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        freerdp
        remmina
        xpra
    ];
}
