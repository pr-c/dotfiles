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
  ];

  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openvpn ];
  };

  time.timeZone = "Europe/Berlin";

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
