{ config, lib, pkgs, ... } @inputs :

{
  imports = [
    ./hardware.nix
    ../../modules/general.nix
    ../../modules/hyprland.nix
    ../../modules/gui_apps.nix
    ../../modules/fonts.nix
    ../../modules/texlive.nix
    ../../modules/rdp.nix
  ];
  system.stateVersion = "25.11"; # dont touch this, ever

  users.users.paul = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  networking.hostName = inputs.hostname;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
      open = false;
      modesetting.enable = true;
  };

  programs.steam = {
      enable = true;
  };

  virtualisation.docker = {
      enable = true;
      rootless = {
          enable = true;
          setSocketVariable = true;
      };
  };

}

