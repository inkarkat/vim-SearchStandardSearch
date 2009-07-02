" SearchDefaultSearch.vim: Re-activate the normal, built-in search in
" SearchRepeat. 
"
" DESCRIPTION:
"   When a non-default search type is active in SearchRepeat, the plain normal
"   search can be restored by typing '/<Return>'. This script adds and registers
"   mappings to perform only one normal search or to completely reactivate the
"   normal search. 
"
" USAGE:
"   The special searches all start with 'go...' (mnemonic: "go once to special
"   match"); and come in search forward (ending with '/') and search backward
"   (ending with '?') variants. 
"
" [count]go/ / go?	Search forward / backward to the [count]th occurrence of
"        	    	the current search pattern (plain normal search). 
"
"   For the SearchRepeat plugin, a parallel set of "go now and for next
"   searches" mappings (starting with 'gn...' instead of 'go...') is installed.
"   These mappings have the same effect, but in addition re-program the 'n/N'
"   keys to repeat the plain normal search (until another gn... search is used). 
"
" INSTALLATION:
"   Put the script into your user or system Vim plugin directory (e.g.
"   ~/.vim/plugin). 

" DEPENDENCIES:
"   - Requires Vim 7.0 or higher. 
"   - SearchRepeat.vim

" CONFIGURATION:
" INTEGRATION:
" LIMITATIONS:
" ASSUMPTIONS:
" KNOWN PROBLEMS:
" TODO:
"
" Copyright: (C) 2009 by Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"	001	03-Jul-2009	file creation from ingoplugin.vim. 

" Avoid installing twice or when in unsupported Vim version. 
if exists('g:loaded_SearchDefaultSearch') || (v:version < 700)
    finish
endif
let g:loaded_SearchDefaultSearch = 1

" These "go once" mappings also set a definite search direction, so they can be
" used to "revert" a ?search? into a /search/ and vice versa. 
nmap <silent> go/ :<C-U>let v:searchforward=1<CR><Plug>SearchRepeat_n
nmap <silent> go? :<C-U>let v:searchforward=0<CR><Plug>SearchRepeat_n


" Integration into SearchRepeat.vim

" In the standard search, the two directions never swap (it's always n/N, never
" N/n), because the search direction is determined by the use of the / or ?
" commands (exposed in v:searchforward), and handled internally in Vim. We must
" register 'gn?' with the opposite mapping, though, to avoid overriding the
" 'gn/'. This means that it'll never be listed as active, but it's at least
" included in the list. 
call SearchRepeat#Register("\<Plug>SearchRepeat_n", '/', 'gn/', 'Standard search forward', '')
call SearchRepeat#Register("\<Plug>SearchRepeat_N", '?', 'gn?', 'Standard search backward', '')
nnoremap <silent> gn/ :<C-U>let v:searchforward=1<Bar>call SearchRepeat#Execute("\<Plug>SearchRepeat_n", "\<Plug>SearchRepeat_N", 2)<CR>
nnoremap <silent> gn? :<C-U>let v:searchforward=0<Bar>call SearchRepeat#Execute("\<Plug>SearchRepeat_n", "\<Plug>SearchRepeat_N", 2)<CR>

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
