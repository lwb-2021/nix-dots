{
  programs.nixvim.keymaps = [
    {
      key = "<c-h>";
      action = "<c-w>h";
    }

    {
      key = "<c-j>";
      action = "<c-w>j";
    }
    {
      key = "<c-k>";
      action = "<c-w>k";
    }

    {
      key = "<c-l>";
      action = "<c-w>l";
    }





    {
      key = "<leader>e";
      mode = "n";
      action = "<cmd>NvimTreeToggle<cr>";
    }

  ];
}
