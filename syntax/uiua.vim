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
syn match   uiuaPunctuation  '[←↚_;~[]{}()]\|=\~'

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
syn match   uiuaTriadic  '[⊟□]\(__3\|₃\)'
syn match   uiuaOther    '[⊟□]\(__[4-9]\|__[0-9]\{2,}\|[₄-₉]\|[₀-₉]\{2,}\)'
syn match   uiuaNoadic   '[⊟□]\(__0\+\|₀\+\)'
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
syn keyword uiuaMonadic len[gth] sha[pe] ran[ge] fir[st] las[t] rev[erse] des[hape] fix bit[s] tran[spose] ris[e] fal[e] sor[t] whe[re] cla[ssify] ded[uplicate] uni[que] box pars[e] wait recv tryrecv type repr csv json xlsx datetime fft graphemes
syn match   uiuaMonadic '[⧻△⇡⊢⊣⇌♭¤⋯⍏⍖⍆⊚⊛◰◴⋕↬]\|utf₈'
syn keyword uiuaMonadicP not sig[n] abs[olute] sqr[t] sin[e] flo[or] cei[ling] rou[nd]

" dyadic functions
syn keyword uiuaDyadic joi[n] cou[ple] mat[ch] pic[k] sel[ect] res[hape] rer[ank] tak[e] dro[p] rot[ate] win[dows] kee[p] fin[d] mem[berof] ind[exof] ass[ert] mas[k] ori[ent] send regex map has get remove img layout gif gen base
syn match   uiuaDyadic '[≍↯▽⌕∊∈⊗⍤⦷]'
syn keyword uiuaDyadicP  add sub[tract] mul[tiply] div[ide] mod[ulus] pow[er] log[arithm] min[imum] max[imum] ata[ngent] com[plex]

" triadic functions
syn keyword uiuaTriadic insert audio

" monadic modifiers
" gap, dip, and identity single-letter spellings aren't accounted for
" 1. it's not very useful since adjacent ones won't be highlighted
" 2. it'll get formatted anyways
syn keyword uiuaMonadicMod gap dip on by wit[h] off abo[ve] bel[ow] bac[kward] eac[h] row[s] tab[le] inv[entory] rep[eat] fol[d] reduce scan gro[up] par[tition] un ant[i] bot[h] con[tent] tup[les] memo quote comptime stringify spawn pool case struct obv[erse]
syn match   uiuaMonadicMod '[⋅⊙⟜⊸⤙⤚◠◡˜⊞⍚∧/\\⊕⊜°⌝◇⌅]\|[∩≡∵⍥⧅]\(__[0-9]\+\|[₀-₉]\+\)\?'

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
hi def link uiuaIdentifier       uiuaForeground
hi def link uiuaMacro            uiuaForeground
hi def link uiuaMacroSpecial     uiuaForeground
hi def link uiuaPunctuation      uiuaForeground

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
hi def link uiuaOther            uiuaPink
hi def link uiuaOtherSF          uiuaPink
hi def link uiuaMonadicMod       uiuaYellow
hi def link uiuaMonadicModSF     uiuaYellow
hi def link uiuaOtherMod         uiuaPurple

hi def link uiuaNum              uiuaOrange
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
hi def link uiuaSemanticComment  uiuaComment
hi def link uiuaSignatureComment uiuaComment
hi def link uiuaComment          uiuaComment
" }}}
