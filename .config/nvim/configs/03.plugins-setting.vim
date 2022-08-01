
"Airline and Airline theme

  " enable tabline
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#left_sep = ''
		let g:airline#extensions#tabline#left_alt_sep = ''
		let g:airline#extensions#tabline#right_sep = ''
		let g:airline#extensions#tabline#right_alt_sep = ''

  " enable powerline fonts
		let g:airline_powerline_fonts = 1
		let g:airline_left_sep = ''
		let g:airline_right_sep = ''

  " Switch to your current theme
		let g:airline_theme = 'onedark'

  " Always show tabs
		set showtabline=2

  " We don't need to see things like -- INSERT -- anymore
		set noshowmode


"Theme neovim 
		set termguicolors
		let g:tokyonight_style = 'night' " available: night, storm
		let g:tokyonight_enable_italic = 1
		colorscheme tokyonight



"Search file =ctrl + p
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|build|public|lib|dist)|(\.(git|svn))$',
    \ 'file': 'tags\|tags.lock\|tags.temp',
\ }

"NERDtree
let g:NERDTreeDirArrowExpandable="❤️"
let g:NERDTreeDirArrowCollapsible="🔥"
let g:NERDTreeShowBookmarks=1
		" Exit Vim if NERDTree is the only window remaining in the only tab.
		autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"ctrl p
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" config library js
let g:used_javascript_libs = 'underscore,backbone,jquery,angularjs,react,vue'

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>f
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>f
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

":Rg <search for word>
"ignore node modules folder
"
let g:rg_root_types = ['.git','/node_modules']

let g:rg_derive_root = 'true'
