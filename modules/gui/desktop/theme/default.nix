{ inputs, lib, pkgs, config, ... }:
{
  options.theme = with lib; {
    enable = mkEnableOption "enable theming";
    catppuccin = {
      enable = mkEnableOption "enable catpuccin";
      flavor = mkOption {
        type = types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        description = "catpuccin flavor";
      };
    };
  };

  config = lib.mkIf config.theme.enable {
    home-manager.users.${config.main-user.userName} = {
      imports = [
        inputs.catppuccin.homeManagerModules.catppuccin
      ];

      home.packages = with pkgs; [
        dconf
      ];

      catppuccin = {
        enable = config.theme.catppuccin.enable;
        flavor = config.theme.catppuccin.flavor;
        # pointerCursor = {
        #   enable = config.theme.catppuccin.enable;
        #   flavor = config.theme.catppuccin.flavor;
        # };
      };

      qt = {
        enable = true;
        platformTheme.name = "kvantum";
        style.name = "kvantum";
      };
      
      gtk = {
        enable = true;
        catppuccin = {
          enable = config.theme.catppuccin.enable;
          flavor = config.theme.catppuccin.flavor;

          icon = {
            enable = config.theme.catppuccin.enable;
            flavor = config.theme.catppuccin.flavor;
          };
        };

        gtk3.extraConfig = {
          Settings = ''
            gtk-application-prefer-dark-theme=1
          '';
        };
        gtk4.extraConfig = {
          Settings = ''
            gtk-application-prefer-dark-theme=1
          '';
        };
      };
    };
  };
}