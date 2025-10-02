{
  pkgs,
  ...
}:
{
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        emoji = [ pkgs.noto-fonts-emoji.name ];
        serif = [ pkgs.nerd-fonts.ubuntu.name ];
        sansSerif = [ pkgs.nerd-fonts.ubuntu-sans.name ];
        monospace = [ pkgs.nerd-fonts.fira-code.name ];
      };

      hinting = "full";

      subpixelRendering = "rgb";
    };
  };
}
