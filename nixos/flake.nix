{
    description = "Paul's NixOS Configuration Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs, ... } @ inputs: 
        let
        pkgs = nixpkgs.linuxPackages_latest.x86_64-linux;
    in
    {
        nixosConfigurations.silver = nixpkgs.lib.nixosSystem {
            specialArgs = { 
                inherit inputs;
                hostname = "silver";
            };
            modules = [
                ./hosts/silver/configuration.nix
            ];
        };

    };
}
