{ pkgs, ... }:

let 
    nixosVSCodeServer = {
        url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
        sha256 = "09j4kvsxw1d5dvnhbsgih0icbrxqv90nzf0b589rb5z6gnzwjnqf";    
    };
in 
{
    imports = [
        ./shells

        "${fetchTarball nixosVSCodeServer}/modules/vscode-server/home.nix"
    ];

    shells.zsh.enable = true;

    services = {
        vscode-server.enable = true;
        gpg-agent = {
            enable = true;
            #services.gpg-agent.extraConfig = ''
            pinentryPackage = pkgs.pinentry-curses;
        };
    };

    home = {
        packages = with pkgs; [
            ## dev tools
            neovim
            oxker
            awscli2
            kubectx
            kubectl
            lazysql
            lazydocker
            k9s
            minikube
            podman-tui
            kubernetes-helm
            gh
            gnumake 
            protobuf
            #js
            yarn
            nodejs
            deno
            typescript
            #go
            go_1_23
            go-ethereum
            gopls
            gotools
            go-tools
            golangci-lint
            delve
            ## applications
            obsidian
            element-desktop
            # discord
            webcord
            dbeaver-bin
            slack

            ## multimedia
            spotifyd 
            ncspot # spotify client
            spotify
        ];

        sessionVariables = {
            EDITOR = "nvim";
        };
    };

    programs = {
        vscode = {
            enable = true;
            package = pkgs.vscodium;
            extensions = with pkgs.vscode-extensions; [
                github.vscode-pull-request-github
                esbenp.prettier-vscode
                eamodio.gitlens
                dbaeumer.vscode-eslint
                ms-azuretools.vscode-docker
                redhat.vscode-yaml
                golang.go
                hashicorp.terraform
                graphql.vscode-graphql
                graphql.vscode-graphql-syntax
                #graphql.vscode-graphql-execution
                jnoortheen.nix-ide
                # asvetliakov.vscode-neovim
                catppuccin.catppuccin-vsc
                zxh404.vscode-proto3
            ];
        };
    };
}
