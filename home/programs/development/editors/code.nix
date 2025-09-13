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

        "files.autoSave" = "afterDelay";
        "files.autoGuessEncoding" = true;

        "files.readonlyInclude" = {
          "**/.cargo/registry/src/**/*.rs" = true;
          "**/.cargo/git/checkouts/**/*.rs" = true;
          "**/lib/rustlib/src/rust/library/**/*.rs" = true;
        };

        "window.dialogStyle" = "custom";

        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        # Git
        "gitblame.inlineMessageEnabled" = true;

        # Java

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
        # Qt
        "qt-qml.qmlls.customExePath" = "${pkgs.qt6.qtdeclarative}/bin/qmlls";
        "qt-qml.doNotAskForQmllsDownload" = true;
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;
      };
      extensions =
        with pkgs.vscode-marketplace;
        [
          # Functionality
          alefragnani.project-manager
          gruntfuggly.todo-tree
          formulahendry.code-runner
          adpyke.codesnap

          # Edit
          usernamehw.errorlens
          asvetliakov.vscode-neovim
          formulahendry.auto-rename-tag
          ## File Supports
          ms-vscode.hexeditor

          # Git
          codezombiech.gitignore
          donjayamanne.githistory
          mhutchie.git-graph
          vivaxy.vscode-conventional-commits
          waderyan.gitblame

          github.vscode-github-actions

          # Nix
          mkhl.direnv
          # bbenoist.nix
          jnoortheen.nix-ide

          # Completions and Linting
          ## No Language
          christian-kohler.path-intellisense

          ## Python
          ms-python.python
          # ms-python.vscode-pylance
          charliermarsh.ruff

          ## Qt
          theqtcompany.qt-core
          theqtcompany.qt-qml

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

          github.vscode-pull-request-github

        ]);
    };
  };
  home.packages = with pkgs; [
    nixfmt
  ];
}
