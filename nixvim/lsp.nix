programs.nixvim.lsp = {
  enable = true;
  servers = {
    # Rust 语言服务器
    rust-analyzer = {
      enable = true;
      #installCargo = true;
      #installRustc = true;
      settings = {
        checkOnSave = {
          command = "clippy";
          allFeatures = true;
        };
        diagnostics = {
          disabled = ["unresolved-proc-macro"];
        };
      };
    };

  };
};
