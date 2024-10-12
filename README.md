# uiua.vim

Simple plugin containing basic functionalities for writing [Uiua](https://uiua.org) in Vim/Neovim:

- Format on save
- Handwritten syntax highlighting mimicking the Uiua pad's colorscheme

All features of this plugin were originally part of my personal Neovim configuration, but the links to my configuration on the official Uiua site were a bit confusing, so I moved the functionality here.

## Installation

### [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'Apeiros-46B/uiua.vim'
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
require('lazy').setup {
  'Apeiros-46B/uiua.vim',
}
```

## Options

- `g:uiua_format_on_save` - Whether or not to format Uiua files on save (default = true)
- `g:uiua_path` - Path to Uiua executable (default = "uiua")

## Compared to [sputnick1124's plugin](https://github.com/sputnick1124/uiua.vim)

- Their plugin has more functionality (e.g. run and eval commands)
- This plugin has more up-to-date handwritten syntax highlighting covering more features

## Highlight groups

The default highlight groups try to mimic the Uiua pad. If you need to modify any of the highlight groups, do so in an `after/syntax/uiua.vim` file.

<details>
  <summary>Default highlight groups</summary>

  ```vim
  hi def link uiuaIdentifier          Normal
  hi def link uiuaMacro               Normal
  hi def link uiuaMacroSpecial        Normal
  
  hi def link uiuaStack               Normal
  hi def link uiuaNoadic              Red
  hi def link uiuaNoadicSF            Red
  hi def link uiuaMonadic             Green
  hi def link uiuaMonadicSF           Green
  hi def link uiuaMonadicP            Green
  hi def link uiuaDyadic              Blue
  hi def link uiuaDyadicSF            Blue
  hi def link uiuaDyadicP             Blue
  hi def link uiuaTriadic             Purple
  hi def link uiuaTriadicSF           Purple
  hi def link uiuaMonadicMod          Yellow
  hi def link uiuaMonadicModSF        Yellow
  hi def link uiuaOtherMod            Purple
  
  hi def link uiuaNum                 Orange
  hi def link uiuaEsc                 Aqua
  hi def link uiuaCharSpace           IncSearch
  hi def link uiuaChar                Aqua
  hi def link uiuaFmt                 Aqua
  hi def link uiuaStr                 Aqua
  hi def link uiuaUnicodeLiteral      Normal
  
  hi def link uiuaSignature           Normal
  hi def link uiuaFaded               Normal
  hi def link uiuaModPunct            Normal
  hi def link uiuaModName             Yellow
  hi def link uiuaModMemberName       Normal
  hi def link uiuaModBind             Yellow
  hi def link uiuaModRef              Yellow
  hi def link uiuaModImportMember     Normal
  hi def link uiuaDebug               Normal
  hi def link uiuaLabel               Green
  hi def link uiuaSemanticComment     Comment
  hi def link uiuaSignatureComment    Comment
  hi def link uiuaComment             Comment
  ```
</details>
