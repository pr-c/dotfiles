{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        texliveFull
        texlab
    ];
}
