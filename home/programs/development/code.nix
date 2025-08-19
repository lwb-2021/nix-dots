{ config, lib, pkgs, ... }: {
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

        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;

        "file.autoSave" = "afterDelay";
        "file.autoGuessEncoding" = true;

        "window.dialogueStyle" = "custom";
      };
      extensions = with pkgs.vscode-marketplace;[
        # Basic
        usernamehw.errorlens

        
        # Git
        codezombiech.gitignore
        donjayamanne.githistory
        vivaxy.vscode-conventional-commits
        
        github.vscode-github-actions
        github.vscode-pull-request-github


        # Nix
        mkhl.direnv
        bbenoist.nix


        # Languages

        ## Python
        ms-python.python
        ms-python.vscode-pylance

        ms-toolsai.jupyter
        ms-toolsai.vscode-jupyter-slideshow
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.jupyter-renderers
        ms-toolsai.jupyter-keymap

        
        ## Rust
        rust-lang.rust-analyzer

        ## TOML
        tamasfe.even-better-toml

        # AI
        github.copilot

      ];
    };
  };

}
