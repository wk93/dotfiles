{
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;

      useSystemClipboard = true;

      options = {
        expandtab = true;
        shiftwidth = 2;
        smartindent = true;
        tabstop = 2;
        softtabstop = 2;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;

        otter-nvim.enable = true;
        lsplines.enable = true;
        nvim-docs-view.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      telescope.enable = true;

      languages = {
        enableLSP = true;
        enableFormat = true;

        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;

        ts.enable = true;
        tailwind.enable = true;
        html.enable = true;
        css.enable = true;
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };
    };
  };
}
