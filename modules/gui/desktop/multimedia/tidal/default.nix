{ lib, config, pkgs, ... }: {
  options.multimedia.tidal = {
    enable = lib.mkEnableOption "tidal";
  };

  config = lib.mkIf config.multimedia.tidal.enable {
    home-manager.users.${config.main-user.userName} = {      
      home = {
        packages = with pkgs; [
            tidal-hifi
        ];
      };
    };
  };
}