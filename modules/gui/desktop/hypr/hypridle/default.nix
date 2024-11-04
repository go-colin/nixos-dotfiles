{ lib, config, pkgs, ... }: {
  options.hypridle = {
    enable = lib.mkEnableOption "hypridle";
  };

  config = lib.mkIf config.hypridle.enable {
    # systemd.user.services.hypridle = {
    #   enable = true;
    # };
    
    home-manager.users.${config.main-user.userName} = {
      services = {
        hypridle = {
          enable = true;
          settings = {
            general = {
              # lock_cmd = "${pkgs.hyprlock}/bin/hyprlock";
              lock_cmd = "pidof hyprlock || hyprlock"; 
              before_sleep_cmd = "playerctl pause && loginctl lock-session";
              after_sleep_cmd = "hyprctl dispatch dpms on";
            };

            listener = [
              {
                timeout = 600;
                on-timeout = "notify-send \"Baradur\" \"Good night :-)\" -a timeout -u low -t 30000 -i ${./eye.png}";
                on-resume = "notify-send \"Baradur\" \"Welcome back :-)\" -a timeout -u low -t 10000 -i ${./eye.png}";
              }
              {
                timeout = 630;
                on-timeout = "playerctl pause";
              }
              {
                timeout = 630;
                on-timeout = "loginctl lock-session";
              }
              {
                timeout = 1800;
                on-timeout = "hyprctl dispatch dpms off";
                on-resume = "hyprctl dispatch dpms on";
              }
            ];
          };
        };
      };
    };
  };
}