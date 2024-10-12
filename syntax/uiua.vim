" vim:foldmethod=marker
" Handwritten Uiua syntax highlighting by Apeiros-46B
" VERSION: updated 2024.10.11 - for Uiua 0.13.0

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "uiua"
syn iskeyword a-z,A-Z

syn match   uiuaIdentifier   '\a\+\(__[0-9]\+\|[₀-₉]\+\)\?'
syn match   uiuaMacro        '\a\+[‼!]\+'
syn match   uiuaMacroSpecial '\(\^[0-9]\+\|[←↚]^\)'

" {{{ functions and modifiers
" {{{ subscriptable functions that can vary in adicity
" the order in which these are defined is weird but this is intentional to
" make the highlight priority correct
syn match   uiuaDyadic   '⊟\(__0*2\|₀*₂\)\?\|[⊏⊡↙↘⊂☇↻⤸◫⍉]'
syn match   uiuaDyadicP  '\(!=\|<=\|>=\|[=≠<≤>≥+\-×*÷%◿ⁿₙ↧↥∠ℂ]\)'
syn match   uiuaMonadic  '□\(__0*1\|₀*₁\)\?\|⊟\(__0*1\|₀*₁\)'
syn match   uiuaMonadic  '[⊏⊡↙↘⊂☇↻⤸◫⍉]\(__[0-9]\+\|[₀-₉]\+\)'
syn match   uiuaMonadicP '[¬±`¯⌵∿]\|[√⌊⌈⁅]\(__[0-9]\+\|[₀-₉]\+\)\?'
syn match   uiuaMonadicP '\(!=\|<=\|>=\|[=≠<≤>≥+\-×*÷%◿ⁿₙ↧↥∠ℂ]\)\(__[0-9]\+\|[₀-₉]\+\)'
syn match   uiuaDyadic   '□\(__0*2\|₀*₂\)'
syn match   uiuaTriadic  '[⊟□]\(__[3-9]\|__[0-9]\{2,}\|[₃-₉]\|[₀-₉]\{2,}\)'
syn match   uiuaNoadic   '[⊟□]\(__0\+\|₀\+\)'

" }}}

" stack functions
syn keyword uiuaStack  dup[licate] ove[r] aro[und] fli[p] po
syn match   uiuaStack  '[.,'’:◌]'

" noadic functions
" tau, eta, pi, and infinity are considered numeric literals
syn keyword uiuaNoadic rand[om] tag now timezone
syn match   uiuaNoadic '⚂'

" monadic functions
" tau, eta, pi, and infinity are considered numeric literals
syn keyword uiuaMonadic len[gth] sha[pe] ran[ge] fir[st] las[t] rev[erse] des[hape] fix bit[s] tran[spose] ris[e] fal[e] sor[t] whe[re] cla[ssify] ded[uplicate] uni[que] box par[se] wait recv tryrecv type repr csv json xlsx datetime fft graphemes
syn match   uiuaMonadic '[⧻△⇡⊢⊣⇌♭¤⋯⍏⍖⍆⊚⊛◰◴⋕↬]\|utf₈'
syn keyword uiuaMonadicP not sig[n] abs[olute] sqr[t] sin[e] flo[or] cei[ling] rou[nd]

" dyadic functions
syn keyword uiuaDyadic joi[n] cou[ple] mat[ch] pic[k] sel[ect] res[hape] rer[ank] tak[e] dro[p] rot[ate] win[dows] kee[p] fin[d] mem[berof] ind[exof] ass[ert] mas[k] ori[ent] send regex map has get insert remove img layout gif gen base
syn match   uiuaDyadic '[≍↯▽⌕∊∈⊗⍤⦷]'
syn keyword uiuaDyadicP  add sub[tract] mul[tiply] div[ide] mod[ulus] pow[er] log[arithm] min[imum] max[imum] ata[ngent] com[plex]

" triadic (or above) functions
syn keyword uiuaTriadic audio

" monadic modifiers
" gap, dip, and identity single-letter spellings aren't accounted for
" 1. it's not very useful since adjacent ones won't be highlighted
" 2. it'll get formatted anyways
syn keyword uiuaMonadicMod gap dip on by wit[h] off eac[h] row[s] tab[le] inv[entory] rep[eat] fol[d] reduce scan gro[up] par[tition] un ant[i] bot[h] con[tent] tup[les] abo[ve] bel[ow] memo quote comptime stringify spawn pool case struct obv[erse]
syn match   uiuaMonadicMod '[⋅⊙⟜⊸⤙⤚⊞⍚∧/\\⊕⊜°⌝◇◠◡⌅]\|[∩≡∵⍥⧅]\(__[0-9]\+\|[₀-₉]\+\)\?'

" non-monadic modifiers
syn keyword uiuaOtherMod sw[itch] do und[er] fil[l] bra[cket] for[k] try astar
syn match   uiuaOtherMod '[⨬⍢⍜⬚⊓⊃⍣]'
" }}}

" {{{ system functions
" defined in inverse order so precedence for e.g.
" &s and &sc, etc. is correct

" modules
syn match   uiuaTriadicSF    '\v\&(memcpy)'
syn match   uiuaDyadicSF     '\v\&(runs|rs|rb|ru|w|fwa|tcpsrt|tcpswt|ffi)'
syn match   uiuaMonadicSF    '\v\&(sl|s|pf|p|raw|var|runi|runc|cd|cl|fo|fc|fde|ftr|fe|fld|fif|fras|frab|fwa|fmd|ims|gifs|ap|tlsc|tlsl|tcpl|tcpaddr|tcpa|tcpc|tcpsnb|invk|exit|memfree|camcap)'
syn match   uiuaNoadicSF     '\v\&(clip|sc|ts|args|asr)'
syn match   uiuaMonadicModSF '&ast'
" }}}

" {{{ literals
" numeric literal and numeric constants
syn keyword uiuaNum eta pi tau inf[inity] e i NaN W MaxInt True False NULL
syn match   uiuaNum '[ηπτ∞]\|[¯`]\?\d\+\(\.\d\+\)\?\(e[¯`]\?\d\+\)\?'

" escape sequence and format placeholder
syn match   uiuaEsc contained /\\\([\\'"_0nrt]\|\\x[0-9a-fA-F]\{2}\|\\u[0-9a-fA-F]\{2}\)/
syn match   uiuaFmt contained '_'

" character literal
syn match   uiuaCharSpace contained ' '
syn match   uiuaChar '@.' contains=uiuaEsc,uiuaCharSpace

" string literal (plain, format, and multiline)
syn region  uiuaStr start='"' end='"' skip='\\"' contains=uiuaEsc
syn region  uiuaStr start='\$"' end='"' skip='\\"' contains=uiuaEsc,uiuaFmt
syn region  uiuaStr start='\$ ' end='$' contains=uiuaEsc,uiuaFmt

" unicode literal
syn match   uiuaUnicodeLiteral '\\\\[0-9a-fA-F]\{,5}'
" }}}

" {{{ misc
" function signatures
syn match   uiuaSignature '|\d\+\(\.\d\+\)\?'

" assignments, stranded arrays, and ' or '' line joining
syn match   uiuaFaded '[←↚_;]\|=\~\|\~'

" modules
syn match   uiuaModPunct contained '---\|┌─╴\|└─╴\|\~'
syn match   uiuaModName contained '\a\+[‼!]*'
syn match   uiuaModMemberName contained '\~\s*\a\+[‼!]*\(\s\+\a\+[‼!]*\)*' contains=uiuaModPunct
syn match   uiuaModBind '^\a\+ \~' contains=uiuaModPunct,uiuaModName
syn match   uiuaModRef '\a\+\~\a\+[‼!]*' contains=uiuaModPunct,uiuaModName,uiuaModMemberName
syn match   uiuaModScope '^\(---\|┌─╴\|└─╴\)\(\a\+\( \~\( \a\+[‼!]*\)\+\)\?\)\?$' contains=uiuaModPunct,uiuaModName,uiuaModMemberName
syn match   uiuaModImportMember '\~\(\s\+\a\+[‼!]*\)\+$' contains=uiuaModPunct,uiuaModMemberName

" debug functions and labels
syn keyword uiuaDebug dump stack trac[e]
syn match   uiuaDebug '⸮\|?\(__[0-9]\+\|[₀-₉]\+\)\?'
syn match   uiuaLabel '\$\a\+'

" comments
syn match   uiuaSemanticComment contained 'Track caller!\|Experimental!'
syn match   uiuaSignatureComment contained '\(\a\+ \)*?\( \a\+\)\+'
syn region  uiuaComment start='#' end='$' contains=uiuaSemanticComment,uiuaSignatureComment
" }}}

" {{{ highlight groups
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
" }}}
