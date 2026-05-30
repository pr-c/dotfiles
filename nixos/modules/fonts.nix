{ pkgs, lib, inputs, ... } : {
    fonts.packages = with pkgs; [
        font-awesome
        fira-code
        fira-code-symbols
    ];
}

