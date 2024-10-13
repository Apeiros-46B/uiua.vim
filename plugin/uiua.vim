let g:uiua_recommended_style = v:true
let g:uiua_format_on_save = v:true
let g:uiua_path = 'uiua'
let g:uiua_dark_theme = v:true

au BufWritePost *.ua	call uiua#Fmt(expand('<amatch>'))

hi def uiuaRed             ctermfg=197 guifg=#ed5e6a
hi def uiuaOrange          ctermfg=166 guifg=#ff8855
hi def uiuaYellow          ctermfg=221 guifg=#f0c36f
hi def uiuaBeige           ctermfg=222 guifg=#d7be8c
hi def uiuaGreen           ctermfg=118 guifg=#95d16a
hi def uiuaAqua            ctermfg=51  guifg=#6ad9ce
hi def uiuaBlue            ctermfg=39  guifg=#54b0fc
hi def uiuaIndigo          ctermfg=62  guifg=#8078f1
hi def uiuaPurple          ctermfg=129 guifg=#cc6be9
hi def uiuaPink            ctermfg=207 guifg=#f576d8
hi def uiuaLightPink       ctermfg=218 guifg=#f5a9b8
hi def uiuaFaded           ctermfg=244 guifg=#888888
hi def uiuaForegroundDark  ctermfg=0   guifg=#d1daec
hi def uiuaForegroundLight ctermfg=7   guifg=#334444

call uiua#ApplyTheme()
