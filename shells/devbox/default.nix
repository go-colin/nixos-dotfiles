{ pkgs, ... }:

pkgs.mkShell {
  name = "nix-devbox";

  packages = with pkgs; [
    # go
    delve
    go_1_25
    # go-ethereum
    gopls
    gotools
    go-tools
    golangci-lint

    # java
    # jdk21_headless

    # js
    deno
    nodejs
    typescript
    yarn

    # tools
    bash
    docker
    docker-compose
    gcc
    gh
    git
    gnupg
    gnumake
    htop
    jq
    # k9s
    # kubectl
    # kubectx
    # kubernetes-helm
    lazydocker
    lazysql
    lf
    # minikube
    neofetch
    openssl
    podman
    podman-compose
    podman-tui
    postgresql
    protobuf
    ripgrep
  ];
}
