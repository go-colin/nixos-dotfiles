{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    # headscale.url = "github:juanfont/headscale";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin.url = "github:catppuccin/nix";

    # nixos-wsl.url = "github:nix-community/NixOS-WSL";

    # ethereum-nix = {
    #   url = "github:nix-community/ethereum.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  outputs =
    inputs:
    let
      lib = inputs.snowfall-lib.mkLib {
        inherit inputs;

        src = ./.;

        snowfall = {
          namespace = "bentobox";

          meta = {
            name = "bentobox";
            title = "lunch's dotfiles";
          };
        };
      };
    in
    lib.mkFlake {
      src = ./.;

      shells = {
        default = "devbox";
      };

      channels-config = {
        allowUnfree = true;
        permittedInsecurePackages = [ ];
      };

      systems.hosts.nixbox.modules = with inputs; [
        ethereum-nix.nixosModules.default
        (
          { pkgs, system, ... }:
          {
            environment.systemPackages = (
              # with ethereum-nix.packages.x86_64-linux;
              [
                #teku
                #lighthouse
              ]
            );
          }
        )
      ];

    };
}
