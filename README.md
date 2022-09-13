# moonxraccoon's Dotfiles
An install script will be added to install all dependencies and automate the neovim config process.

## Software Used
- neovim as my main Code Editor/IDE
- kitty as a terminal

## NeoVim config and keybinds
The config is strucured like so:
```
nvim
|____ lua
|     |____ keybinds.lua    <= Keybind config is here (obviously)
|     |____ plugins.lua     <= The packer.nvim plugin list
|     |____ setup.lua       <= Setup for all the plugins
|     |____ util.lua        <= Utility function
|     |____ lsp.lua         <= Add your LSP configuration here
|____ init.lua              <= inital configuration and theme selection
```
**Adding an LSP for autocompletion:**
To use the autocompletion you need to go to the file you want the autocompletion to 
work on. Then you install the language server with `:LspInstall` and select the 
languageserver you want. Once it is installed you can add the LSP to the autocompletion like so:
```lua
require('lspconfig')['<YOUR_LSP>'].setup {
    capabilities = capabilities
}
```
Where `YOUR_LSP` is the LSP name you installed.  
Once I have the time, I will also automate this process so you just need to type `:AddLspConfig`.

**General Keybinds:**
`Ctrl + h/j/k/l`: Change window focus to left/beneath/above/right window  
`Ctrl + t`: Open/Close floating terminal  
`fe`: Open/Close the file explorer on the left  
`ff`: Open the fuzzy finder to find files faster  
`FF`: Search for already open files  
`tn`: Create a new, empty tab  
`tc`: Close the current tab, if it is not empty  
`tl`: Move to the next tab  
`th`: Move to the previous tab  
`tf`: Go to the first tab  
`fm`: Format the file you are in (Also formats on saving file)

When in Autocompletion:  
`Tab`: Go to next autocomplete suggestion  
`Shift + Tab`: Go to previous autocomplete suggestion
`Return`: Use the selected autocompletion  
`Ctrl + b/f`: Scroll through the documentation  

More keybinds will be added once I discover some new shortcuts for something.  

**First install:**
On first install you need to comment out some lines in the `init.lua` like so:
```lua
-- require("impatient").enable_profile()
vim.cmd [[
runtime! lua/plugins.lua
"runtime! lua/keybinds.lua
"runtime! lua/setup.lua
"runtime! lua/lsp.lua
runtime! lua/init.lua
]]
```
Then you need to call `:PackerInstall` to install all of the plugins needed for the setup process. 
After that you can uncomment the lines again and you should be good to go.
