{ pkgs, ... }:
{
  imports = [
  ];

  services = {
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-curses;
      enableSSHSupport = true;
    };
  };

  bentobox = {
    gui = {
      desktop = {
        dunst.enable = true;
        hypridle.enable = true;
        hyprland.enable = true;
        hyprlock.enable = true;
        waybar.enable = true;
      };

      programs = {
        # brave.enable = true;
        firefox.enable = true;
        dbeaver.enable = true;
        element.enable = true;
        gparted.enable = true;
        obsidian.enable = true;
        postman.enable = true;
        slack.enable = true;
        # tidal.enable = true;
        webcord.enable = true;
      };
    };

    home.dev.enable = true;
  };

  home = {
    packages = with pkgs; [
      clipse
      fontconfig
      # nixd
      pinentry-curses
    ];

    stateVersion = "25.05";
  };
}
