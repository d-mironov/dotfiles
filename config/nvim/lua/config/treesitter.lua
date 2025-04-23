local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
    ensure_installed = { 
        "c", "cpp", "zig", "asm", "devicetree",
        "verilog", "vhdl", 
        "python", -- "pip_requirements",
        "rust",
        "yaml", "toml", "csv", "json", "json5", "xml",
        "go", "gomod",
        "julia", 
        "diff", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "make", "cmake", "cairo", "kconfig", "linkerscript", "ninja", "objdump",
        "lua", "vim", "vimdoc", "comment", "meson", "regex", 
        "markdown", "markdown_inline",
        "css", "scss", "html", "typescript", "tsx", "http", "htmldjango", "javascript", "jsdoc",
        "php", "phpdoc", "php_only", "sql", "svelte", "vue", 
        "java", "properties", 
        "udev", "bash", "fish", "desktop", "dockerfile", "nix", "passwd", "printf", "ssh_config", "tmux",
        "xresources", "xcompose", 
        "typst", "latex", "bibtex",
        "c_sharp",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
}
