{
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = {

        "editor.acceptSuggestionOnEnter" = "smart";

        "editor.cursorBlinking" = "smooth";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.smoothScrolling" = true;

        "editor.fontLigatures" = true;

        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;

        "file.autoSave" = "afterDelay";
        "file.autoGuessEncoding" = true;

        "window.dialogueStyle" = "custom";

        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        # Git
        "gitblame.inlineMessageEnabled" = true;

        # Java
        "redhat.telemetry.enabled" = true;

        # Nix
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.serverSettings" = {
          "nixd" = {
            # "formatting": {
            #   "command": ["nixfmt"],
            # },
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"./.\").nixosConfigurations.lwb.options";
              };
              "home-manager" = {
                "expr" = "(builtins.getFlake \"./.\").homeConfigurations.lwb.options";
              };
            };
          };
        };

      };
      extensions =
        with pkgs.vscode-marketplace;
        [
          # Basic
          alefragnani.project-manager
          usernamehw.errorlens
          asvetliakov.vscode-neovim
          ms-vscode.hexeditor
          formulahendry.code-runner

          # Git
          codezombiech.gitignore
          donjayamanne.githistory
          mhutchie.git-graph
          vivaxy.vscode-conventional-commits
          waderyan.gitblame

          github.vscode-github-actions
          github.vscode-pull-request-github

          # Nix
          mkhl.direnv
          # bbenoist.nix
          jnoortheen.nix-ide

          # Completions and Linting
          ## No Language
          christian-kohler.path-intellisense

          ## Python
          ms-python.python
          ms-python.vscode-pylance
          charliermarsh.ruff

          ## Rust
          rust-lang.rust-analyzer

          ## TOML
          tamasfe.even-better-toml

          # AI
          github.copilot

        ]
        ++ (with pkgs.vscode-extensions; [
          # Languages
          ## Python
          ### Jupyter
          ms-toolsai.jupyter
          ms-toolsai.vscode-jupyter-slideshow
          ms-toolsai.vscode-jupyter-cell-tags
          ms-toolsai.jupyter-renderers
          ms-toolsai.jupyter-keymap

        ]);
    };
  };
  home.packages = with pkgs; [
    nixfmt
  ];
}
