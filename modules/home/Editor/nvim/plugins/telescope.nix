{
    repo = "nvim-telescope/telescope.nvim";
    config = ''
        require('telescope').setup {
            defaults = {
                prompt_prefix = "🔍 ",
                selection_caret = "❯ ",
                path_display = { "smart" 
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                hidden = true,
            },
        },
    '';
  }
