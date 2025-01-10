" vim:foldmethod=marker
" Handwritten Uiua syntax highlighting by Apeiros-46B
" Experimental features included, deprecated features not included
" VERSION: updated 2025.01.10 - for Uiua 0.15.0

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "uiua"
syn iskeyword a-z,A-Z

syn match   uiuaIdentifier   '\a\+\(₋\?[₀-₉]\+\)\?'
syn match   uiuaMacroSpecial '\(\^[0-9]\+\|[←↚]^\)'
syn match   uiuaPunctuation  '[←↚_;~]\|=\~'
syn match   uiuaDelimiters   '[\[\]{}()]'

" {{{ functions and modifiers
" {{{ subscriptable functions that can vary in adicity
" the order in which these are defined is weird but this is intentional to
" make the highlight priority correct
syn match   uiuaDyadic   '⊟\(₀*₂\)\?\|[⊏⊡↙↘⊂↻⤸◫]'
syn match   uiuaDyadicP  '\(!=\|<=\|>=\|[=≠<≤>≥+\-×*÷%◿ⁿₙ↧↥∠ℂ∨]\)'
syn match   uiuaMonadic  '□\(₀*₁\)\?\|⊟\(₀*₁\)'
syn match   uiuaMonadic  '⍉\(₋\?[₀-₉]\+\)\?'
syn match   uiuaMonadic  '[⊏⊡↙↘⊂↻⤸◫]\(₋\?[₀-₉]\+\)'
syn match   uiuaMonadicP '[¬±`⌵∿]\|[¯√⌊⌈⁅]\(₋\?[₀-₉]\+\)\?'
syn match   uiuaMonadicP '\(!=\|<=\|>=\|[=≠<≤>≥+\-×*÷%◿ⁿₙ↧↥∠ℂ]\)\(₋\?[₀-₉]\+\|[⌞⌟]\)'
syn match   uiuaDyadic   '□₀*₂'
syn match   uiuaTriadic  '[⊟□]₀*₃'
syn match   uiuaTetradic '[⊟□]₀*₄'
syn match   uiuaPentadic '[⊟□]\(₀*[₅-₉]\|[₀-₉]\{2,}\)'
syn match   uiuaNoadic   '[⊟□]₀\+'
" }}}

" stack functions
syn keyword uiuaStack  dup[licate] ove[r] aro[und] fli[p] po[p]
syn match   uiuaStack  '[.,'’:◌]'

" noadic functions
" tau, eta, pi, and infinity are considered numeric literals
syn keyword uiuaNoadic rand[om] tag now timezone
syn match   uiuaNoadic '⚂'

" monadic functions
" tau, eta, pi, and infinity are considered numeric literals
syn keyword uiuaMonadic len[gth] sha[pe] ran[ge] fir[st] las[t] rev[erse] des[hape] fix bit[s] tran[spose] ris[e] fal[e] sor[t] whe[re] cla[ssify] ded[uplicate] uni[que] box bx pars[e] wait recv tryrecv type repr csv json xlsx datetime fft graphemes
syn match   uiuaMonadic '[⧻△⇡⊢⊣⇌♭¤⋯⍏⍖⍆⊚⊛◰◴⋕↬]\|utf₈'
syn keyword uiuaMonadicP not sig[n] abs[olute] sqr[t] sin[e] flo[or] cei[ling] rou[nd]

" dyadic functions
syn keyword uiuaDyadic joi[n] cou[ple] mat[ch] pic[k] sel[ect] res[hape] tak[e] dro[p] rot[ate] win[dows] kee[p] fin[d] mem[berof] ind[exof] ass[ert] mas[k] ori[ent] send regex map has get remove img layout gif gen base
syn match   uiuaDyadic '[≍↯▽⌕∊∈⊗⍤⦷]'
syn keyword uiuaDyadicP  add sub[tract] mul[tiply] div[ide] mod[ulus] pow[er] log[arithm] min[imum] max[imum] ata[ngent] com[plex] or

" triadic functions
syn keyword uiuaTriadic insert audio

" monadic modifiers
" gap, dip, and identity single-letter spellings aren't accounted for
" 1. it's not very useful since adjacent ones won't be highlighted
" 2. it'll get formatted anyways
syn keyword uiuaMonadicMod gap dip on by wit[h] off abo[ve] bel[ow] rea[ch] bac[kward] eac[h] row[s] tab[le] inv[entory] rep[eat] fol[d] reduce scan gro[up] par[tition] un ant[i] bot[h] con[tent] tup[les] memo quote comptime spawn pool case struct obv[erse] st[encil]
syn match   uiuaMonadicMod '[⋅⊙◠◡𝄈⊞∧/\\⊕⊜°⌝◇⌅⍩]'
syn match   uiuaMonadicMod '[∩≡∵⍥⍚⧅⧈⟜⊸⤙⤚]\(₋\?[₀-₉]\+\)\?'
syn match   uiuaMonadicMod '[∩≡∵⍚𝄐][⌞⌟]'
syn match   uiuaMonadicMod '\a\+\(₋\?[₀-₉]\+\)\?!'

syn keyword uiuaDyadicMod sw[itch] do und[er] fil[l] bra[cket] for[k] try path
syn match   uiuaDyadicMod '[⨬⍢⍜⬚⊓⊃⍣]'
syn match   uiuaDyadicMod '[⊓][⌞⌟]'
syn match   uiuaDyadicMod '\a\+\(₋\?[₀-₉]\+\)\?\(!!\|‼\)'

syn match   uiuaTriadicMod '\a\+\(₋\?[₀-₉]\+\)\?\(‼!\|!‼\|!\{3,}\|‼\{2,}!*\)'
" }}}

" {{{ system functions
" defined in inverse order so precedence for e.g.
" &s and &sc, etc. is correct

" modules
syn match   uiuaTriadicSF    '\v\&(memcpy)'
syn match   uiuaDyadicSF     '\v\&(runs|rs|rb|ru|w|fwa|tcpsrt|tcpswt|ffi)'
syn match   uiuaMonadicSF    '\v\&(sl|s|pf|p|ep|epf|raw|var|runi|runc|cd|cl|fo|fc|fde|ftr|fe|fld|fif|fras|frab|fwa|fmd|ims|gifs|ap|tlsc|tlsl|tcpl|tcpaddr|tcpa|tcpc|tcpsnb|invk|exit|memfree|camcap)'
syn match   uiuaNoadicSF     '\v\&(clip|sc|ts|args|asr)'
syn match   uiuaMonadicModSF '&ast'
" }}}

" {{{ literals
" numeric literal and numeric constants (including shadowable)
syn keyword uiuaNum eta pi tau inf[inity]
syn match   uiuaNum '[ηπτ∞]\|[¯`]\?\d\+\(\.\d\+\)\?\(e[¯`]\?\d\+\)\?'

syn keyword uiuaNumShadow e i NaN W MaxInt True False NULL ε

" escape sequence and format placeholder
syn match   uiuaEsc contained /\\\([\\'"_0nrtW]\|\\x[0-9a-fA-F]\{2}\|\\u[0-9a-fA-F]\{2}\)/
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

" modules
syn match   uiuaModPunct contained '---\|┌─╴\|└─╴\|\~'
syn match   uiuaModName contained '\a\+[‼!]*'
syn match   uiuaModMemberName contained '\~\s*\a\+[‼!]*\(\s\+\a\+[‼!]*\)*' contains=uiuaModPunct
syn match   uiuaModBind '^\a\+ \~' contains=uiuaModPunct,uiuaModName
syn match   uiuaModRef '\a\+\~\a\+[‼!]*' contains=uiuaModPunct,uiuaModName,uiuaModMemberName
syn match   uiuaModScope '^\(---\|┌─╴\|└─╴\)\(\a\+\( \~\( \a\+[‼!]*\)\+\)\?\)\?$' contains=uiuaModPunct,uiuaModName,uiuaModMemberName
syn match   uiuaModImportMember '\~\(\s\+\a\+[‼!]*\)\+$' contains=uiuaModPunct,uiuaModMemberName

" debug functions and labels
syn keyword uiuaDebug dump stack
syn match   uiuaDebug '?\(__[0-9]\+\|[₀-₉]\+\)\?'
syn match   uiuaLabel '\$\a\+'

" comments
syn match   uiuaSemanticComment contained 'Track caller!\|Experimental!\|No inline!\|Deprecated!'
syn match   uiuaSignatureComment contained '\(\a\+ \)*[?$]\( \a\+\)\+'
syn region  uiuaComment start='#' end='$' contains=uiuaSemanticComment,uiuaSignatureComment
" }}}

" {{{ highlight groups
hi def link uiuaIdentifier       uiuaForeground
hi def link uiuaMacroSpecial     uiuaForeground
hi def link uiuaPunctuation      uiuaForeground
hi def link uiuaDelimiters       uiuaForeground

hi def link uiuaStack            uiuaForeground
hi def link uiuaNoadic           uiuaRed
hi def link uiuaNoadicSF         uiuaRed
hi def link uiuaMonadic          uiuaGreen
hi def link uiuaMonadicSF        uiuaGreen
hi def link uiuaMonadicP         uiuaGreen
hi def link uiuaDyadic           uiuaBlue
hi def link uiuaDyadicSF         uiuaBlue
hi def link uiuaDyadicP          uiuaBlue
hi def link uiuaTriadic          uiuaIndigo
hi def link uiuaTriadicSF        uiuaIndigo
hi def link uiuaTetradic         uiuaPink
hi def link uiuaPentadic         uiuaForeground
hi def link uiuaMonadicMod       uiuaYellow
hi def link uiuaMonadicModSF     uiuaYellow
hi def link uiuaDyadicMod        uiuaPurple
hi def link uiuaTriadicMod       uiuaLightPink

hi def link uiuaNum              uiuaOrange
hi def link uiuaNumShadow        uiuaForeground
hi def link uiuaEsc              uiuaAqua
hi def link uiuaCharSpace        IncSearch
hi def link uiuaChar             uiuaAqua
hi def link uiuaFmt              uiuaAqua
hi def link uiuaStr              uiuaAqua
hi def link uiuaUnicodeLiteral   uiuaForeground

hi def link uiuaSignature        uiuaForeground
hi def link uiuaModPunct         uiuaForeground
hi def link uiuaModName          uiuaBeige
hi def link uiuaModMemberName    uiuaForeground
hi def link uiuaModBind          uiuaBeige
hi def link uiuaModRef           uiuaBeige
hi def link uiuaModImportMember  uiuaForeground
hi def link uiuaDebug            uiuaForeground
hi def link uiuaLabel            uiuaGreen
hi def link uiuaSemanticComment  uiuaFaded
hi def link uiuaSignatureComment uiuaFaded
hi def link uiuaComment          uiuaFaded
" }}}
