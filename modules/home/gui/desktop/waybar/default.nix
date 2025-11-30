{
  lib,
  config,
  pkgs,
  namespace,
  ...
}:
let
  cfg = config.${namespace}.gui.desktop.waybar;
in
{
  options.${namespace}.gui.desktop.waybar = {
    enable = lib.mkEnableOption "waybar";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;

      # Use external configuration files for better maintainability
      settings = {
        mainBar = {
          # Waybar configuration for Hyprland + Stylix + Catppuccin Mocha
          layer = "top";
          position = "top";
          height = 35;
          spacing = 4;
          margin-top = 10;
          margin-left = 15;
          margin-right = 15;
          margin-bottom = 0;

          # Module layout
          modules-left = [
            "hyprland/workspaces"
            "hyprland/submap"
          ];
          modules-center = [
            "hyprland/window"
          ];
          modules-right = [
            "tray"
            "idle_inhibitor"
            "pulseaudio"
            "network"
            "cpu"
            "memory"
            "temperature"
            "battery"
            "clock"
          ];

          # Hyprland workspaces
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            warp-on-scroll = false;
            format = "{icon}";
            format-icons = {
              "1" = "󰲠";
              "2" = "󰲢";
              "3" = "󰲤";
              "4" = "󰲦";
              "5" = "󰲨";
              "6" = "󰲪";
              "7" = "󰲬";
              "8" = "󰲮";
              "9" = "󰲰";
              "10" = "󰿬";
              urgent = "󰀪";
              active = "󰮯";
              default = "󰧞";
            };
            persistent-workspaces = {
              "*" = 5;
            };
          };

          # Hyprland window title
          "hyprland/window" = {
            format = "{}";
            max-length = 60;
            separate-outputs = true;
            rewrite = {
              "(.*) — Mozilla Firefox" = "󰈹 $1";
              "(.*) - Visual Studio Code" = "󰨞 $1";
              "(.*) - vim" = " $1";
              "(.*) - nvim" = " $1";
              "(.*)Spotify" = "󰓇 $1";
              "(.*) - Discord" = "󰙯 $1";
            };
          };

          # Hyprland submap (keybind modes)
          "hyprland/submap" = {
            format = "󰌌 {}";
            max-length = 20;
            tooltip = false;
          };

          # System tray
          tray = {
            icon-size = 18;
            spacing = 8;
          };

          # Clock
          clock = {
            timezone = "America/Vancouver";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "󰥔 {:%H:%M}";
            format-alt = "󰸗 {:%a, %b %d, %Y}";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
              format = {
                months = "<span color='#cba6f7'><b>{}</b></span>";
                days = "<span color='#cdd6f4'><b>{}</b></span>";
                weeks = "<span color='#94e2d5'><b>W{}</b></span>";
                weekdays = "<span color='#fab387'><b>{}</b></span>";
                today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
              };
            };
          };

          # CPU usage
          cpu = {
            format = "󰻠 {usage}%";
            tooltip = false;
            interval = 2;
            states = {
              warning = 70;
              critical = 90;
            };
          };

          # Memory usage
          memory = {
            format = "󰍛 {}%";
            tooltip-format = "Memory: {used:0.1f}G/{total:0.1f}G\nSwap: {swapUsed:0.1f}G/{swapTotal:0.1f}G";
            interval = 2;
            states = {
              warning = 70;
              critical = 90;
            };
          };

          # Temperature monitoring
          temperature = {
            thermal-zone = 2;
            hwmon-path = [
              "/sys/class/hwmon/hwmon1/temp1_input"
              "/sys/class/hwmon/hwmon2/temp1_input"
            ];
            critical-threshold = 80;
            format-critical = "󰸁 {temperatureC}°C";
            format = "󰔏 {temperatureC}°C";
            tooltip = true;
            interval = 2;
          };

          # Battery status
          battery = {
            states = {
              good = 95;
              warning = 30;
              critical = 20;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󰚥 {capacity}%";
            format-alt = "{icon} {time}";
            format-full = "󰁹 {capacity}%";
            format-icons = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
            ];
            tooltip-format = "{timeTo}, {capacity}% - {power}W";
          };

          # Network status
          network = {
            format-wifi = "󰤨 {signalStrength}%";
            format-ethernet = "󰈀 Connected";
            tooltip-format = "󰤨 {essid}\n󰈀 {ifname}\n󰩠 {ipaddr}/{cidr}\n󰚇 {frequency}MHz\n󰤨 {signalStrength}% ({signaldBm}dBm)";
            tooltip-format-ethernet = "󰈀 {ifname}\n󰩠 {ipaddr}/{cidr}\n󰕒 Up: {bandwidthUpOctets} Down: {bandwidthDownOctets}";
            format-linked = "󰤭 {ifname} (No IP)";
            format-disconnected = "󰤮 Disconnected";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            on-click-right = "nm-connection-editor";
          };

          # Audio control
          pulseaudio = {
            scroll-step = 5;
            format = "{icon} {volume}%";
            format-bluetooth = "󰂯 {icon} {volume}%";
            format-bluetooth-muted = "󰂲 ";
            format-muted = "󰖁 Muted";
            format-source = "󰍬 {volume}%";
            format-source-muted = "󰍭";
            format-icons = {
              headphone = "󰋋";
              hands-free = "󰏳";
              headset = "󰋎";
              phone = "󰏲";
              portable = "󰦧";
              car = "󰄋";
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };
            on-click = "pavucontrol";
            on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            tooltip-format = "{desc}\nVolume: {volume}%";
          };

          # Idle inhibitor
          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "󰅶";
              deactivated = "󰾪";
            };
            tooltip-format-activated = "Idle inhibitor is active";
            tooltip-format-deactivated = "Idle inhibitor is inactive";
          };
        };
      };

      # style = builtins.readFile ./config/style.css;
    };

    home = {
      packages = with pkgs; [
        waybar
        pavucontrol # Audio control GUI
        networkmanagerapplet # Network management

        # Additional utilities that waybar modules might use
        playerctl # Media player control
        brightnessctl # Brightness control
        wireplumber # Audio session manager
      ];
    };

    # Ensure waybar restarts when Hyprland restarts
    systemd.user.services.waybar = {
      Unit = {
        # Description = "Highly customizable Wayland bar for Sway and Wlroots based compositors";
        Documentation = "https://github.com/Alexays/Waybar/wiki";
        PartOf = [ "hyprland-session.target" ];
        After = [ "hyprland-session.target" ];
        Requisite = [ "hyprland-session.target" ];
      };

      Service = {
        Type = "exec";
        ExecStart = "${pkgs.waybar}/bin/waybar";
        ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
        Restart = "on-failure";
        KillMode = "mixed";
      };

      Install = {
        WantedBy = [ "hyprland-session.target" ];
      };
    };
  };
}
