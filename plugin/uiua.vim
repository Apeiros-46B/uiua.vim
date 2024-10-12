let g:uiua_format_on_save = v:true
let g:uiua_path = 'uiua'

au BufWritePost *.ua	call uiua#Fmt(expand('<amatch>'))
