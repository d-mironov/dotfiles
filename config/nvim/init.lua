vim.loader.enable()

local function safe_require(mod)
    local ok, result = pcall(require, mod)
    if not ok then
        vim.notify("Error loading module: " .. mod, vim.log.levels.ERROR)
    end
    return result
end

local conf_files = {
    "settings",
    "plugins",
    "mappings",
    "colorschemes",
}

for _, mod in ipairs(conf_files) do
    package.loaded[mod] = nil
    safe_require(mod)
end
