-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end


-- configure telescope
telescope.setup({
  -- configure custom mappings
  pickers = {
    find_files = {
      hidden = true,
    },
    -- https://www.reddit.com/r/neovim/comments/13fuazn/lsp_references_in_telescope/
    lsp_references = { fname_width = 100, },
    buffers = {
      show_all_buffers = true,
      ignore_current_buffer = true,
      sort_lastused = true,
      previewer = false,
      theme = "dropdown",
      -- layout_config = {
      --   vertical = {
      --     width = {0.5, max = 80},
      --     height = {0.3, max = 50},
      --     preview_width = 0.9
      --   }
      -- },
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
          ["kj"] = actions.close, -- close on kj
          ["<C-k>"] = actions.move_selection_previous, -- move to prev result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
        }
      }
    }
  },
  defaults = {
    file_ignore_patterns = { "node%_modules/.*", ".git/"},
    path_display = { "truncate" },
    layout_strategy = 'vertical',
    -- layout_config = {
    --   center = {
    --     width = 0.9,
    --     height = 0.8,
    --     preview_width = 0.9
    --   }
    -- },
    mappings = {
      i = {
        ["kj"] = actions.close, -- close on kj
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("recent_files")

