vim.loader.enable()

local conf_files = {
    "settings.lua",
    "plugins.lua",
    "mappings.lua",
    "colorschemes.lua",
}

for _, file in ipairs(conf_files) do
    local modname, _ = string.gsub(file, "%.lua", "")
    package.loaded[modname] = nil
    require(modname)
end
