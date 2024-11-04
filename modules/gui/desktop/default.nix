{config, lib, ...}: {
    imports = [
        ./dunst

        ./hypr/hypridle
        ./hypr/hyprland
        ./hypr/hyprlock

        ./multimedia/tidal
        
        ./theme
        ./waybar
        ./nvidia
    ];

    options.host.desktop = {
        gui.enable = lib.mkEnableOption "enable gui desktop";
        nvidia.enable = lib.mkEnableOption "enable nvidia";
    };

    config = {
        # desktop gui stuff
        dunst.enable    = lib.mkIf config.host.desktop.gui.enable true;
        hypridle.enable = lib.mkIf config.host.desktop.gui.enable true;
        hyprland.enable = lib.mkIf config.host.desktop.gui.enable true;
        hyprlock.enable = lib.mkIf config.host.desktop.gui.enable true;
        waybar.enable   = lib.mkIf config.host.desktop.gui.enable true;
        
        multimedia.tidal.enable = lib.mkIf config.host.desktop.gui.enable true;
        
        theme = lib.mkIf config.host.desktop.gui.enable {
            enable = true;
            catppuccin = {
                enable = true;
                # flavor = "mocha";
            };
        };

        # nvidia driver config for wayland
        nvidia.enable = lib.mkIf config.host.desktop.nvidia.enable true;
    };
}