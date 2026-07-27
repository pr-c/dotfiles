{ pkgs, lib, inputs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    git
    htop
    sshfs
    jq
    ripgrep
    nix-index
    wget2
    gnutar
    unzip
    bind.dnsutils
    zsh
    file
  ];

  programs.zsh.enable=true;

  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openvpn ];
  };

  time.timeZone = "Europe/Berlin";
  nixpkgs.config.allowUnfree = true;

  services.openssh = {
    enable = true;
    settings = { 
        PermitRootLogin = "no";
        PasswordAuthentication = false;
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
}
