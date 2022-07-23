local u = require "util"
local noremap = u.noremap
local nnoremap = u.nnoremap
local inoremap = u.inoremap
local tnoremap = u.tnoremap
local vnoremap = u.vnoremap
local api = vim.api


-- Change window focus
nnoremap("<C-J>", "<C-W><C-J>", { desc = "Focus window beneath"})
nnoremap("<C-K>", "<C-W><C-K>", { desc = "Focus window above"})
nnoremap("<C-L>", "<C-W><C-L>", { desc = "Focus window right"})
nnoremap("<C-H>", "<C-W><C-H>", { desc = "Focus window left"})

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
vnoremap("tl", "<CMD>tabn<CR>", {desc = "Move to the next tab"})
nnoremap("tl", "<CMD>tabn<CR>", {desc = "Move to the next tab"})

-- Move to previous tab
vnoremap("th", "<CMD>tabp<CR>", {desc = "Move to previous tab"})
nnoremap("th", "<CMD>tabp<CR>", {desc = "Move to previous tab"})

-- Goto first tab
vnoremap("tf", "<CMD>tabfirst<CR>", {desc = "Goto first tab"})
nnoremap("tf", "<CMD>tabfirst<CR>", {desc = "Goto first tab"})


------------------------------> Open Terminal Window <----------------------------
api.nvim_create_autocmd("TermEnter", {
    pattern = "term://*toggleterm#*",
    command = "tnoremap <C-T> <CMD>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>" 
})
nnoremap("<C-T>", "<CMD>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>")
inoremap("<C-T>", "<ESC><CMD>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>")

inoremap("<S-Tab>", "<ESC>la")

------------------------------> TAB completion START <-----------------------------
--local t = function(str)
--        return vim.api.nvim_replace_termcodes(str, true, true, true)
--    end
--
--    local check_back_space = function()
--        local col = vim.fn.col('.') - 1
--        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
--    end
--
--    _G.tab_complete = function()
--        if vim.fn.pumvisible() == 1 then
--            return t "<C-n>"
--        elseif check_back_space() then
--            return t "<Tab>"
--        else
--            vim.fn["coc#refresh"]()
--        end
--    end
--
--    _G.s_tab_complete = function()
--        if vim.fn.pumvisible() == 1 then
--            return t "<C-p>"
--        else
--            return t "<C-h>"
--        end
--    end
--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--------------------------------> TAB completion END <-----------------------------
