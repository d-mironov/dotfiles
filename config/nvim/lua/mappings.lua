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
vnoremap("<leader>fe", "<CMD>NvimTreeToggle<CR>", { desc = "Open [f]ile [e]xplorer"})
nnoremap("<leader>fe", "<CMD>NvimTreeToggle<CR>", { desc = "Open [f]ile [e]xplorer"})

-- Open finder (files, etc.)
vnoremap("ff", "<CMD>Telescope find_files<CR>", { desc = "[F]ind [f]iles" })
nnoremap("ff", "<CMD>Telescope find_files<CR>", { desc = "[F]ind [f]iles" })

-- Open finder (files, etc.)
vnoremap("fw", "<CMD>Telescope live_grep<CR>", { desc = "[F]ind [w]ord in files" })
nnoremap("fw", "<CMD>Telescope live_grep<CR>", { desc = "[F]ind [w]ord in files" })

-- Search for files in buffer
vnoremap("FF", "<CMD>Telescope buffers<CR>", {desc = "[F]ind [F]ile in buffers"})
nnoremap("FF", "<CMD>Telescope buffers<CR>", {desc = "[F]ind [F]ile in buffers"})

-- Create new empty tab
vnoremap("tn", "<CMD>tabnew<CR>", {desc = "Open [n]ew [t]ab"})
nnoremap("tn", "<CMD>tabnew<CR>", {desc = "Open [n]ew [t]ab"})

-- Close current tab
vnoremap("tc", "<CMD>w <BAR> bd<CR>", {desc = "Close [c]urrent [t]ab"})
nnoremap("tc", "<CMD>w <BAR> bd<CR>", {desc = "Close [c]urrent [t]ab"})

-- Move to next tab
vnoremap("tl", "<CMD>tabnext<CR>", {desc = "Move to the next tab"})
nnoremap("tl", "<CMD>tabnext<CR>", {desc = "Move to the next tab"})

-- Move to previous tab
vnoremap("th", "<CMD>tabprev<CR>", {desc = "Move to previous tab"})
nnoremap("th", "<CMD>tabprev<CR>", {desc = "Move to previous tab"})


-- Goto first tab
vnoremap("tf", "<CMD>tabfirst<CR>", {desc = "Goto [f]irst [t]ab"})
nnoremap("tf", "<CMD>tabfirst<CR>", {desc = "Goto [f]irst [t]ab"})

-- Goto first tab
vnoremap("<leader>fm", "<CMD>Neoformat<CR>", {desc = "Auto[f]or[m]at the file"})
nnoremap("<leader>fm", "<CMD>Neoformat<CR>", {desc = "Auto[f]or[m]at the file"})

-- Clear Notifications
vnoremap("<leader>cn", "<CMD>NotificationsClear<CR>", { desc = "[C]lear [N]otifications" })
nnoremap("<leader>cn", "<CMD>NotificationsClear<CR>", { desc = "[C]lear [N]otifications" })


-- Toggle Terminal
vnoremap("<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Open Terminal" })
nnoremap("<leader>tt", "<CMD>ToggleTerm<CR>", { desc = "Open Terminal" })
