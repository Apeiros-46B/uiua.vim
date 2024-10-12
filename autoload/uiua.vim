" Parts of uiua.vim by sputnick1124 on GitHub reused
" (under the MIT license, available at https://github.com/sputnick1124/uiua.vim)

function uiua#Fmt(buf)
	if g:uiua_format_on_save
		exec 'silent!' '!'.shellescape(g:uiua_path) 'fmt' bufname('%')

		" don't break folds
		mkview | e | loadview
	endif
endfunction
