-- import which-key safely
local status, wk = pcall(require, "which-key")
if not status then
  return
end

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "Find File" },
    r = { "Open Recent File" }, -- additional options for creating the keymap
  },
  ["<CR>"] = { "Reload NVIM configuration" },
  ["+"] = {"Increment number"},
  ["-"] = {"Decrement number"},
  s = {
    name = "split management",
    v = { "Split window vertically" },
    h = { "Split window horizontally" },
    m = { "Maximise split" },
    e = { "Make split windows equal width & height" },
    x = { "Close current split window" },
  },
  t = {
    name = "tab management",
    o = { "Open new tab" },
    x = { "Close current tab" },
    n = { "Go to next tab" },
    p = { "Go to previous tab" },
  },
  ["r"] = { "Repeat last colon command" },
  ["R"] = { "Repeat last colon command" },
  ["."] = { "Code action" },
  ["q"] = { "Quit" },
  ["Q"] = { "Force Quit" },
  ["z"] = { "Quit all" },
  ["w"] = { "Save" },
  ["<leader>"]  = { "Close which-key" },
}, {prefix = "<leader>"})

