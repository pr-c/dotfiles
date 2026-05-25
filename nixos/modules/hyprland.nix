{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        hyprland
        kitty
        waybar
        hyprpaper
        hyprlock
        rose-pine-hyprcursor
    ];

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };
}
