" env cfg {
let g:iswindows = 0
let g:islinux = 0
let g:isGUI = 0

if has("gui_running")
	let g:isGUI = 1
else
	let g:isGUI = 0
endif

if(has("win32") || has("win64"))
	let g:iswindows = 1
	source $VIM/.vimrc-mini
else
	let g:islinux = 1
	source ~/.vimrc-mini
endif

"} /* end of env cfg */

"Vundle cfg {
	" ----------------------------------------------------------
	"  Vundle plugin manager
	" --------------------------------------------------------------
	"help:h vundle
	" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	" ------------------------------------------------------------------

	set nocompatible
	filetype off

	if g:islinux
		set rtp+=~/.vim/bundle/vundle/
			call vundle#rc()
	else
			" where is the vundle
		set rtp+=$VIM/vimfiles/bundle/vundle/
			" path the plugin install
		call vundle#rc('$VIM/vimfiles/bundle/')
	endif

	Bundle 'gmarik/vundle'
	Bundle 'a.vim'
	Bundle 'taglist.vim'

	Bundle 'vim-airline/vim-airline'
	Bundle 'vim-airline/vim-airline-themes'
	Bundle 'tpope/vim-fugitive'
	Bundle 'airblade/vim-gitgutter'

	Bundle 'DoxygenToolkit.vim'
	Bundle 'altercation/vim-colors-solarized'
	Bundle 'tomasr/molokai'
	Bundle 'morhetz/gruvbox'
	Bundle 'dracula/vim'
	Bundle 'The-NERD-tree'
	Bundle 'The-NERD-commenter'

	Bundle 'rking/ag.vim'
	Bundle 'freereaper/ctrlsf.vim'
	Bundle 'shougo/unite.vim'
	Bundle 'terryma/vim-multiple-cursors'
	Bundle 'bronson/vim-trailing-whitespace'

	"windows install YCM too complictated
	Bundle 'Valloric/YouCompleteMe'
	"Bundle 'rdnetto/YCM-Generator'
	Bundle 'Valloric/ListToggle'

	"Bundle 'Shougo/neocomplete'
	"Bundle 'OmniCppComplete'
	Bundle 'scrooloose/syntastic'
	Bundle 'ultisnips'

	Bundle 'ctrlp.vim'
	"Bundle 'mru.vim'
	Bundle 'YankRing.vim'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'godlygeek/tabular'
	Bundle 'plasticboy/vim-markdown'
	"not suitable
	"Bundle 'airblade/vim-gitgutter'
	Bundle 'freereaper/cscope.vim'
	Bundle 'christoomey/vim-tmux-navigator'
"} /* end  of vundle cfg */


"------------------------------------------------------------------------------
" general cfg {
	filetype on
	filetype plugin on
	filetype plugin indent on
	set completeopt=longest,menu

	syntax on
	syntax enable
"} /* end of general cfg */
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" solarized cfg {
	let g:solarized_termtrans=1
	let g:solarized_contrast="high"
	let g:solarized_visibility="high"
	let g:solarized_termcolors = 256
	set background=dark
	colorscheme solarized
"} /* end of solarized cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" molokai cfg {
	let g:molokai_original = 1
	let g:rehash256 = 1
	"colorscheme molokai
"} /* end of molokai cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
"dracula-theme cfg {
	"color dracula
"} /* end of dracula-theme cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" gruvbox cfg {
	set background=dark
	let g:gruvbox_termcolors=256
	let g:gruvbox_italic=1
	let g:gruvbox_contrast_dark='hard'
	let g:gruvbox_contrast_light='light'
"} /* end of gruvbox cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
"NERD-tree cfg {
	let g:NERDTree_title="[NERDTree]"
	let NERDTreeChDirMode=2
	let NERDTreeWinPos ="left"
	let NERDTreeShowBookmarks=1
	"let NERDTreeDirArrows=1
	let NERDTreeWinSize=22
	let NERDTreeQuitOnOpen=1 "打开文件时关闭树
	"let NERDTreeMinimalUI=1
	map <silent> ne :NERDTreeToggle<cr>
	function! NERDTree_Start()
	    exec 'NERDTree'
	endfunction

	function! NERDTree_IsValid()
	    return 1
	endfunction

	"help for NERDTree
	"  o open the file
	"  t open the file in a new tab
	"  T open the file using a new tab silently
	"  ! excute the file
	"  p go to upper dir
	"  P go to root dir
	"  K jump to the first node
	"  J jump to the last dir
	"  u open upper dir
	"  m menu
	"  ? help
	"  q exit
	"  r refresh
	" :Bookmark <name>
	"    add the selectd node to the bookmark
	":BookmarkToRoot <bookmark>
	"    parent node
	":RevealBookmark <bookmark>
	"    choose the specified bookmark
	":OpenBookmark <bookmark>
	"    open the bookmark
	":ClearBookmarks [<bookmarks>]
	"   clear the specified bookmarks, if not given, default is all
	":ClearAllBookmarks
	"    clear all bookmarks
	":ReadBookmarks
	"    reload all bookmarks in 'NERDTreeBookmarksFile'

"} /* end of NERD-tree cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Taglist cfg {
	let Tlist_Show_One_File =1
	let Tlist_Exit_OnlyWindow =1
	let Tlist_Use_Right_Window =1
	let Tlist_GainFocus_On_ToggleOpen = 1
	let Tlist_Close_On_Select=1
	let Tlist_Process_File_Always = 1
	"let Tlist_WinHeight = 30
	let Tlist_WinWidth = 30
	let Tlist_Inc_Winwidth=0
	map <silent> tl :TlistToggle<cr>
"} /* end of taglist cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" DoxygenToolkit cfg {
	let g:DoxygenToolkit_authorName="Li Ming <Lee.dhucst@gmail.com>"
	let g:DoxygenToolkit_authorName= g:DoxygenToolkit_authorName
	let g:DoxygenToolkit_paramTag_pre="@Param "
	"let g:DoxygenToolkit_briefTag_funcName="yes"
	let g:doxygen_enhanced_color=1
	nnoremap <F4> : Dox <CR>
	nnoremap <C-F4> : DoxAuthor<CR>
	autocmd BufNewFile *.{h,hpp,c,cpp} DoxAuthor
"} /* end of DoxygenToolkit cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Nerd-tree commenter cfg{
	" ,c<space>     " comment <--> uncomment.
	" ,cm.
	" ,cs
	" ,cy
	" ,c$
	" ,cA
	" ,ca
	" ,cl
	" ,cb
	" ,cu
"} /* end of Nerd-tree commenter cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" a.vim cfg{
	"switch .h and related .c
	"vsplit
	"nnoremap <silent> <F12> :AV<CR>
	"split
	nnoremap <silent> <F12> :AS<CR>
"} /* end of a.vim cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" syntastic cfg {
	"let g:syntastic_check_on_open = 0
	"let g:syntastic_cpp_include_dirs = ['/usr/include/']
	"let g:syntastic_cpp_remove_include_errors = 1
	"let g:syntastic_cpp_check_header = 1
	"let g:syntastic_cpp_compiler = 'clang++'
	"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
	"let g:syntastic_error_symbol = 'x'
	"let g:syntastic_warning_symbol = '?'
	"let g:syntastic_enable_balloons = 1
	"let g:syntastic_enable_signs = 0
	"let g:syntastic_ignore_files = [".*\.py$"]
"} /* end of syntastic cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" ultisnips cfg {
	" Trigger configuration. Do not use <tab> if you use
	" https://github.com/Valloric/YouCompleteMe.
	"let g:UltiSnipsExpandTrigger="<c-cr>"
	"let g:UltiSnipsListSnippets="<c-l>"
	"let g:UltiSnipsJumpForwardTrigger="<tab>"
	"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
	"let g:UltiSnipsEditSplit="vertical"
"} /* end of ultisnips cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" ctrlp cfg {
	"cmds:
	"Ctrl-f:change mode in Files, buffers, mru
    "Ctrl-d:Toggle between full-path and filename only search.
    "Ctrl-r:Toggle between the string mode and full regexp mode.
    "Ctrl-t:Open the selected file in a new tab.
    "Ctrl-v:Open the selected file in a vertical split.
    "Ctrl-x:Open the selected file in a horizontal split.
    "Ctrl-z:chose the file you want to open
    "F5:Refresh the match window and purge the cache for the current director
	let g:ctrlp_map = ',,'
	"let g:ctrlp_cmd ='CtrlPMixed'
	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.o,tags  "windows
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags,*.o   " MacOSX/Linux
	let g:ctrlp_working_path_mode = 'rw'
  let g:ctrlp_regexp = 1
	let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|lib|png|jpg|a|obj|doc)$',
            \ 'link': '',
            \ }
	let g:ctrlp_follow_symlinks = 1

	if executable('ag')
		let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden --follow
					\ --ignore .git
					\ --ignore out
					\ --ignore .svn
					\ --ignore .hg
					\ --ignore .DS_Store
					\ -g ""'
		let g:ctrlp_use_caching = 0
	endif
"} /* end of ctrlp cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
"cscope.vim cfg {
"====================
" @file:cscope.sh
" #!/usr/bin/env bash
"	cscope -C "$@"
"===================
"enable cscope caseinsensitive
"	set csprg=$HOME/bin/cscope.sh
	let g:cscope_auto_connect_db = 1
	let g:cscope_search_case_insensitive = 1
	let g:cscope_split_threshold = 12000
	let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.hpp$'
	let g:cscope_vim_open_location_list = 0
	let g:cscope_auto_update = 0

	nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
	nnoremap <leader>ll :call ToggleLocationList()<CR>

	" s: Find this C symbol
	nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
	" g: Find this definition
	nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
	" d: Find functions called by this function
	nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
	" c: Find functions calling this function
	nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
	" t: Find this text string
	nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
	" e: Find this egrep pattern
	nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
	" f: Find this file
	nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
	" i: Find files #including this file
	nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
"} /* end of cscope.vim cfg */

  " vertical split using ctrl+space
		" s: Find this C symbol
	nnoremap  <C-\>s :call CscopeFind('s', expand('<cword>'), 'vertical')<CR>
	" g: Find this definition
	nnoremap  <C-\>g :call CscopeFind('g', expand('<cword>'), 'vertical')<CR>
	" d: Find functions called by this function
	nnoremap  <C-\>d :call CscopeFind('d', expand('<cword>'), 'vertical')<CR>
	" c: Find functions calling this function
	nnoremap  <C-\>c :call CscopeFind('c', expand('<cword>'), 'vertical')<CR>
	" t: Find this text string
	nnoremap  <C-\>t :call CscopeFind('t', expand('<cword>'), 'vertical')<CR>
	" e: Find this egrep pattern
	nnoremap  <C-\>e :call CscopeFind('e', expand('<cword>'), 'vertical')<CR>
	" f: Find this file
	nnoremap  <C-\>f :call CscopeFind('f', expand('<cword>'), 'vertical')<CR>
	" i: Find files #including this file
	nnoremap  <C-\>i :call CscopeFind('i', expand('<cword>'), 'vertical')<CR>
"} /* end of cscope.vim cfg */

"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" ctrlsf cfg [
	"let g:ctrlsf_default_root = 'project'
	let g:ctrlsf_default_root = 'reaper'
  let g:ctrlsf_debug_mode = 0

	"let g:ctrlsf_position = 'bottom'

	"let g:ctrlsf_mapping = {
	"	\ "next": "n",
	"	\ "prev": "N",
	"\}
  let g:ctrlsf_extra_backend_args = {
		\ "ag": "--follow"
		\}

	let g:ctrlsf_winsize = "100%"
	let g:ctrlsf_context = '-B 5 -A 3'

	nnoremap <C-\>t :CtrlSFToggle<CR>
	inoremap <C-\>t <Esc>:CtrlSFToggle<CR>
	nmap <C-f> <Plug>CtrlSFCwordExec
	vmap <C-f> <Plug>CtrlSFVwordExec
	"} /* end of ctrlsf cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" ag cfg {
	if executable('ag')
		set grepprg=ag\ --nogroup\ --nocolor
			let g:ag_highlight=1
		let g:ag_working_path_mode='r'
	endif
" } /* end of ag cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" xclip cfg {
	vnoremap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>
	nnoremap <C-c> :call setreg("\"", system("xclip -o -selection clipboard"))<CR>p
"} /* end of xclip cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" YankRing cfg{
	nnoremap <silent> <s-c> :YRShow<CR>
"} /* end of yankring cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
"ListToggle cfg{
	let g:lt_location_list_toggle_map = '<leader>l'
	let g:lt_quickfix_list_toggle_map = '<leader>q'
	let g:lt_height = 10
"}
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" easymotion cfg {
	let g:EasyMotion_do_mapping = 0 "diasble default mappings"
	"let g:EasyMotion_inc_highlight = 0
	"let g:EasyMotion_move_highlight = 0
	"let g:EasyMotion_landing_highlight = 0
	"type '1' and it matches both '1' and '!' in Find motion.
	let g:EasyMotion_use_smartsign_us = 1
	" Turn on case sensitive feature
	let g:EasyMotion_smartcase = 1


	let g:EasyMotion_prompt = '{n}>>> '
	nmap <leader><space> <Plug>(easymotion-lineanywhere)
	nmap / <Plug>(easymotion-sn)
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)

	hi link EasyMotionTarget ErrorMsg
    hi link EasyMotionShade  Comment
"} /* end of easymotion cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Tabular cfg {
	map <leader>b :Tab /=<CR>
	map <leader>bb :Tab /=\zs<CR>
"} /* end of Tabular cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" vim-markdown cfg{
	let g:vim_markdown_folding_disabled=1

"} /* end of vim-markdown cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" airline cfg {
	let g:airline_theme="solarized"

	let g:airline_powerline_fonts = 1

	let g:airline#extensions#tabline#show_tabs = 1
	let g:airline#extensions#tabline#show_buffers = 0
	let g:airline#extensions#tabline#tab_nr_type = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#buffer_nr_show = 1
	let g:airline#extensions#tabline#show_tab_type = 1
	let g:airline#extensions#tabline#show_tab_nr = 1
	let g:airline#extensions#tabline#buffers_label = 'b'
	let g:airline#extensions#tabline#tabs_label = 't'
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline#extensions#ctrlp#color_template = 'insert'
	let g:airline#extensions#ctrlp#show_adjacent_modes = 1

	let g:airline#extensions#whitespace#enabled = 0
	let g:airline#extensions#whitespace#symbol = '!'

	let g:airline#extensions#tabline#enabled = 1

	let g:airline#extensions#tabline#buffer_idx_mode = 1
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9
	nmap <leader>- <Plug>AirlineSelectPrevTab
	nmap <leader>+ <Plug>AirlineSelectNextTab
	let g:airline#extensions#tabline#exclude_preview = 1
"} /* end of airline cfg */
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" YCM cfg {
let g:ycm_global_ycm_extra_conf = "/home/reaper/.vim/.ycm_extra_conf_global.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
			\ 'ctrlsf' : 1,
			\ 'tagbar' : 1,
			\ 'unite' : 1,
			\ 'markdown' : 1,
			\ 'text' : 1
			\}

"} /* end of YCM cfg */
"------------------------------------------------------------------------------
