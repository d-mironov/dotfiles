local g = vim.g
local M = {}


g.gruvbox_flat_style = "soft"

M.gruvbox_material = function()
    g.gruvbox_material_diagnostic_virtual_text = "colored"
    g.gruvbox_material_color_override = { bg0 = {"#1D1D1D", "234"} }
    g.gruvbox_material_background = "hard"
    g.gruvbox_material_enable_bold = 1
    g.gruvbox_material_spell_foreground = "colored"
    g.gruvbox_material_transparent_background = 1

    g.airline_theme = "gruvbox_material"

    -- Setup some custom coloring for gruvbox-material
    vim.cmd [[
        function! s:gruvbox_material_custom() abort
            highlight! link TSPunctBracket Red
            highlight! link TSProperty Red
            highlight! link TSConstant Yellow
        endfunction
    
        augroup GruvboxMaterialCustom
            autocmd!
            autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
        augroup END

        colorscheme gruvbox-material
    ]]

    local msg = "Colorscheme: Gruvbox Material"
    vim.notify(msg, vim.log.levels.DEBUG, { title = "nvim-config" })
end

M.gruvbox_material()
