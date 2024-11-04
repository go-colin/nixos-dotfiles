{pkgs, ...}: 
{
    config = {
        environment.systemPackages = with pkgs; [
            xclip
            wget
            bash
            git
            fontconfig
            vim-full
            nil
            openssl
            virt-viewer
            proton-pass
            protonvpn-cli
            kitty
            alacritty
            zellij
            gnupg
            pinentry-curses
            lsof
            zsh
            lf
            ripgrep
            htop
            neofetch
            jq
            bat
            tmux
            postgresql # for cli tooling
        ];

        i18n.defaultLocale = "en_CA.UTF-8";

        main-user = {
            enable = true;
            userName = "arrayofone";
            description = "Primordial Devboi";
            auto-login = false;
        };

        hostFonts.enable = true;

        time.timeZone = "America/Vancouver";
    };
}