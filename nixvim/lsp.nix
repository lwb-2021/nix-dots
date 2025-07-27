{ config, lib, pkgs, ... }:{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        # Nix
        nixd = {
          enable = true;
        };

        # Python
        pyright = {
          enable = true;
            
        };
        
        # Typescript
        ts_ls = {
          enable = true;
        };
        # Rust
        rust_analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;

          settings = {
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
