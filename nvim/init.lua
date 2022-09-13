require("impatient").enable_profile()

local g = vim.g
local o, wo, bo = vim.o, vim.wo, vim.bo

vim.cmd [[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]


vim.cmd [[
runtime! lua/plugins.lua
runtime! lua/keybinds.lua
runtime! lua/setup.lua
runtime! lua/lsp.lua
runtime! lua/init.lua
]]

------------------------------> THEME CONFIGURATION <---------------------------------
--[
-- Following themes are available by default:
--      gruvbox, gruvbox-material, gruvbox-flat (default), onedarkpro, tokyonight, 
--      github-theme, everforest, minimal-base16, base16-x, minimalist
--
-- You can add your own themes in `plugins.lua`, call `:PackerInstall`, and add them here 
-- after.
--]

------------> Theme Specific configurations <----------
g.gruvbox_flat_style = "soft"

------------> colorscheme selection <------------------
vim.cmd [[
    colorscheme gruvbox-flat
"    colorscheme everforest
"    colorscheme base16-material-darker
"    colorscheme minimal-base16
"    colorscheme gruvbox-material
"    colorscheme onedarkpro
]]

---------> Airline Theme <-------
-- g.airline_theme = "gruvbox_material"
g.airline_theme = "gruvbox-flat"
-- g.airline_theme = "everforest"
--------------------------------------------------------------------------------------
