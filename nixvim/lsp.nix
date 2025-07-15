{ config, lib, pkgs, ... }:{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        # Rust
        rust_analyzer = {
          enable = true;
          settings = {
            installRustc = false;
            installCargo = false;
            checkOnSave = true;
            diagnostics = {
              disabled = ["unresolved-proc-macro"];
            };
          };
        };


      };
    };
    lspkind = {
      enable = true;
      mode = "symbol";
      preset = "codicons";
    };
  };
}
