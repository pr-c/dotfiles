{ config, lib, pkgs, ... } @inputs :

{
  imports = [
    ./hardware.nix
    ../../modules/general.nix
    ../../modules/hyprland.nix
    ../../modules/gui_apps.nix
    ../../modules/fonts.nix
  ];
  system.stateVersion = "25.11"; # dont touch this, ever

  users.users.paul = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"];
  };

  networking.hostName = inputs.hostname;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

