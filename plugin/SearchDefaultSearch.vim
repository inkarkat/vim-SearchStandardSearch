" SearchDefaultSearch.vim: Re-activate the normal, built-in search in SearchRepeat.
"
" DEPENDENCIES:
"   - Requires Vim 7.2 or higher.
"   - SearchRepeat.vim autoload script
"   - ingo/err.vim autoload script

" Copyright: (C) 2009-2016 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   2.00.008	29-Apr-2016	Adapt to changed SearchRepeat.vim version 2.00
"				interface.
"   1.00.007	27-May-2014	Add isOpposite flag to SearchRepeat#Execute()
"				for SearchRepeat version 1.10.
"				FIX: Need to check status of
"				SearchRepeat#Execute() and :echoerr any error.
"   1.00.006	24-May-2014	Adapt to polished SearchRepeat interface.
"				Make go... mappings configurable.
"	005	06-May-2014	Split off documentation.
"	004	03-Oct-2009	BUG: Actually requiring Vim 7.2 for
"				v:searchforward.
"	003	17-Aug-2009	Added a:description to SearchRepeat#Register().
"	002	03-Jul-2009	BF: 'go/' and 'go?' mappings now do not depend
"				on SearchRepeat and handle [count] correctly.
"	001	03-Jul-2009	file creation from ingoplugin.vim.

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_SearchDefaultSearch') || (v:version < 702)
    finish
endif
let g:loaded_SearchDefaultSearch = 1

" These "go once" mappings also set a definite search direction, so they can be
" used to "revert" a ?search? into a /search/ and vice versa.
nnoremap <silent> <Plug>(SearchDefaultSearchNext) :<C-u>let v:searchforward=1<Bar>execute 'normal!' v:count1 . 'nzv'<CR>
if ! hasmapto('<Plug>(SearchDefaultSearchNext)', 'n')
    nmap go/ <Plug>(SearchDefaultSearchNext)
endif
nnoremap <silent> <Plug>(SearchDefaultSearchPrev) :<C-u>let v:searchforward=0<Bar>execute 'normal!' v:count1 . 'nzv'<CR>
if ! hasmapto('<Plug>(SearchDefaultSearchPrev)', 'n')
    nmap gO/ <Plug>(SearchDefaultSearchPrev)
    " Define this variant, too.
    nmap go? <Plug>(SearchDefaultSearchPrev)
endif


"- Integration into SearchRepeat.vim -------------------------------------------

" In the standard search, the two directions never swap (it's always n/N, never
" N/n), because the search direction is determined by the use of the / or ?
" commands (exposed in v:searchforward), and handled internally in Vim. We must
" register 'gn?' with the opposite mapping, though, to avoid overriding the
" 'gn/'. This means that it'll never be listed as active, but it's at least
" included in the list.
call SearchRepeat#Register("\<Plug>(SearchRepeat_n)", "\<Plug>(SearchRepeat_N)", '/', '/', '', 'Standard search', '')
execute printf('nnoremap <silent> %s/ :<C-u>let v:searchforward=1<Bar>if ! SearchRepeat#Execute(0, "\<Plug>(SearchRepeat_n)", "\<Plug>(SearchRepeat_N)", 2)<Bar>echoerr ingo#err#Get()<Bar>endif<CR>', g:SearchRepeat_MappingPrefixNext)
execute printf('nnoremap <silent> %s/ :<C-u>let v:searchforward=1<Bar>if ! SearchRepeat#Execute(0, "\<Plug>(SearchRepeat_n)", "\<Plug>(SearchRepeat_N)", 2)<Bar>echoerr ingo#err#Get()<Bar>endif<CR>', g:SearchRepeat_MappingPrefixPrev)
execute printf('nnoremap <silent> %s? :<C-u>let v:searchforward=0<Bar>if ! SearchRepeat#Execute(0, "\<Plug>(SearchRepeat_n)", "\<Plug>(SearchRepeat_N)", 2)<Bar>echoerr ingo#err#Get()<Bar>endif<CR>', g:SearchRepeat_MappingPrefixNext)

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
