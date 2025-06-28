{
  enable = true;
  autoEnableSources = true;
  settings = {
    sources = [
      { name = "nvim_lsp"; }
      { name = "path"; }
      { name = "buffer"; }
    ];
    mapping = {
      __raw = ''
        cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Replace
          }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
                return
              end
              cmp.select_next_item()
            end,
        })
        '';
    };
    window = {
      completion = {
        border = [ "🭽" "▔" "🭾" "▕" "🭿" "▁" "🭼" "▏" ];
      };
      documentation = {
        border = [ "🭽" "▁" "🭾" "▏" "🭿" "▁" "🭼" "▏" ];
      };
    };
    formatting = {
    };
  };
}
