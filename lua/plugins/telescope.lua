return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    -- local telescopeUtils = require("telescope.utils")
    local actions = require("telescope.actions")

    local function filename_first(_, entry)
      local tail = entry.tail or entry.value
      local path = entry.path or entry.value
      return string.format("%s (%s)", tail, path)
    end

    local function display_filename_first(opts, path)
      local tail = telescopeUtils.path_tail(path) -- Extracts the filename
      return tail .. " -> " .. path -- Concatenates filename first, then an arrow, then full path
    end

    telescope.setup({
      defaults = {
        layout_strategy = "flex",
        -- path_display = { truncate = 15 },
        -- to get more config options see :help telescope.setup()
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s (%s)", tail, path)
        end,
        layout_config = {
          width = 0.80,
          prompt_position = "bottom",
          preview_cutoff = 120,
          horizontal = { mirror = false },
          vertical = { mirror = false },
        },
        -- path_display = {
        --   "shorten",
        -- },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}
