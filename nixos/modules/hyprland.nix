{ pkgs, lib, inputs, ... } : {

    environment.systemPackages = with pkgs; [
        hyprland
	kitty
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
