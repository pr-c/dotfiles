{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        firefox
        syncthing
        keepassxc
    ];
}
