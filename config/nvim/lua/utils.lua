local fn = vim.fn
local M = {}

function M.executable(name)
    if fn.executable(name) > 0 then
        return true
    end
    return false
end

local get_mapper = function(mode, noremap)
    return function(lhs, rhs, opts)
       opts = opts or {}
       opts.noremap = noremap
       vim.keymap.set(mode, lhs, rhs, opts)
    end
end

M.noremap = get_mapper("n", false)
M.nnoremap = get_mapper("n", true)
M.inoremap = get_mapper("i", true)
M.tnoremap = get_mapper("t", true)
M.vnoremap = get_mapper("v", true)

return M
