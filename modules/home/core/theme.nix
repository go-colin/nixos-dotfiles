{
  host,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;

    autoEnable = true;
    base16Scheme = ./theme/base16/catppuccin/mocha.yaml;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };
      sansSerif = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu";
      };
      serif = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    };

    iconTheme = lib.mkIf (builtins.elem host pkgs.papirus-icon-theme.meta.platforms) {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };

    image = ./theme/wallpapers/rx7.png;

    polarity = "dark";
    targets = {
      kitty.enable = false;
      waybar.enable = true;
      hyprlock.enable = false;
      neovim.enable = false;

      zed.enable = false;

      firefox.profileNames = [ "default" ];

      # cavalier.enable = false;
    };
  };
}
