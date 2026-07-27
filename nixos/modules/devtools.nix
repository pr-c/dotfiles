{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        gcc
        gdb
        gnumake
        cmake
        ccache
        clang-tools
        glibc.dev
    ];
}
