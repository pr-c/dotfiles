{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        firefox
        syncthing
        keepassxc
        darktable
        gimp
        thunderbird
        kicad
        inkscape
        networkmanagerapplet
        zathura
        kicad
        obsidian
        ncspot
        playerctl
        libreoffice-qt
        signal-desktop
    ];
}
