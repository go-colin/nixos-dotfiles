{
  lib,
  pkgs,
  ...
}:
{
  programs = {

    zed-editor = {
      enable = true;

      extraPackages = [ pkgs.nil ];
      installRemoteServer = true;
      package = pkgs.zed-editor;
      themes = { };
      userKeymaps = [ ];
      userTasks = [ ];

      ## This populates the userSettings "auto_install_extensions"
      extensions = [
        "assembly"
        "brainfuck"
        "catppuccin"
        "catppuccin-icons"
        "csv"
        "deno"
        "docker-compose"
        "dockerfile"
        "dracula"
        "dune-theme"
        "git-firefly"
        "github-dark-default"
        "github-theme"
        "golangci-lint"
        "graphql"
        "gruvbox-material"
        "helm"
        "html"
        "http"
        "ini"
        "java"
        "kotlin"
        "log"
        "material-dark"
        "macos-classic"
        "make"
        "material-theme"
        "material-icon-theme"
        "mermaid"
        "monospace-theme"
        "monospace-icon-theme"
        "nginx"
        "nix"
        "one-dark-pro"
        "perplexity"
        "proto"
        "sql"
        "tailwind-theme"
        "terraform"
        "the-dark-side"
        "tmux"
        "tokyo-night"
        "toml"
        "xml"
        "zig"
      ];

      ## everything inside of these brackets are Zed options.
      userSettings = {
        features = {
          edit_prediction_provider = "none";
        };

        assistant = {
          enabled = true;
          version = "2";
          default_open_ai_model = null;
          ### PROVIDER OPTIONS
          ### zed.dev models { claude-3-5-sonnet-latest } requires github connected
          ### anthropic models { claude-3-5-sonnet-latest claude-3-haiku-latest claude-3-opus-latest  } requires API_KEY
          ### copilot_chat models { gpt-4o gpt-4 gpt-3.5-turbo o1-preview } requires github connected
          default_model = {
            provider = "zed.dev";
            model = "claude-4-sonnet-latest";
          };

          #                inline_alternatives = [
          #                    {
          #                        provider = "copilot_chat";
          #                        model = "gpt-3.5-turbo";
          #                    }
          #                ];
        };

        "[language_servers.claude-code-server]" = {
          name = "Claude Code Server";
          languages = [
            "Rust"
            "JavaScript"
            "TypeScript"
            "Python"
            "Markdown"
            "Go"
            # "Java"
          ];
        };

        node = {
          path = lib.getExe pkgs.nodejs;
          npm_path = lib.getExe' pkgs.nodejs "npm";
        };

        hour_format = "hour24";
        auto_update = false;
        terminal = {
          alternate_scroll = "off";
          blinking = "off";
          copy_on_select = false;
          dock = "bottom";
          detect_venv = {
            on = {
              directories = [
                ".env"
                "env"
                ".venv"
                "venv"
              ];
              activate_script = "default";
            };
          };
          env = {
            TERM = "ghostty";
          };
          font_family = "Fira Code";
          font_features = null;
          font_size = null;
          line_height = "comfortable";
          option_as_meta = false;
          button = false;
          shell = "system";
          #{
          #                    program = "zsh";
          #};
          toolbar = {
            title = true;
          };
          working_directory = "current_project_directory";
        };

        lsp = {
          # rust-analyzer = {
          #   binary = {
          #     path = lib.getExe pkgs.rust-analyzer;
          #     path_lookup = true;
          #   };
          # };
          nix = {
            binary = {
              path = lib.getExe pkgs.nil;
            };
          };
          protobuf-language-server = {
            binary = {
              path = lib.getExe pkgs.protols;
            };
          };
        };

        vim_mode = false;
        ## tell zed to use direnv and direnv can use a flake.nix enviroment.
        load_direnv = "shell_hook";
        base_keymap = "VSCode";
        theme = lib.mkDefault {
          mode = "system";
          light = "Tokyo Night Storm";
          dark = "Tokyo Night";
        };
        show_whitespaces = "boundary";
        ui_font_size = lib.mkDefault 12;
        buffer_font_size = lib.mkDefault 12;
      };
    };
  };
}
