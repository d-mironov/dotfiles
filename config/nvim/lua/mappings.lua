local g = vim.g
local utils = require("utils")
local noremap = utils.noremap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local tnoremap = utils.tnoremap
local vnoremap = utils.vnoremap
local api = vim.api



local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


-- Change window focus
nnoremap("<C-J>", "<CMD>wincmd j<CR>", { desc = "Focus window beneath"})
nnoremap("<C-K>", "<CMD>wincmd k<CR>", { desc = "Focus window above"})
nnoremap("<C-L>", "<CMD>wincmd l<CR>", { desc = "Focus window right"})
nnoremap("<C-H>", "<CMD>wincmd h<CR>", { desc = "Focus window left"})
tnoremap("<C-J>", "<CMD>wincmd j<CR>", { desc = "Focus window beneath"})
tnoremap("<C-K>", "<CMD>wincmd k<CR>", { desc = "Focus window above"})
tnoremap("<C-L>", "<CMD>wincmd l<CR>", { desc = "Focus window right"})
tnoremap("<C-H>", "<CMD>wincmd h<CR>", { desc = "Focus window left"})
nnoremap("<C-Tab>", "<CMD>bnext<CR>", { desc = "Cycle through buffers"})

nnoremap("sv", "<C-W>v", { desc = "[S]plit [V]ertical"})
nnoremap("sh", "<C-W>s", { desc = "[S]plit [H]orizontal"})

-- Open file explorer
vnoremap("fe", "<CMD>NvimTreeToggle<CR>", { desc = "Open file explorer"})
nnoremap("fe", "<CMD>NvimTreeToggle<CR>", { desc = "Open file explorer"})
--vnoremap("fe", "<CMD>NERDTreeToggle<CR>", { desc = "Open file explorer"})
--nnoremap("fe", "<CMD>NERDTreeToggle<CR>", { desc = "Open file explorer"})

-- Open finder (files, etc.)
vnoremap("ff", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
nnoremap("ff", "<CMD>Telescope find_files<CR>", { desc = "Find files" })

-- Open finder (files, etc.)
vnoremap("fw", "<CMD>Telescope live_grep<CR>", { desc = "Find files" })
nnoremap("fw", "<CMD>Telescope live_grep<CR>", { desc = "Find files" })

-- Search for files in buffer
vnoremap("FF", "<CMD>Telescope buffers<CR>", {desc = "Search for files in buffers"})
nnoremap("FF", "<CMD>Telescope buffers<CR>", {desc = "Search for files in buffers"})

-- Create new empty tab
vnoremap("tn", "<CMD>tabnew<CR>", {desc = "Open new tab"})
nnoremap("tn", "<CMD>tabnew<CR>", {desc = "Open new tab"})

-- Close current tab
vnoremap("tc", "<CMD>w <BAR> bd<CR>", {desc = "Close current tab"})
nnoremap("tc", "<CMD>w <BAR> bd<CR>", {desc = "Close current tab"})

-- Move to next tab
vnoremap("tl", "<CMD>tabnext<CR>", {desc = "Move to the next tab"})
nnoremap("tl", "<CMD>tabnext<CR>", {desc = "Move to the next tab"})

-- Move to previous tab
vnoremap("th", "<CMD>tabprev<CR>", {desc = "Move to previous tab"})
nnoremap("th", "<CMD>tabprev<CR>", {desc = "Move to previous tab"})


-- Goto first tab
vnoremap("tf", "<CMD>tabfirst<CR>", {desc = "Goto first tab"})
nnoremap("tf", "<CMD>tabfirst<CR>", {desc = "Goto first tab"})

-- Goto first tab
vnoremap("fm", "<CMD>Neoformat<CR>", {desc = "Autoformat the file"})
nnoremap("fm", "<CMD>Neoformat<CR>", {desc = "Autoformat the file"})

-- TODO: Fix issue with match_all
-- nnoremap("<leader>s", ":SearchBoxMatchAll clear_matches=false<CR>", {desc = "Search in file"})
-- vnoremap("<leader>s", ":SearchBoxIncSearch visual_mode=true<CR>", {desc = "Search in file"})

nnoremap(":", "<cmd>FineCmdline<CR>", {desc = "Ex-Commandline"})

------------------------------> Open Terminal Window <----------------------------
-- api.nvim_create_autocmd("TermEnter", {
--     pattern = "term://*toggleterm#*",
--     command = "tnoremap <C-T> <CMD>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>" 
-- })
-- nnoremap("<C-T>", "<CMD>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>")
-- inoremap("<C-T>", "<ESC><CMD>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>")

-- inoremap("<S-Tab>", "<ESC>la")
