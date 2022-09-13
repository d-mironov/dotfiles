# moonxraccoon's Dotfiles
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
