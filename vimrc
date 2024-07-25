"插件目录
"iamcco/markdown-preview.vim' Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
"Markdown预览
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && npx --yes yarn install', 'for': 'markdown'}
"python语法高亮
Plug 'vim-python/python-syntax'
"异步执行,我也不知道干嘛的
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"c++语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'
"自动补全括号
Plug 'jiangmiao/auto-pairs'
"目录树
Plug 'preservim/nerdtree'
"自动补全插件
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"在vim中运行终端
Plug 'skywind3000/vim-terminal-help'
"似乎是补全片段的插件,不怎么用喵
"Plug 'SirVer/ultisnips'
"目录树美化
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"自动输入法切换
Plug '520Matches/fcitx5.vim'
"制表插件
Plug 'dhruvasagar/vim-table-mode'
"多光标编辑
"Plug 'mg979/vim-visual-multi'
"配色方案
"Plug 'joshdick/onedark.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"汇编语言高亮
Plug 'HealsCodes/vim-gas'
"括号高亮
"Plug 'kien/rainbow_parentheses.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"插件管理↑

 "缓冲区切换按键映射
  nmap <silent> <Left> :bN<CR>
  nmap <silent> <Right> :bn<CR>

 "markdown预览快捷键映射
  let g:mkdp_browser = 'firefox' 
  nmap <silent> <F8> <Plug>MarkdownPreview        
  imap <silent> <F8> <Plug>MarkdownPreview       
  nmap <silent> <F9> <Plug>MarkdownPreviewStop   
  imap <silent> <F9> <Plug>MarkdownPreviewStop  

 "Python语法高亮设置
  let g:python_highlight_builtins = 1
  let g:python_highlight_all = 1
  let g:python_highlight_space_errors = 0
  let g:python_highlight_operators = 0

  "Airline配置
  let g:airline_theme='angr'
  let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
  let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
  let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
  let g:airline#extensions#tabline#buffer_nr_show = 1

  "Markdown制表插件
  let g:table_mode_corner='|'
  nmap <C-\> :TableModeToggle<CR>

"GUI配置
"if has("gui_running")
"	set t_Co=256
"	colorscheme onedark
"	set lines=30 columns=85
"	set guifont="JetBrainsMonoNL Nerd Font Mono 12"
"endif


"NerdTree设置
 nnoremap <F5> :NERDTreeToggle<CR>
 let g:NERDTreeDirArrowExpandable = '+'
 let g:NERDTreeDirArrowCollapsible = '-'


"YCM插件设置↓
 set encoding=UTF-8
 highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
 highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
 set completeopt=menu,menuone
 "let g:ycm_add_preview_to_completeopt = 0

"coc-nvim config 
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
highlight CocUnusedHighlight ctermfg=white

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
"set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 
 "C艹语法高亮配置↓
 syntax on
 let g:cpp_class_scope_highlight = 1
 let g:cpp_member_variable_highlight = 1
 let g:cpp_class_decl_highlight = 1
 let g:cpp_experimental_simple_template_highlight = 1
 let g:cpp_concepts_highlight = 1
 let g:cpp_no_function_highlight = 1
 
" Vim's default behavior
"if &compatible
"  set nocompatible
"endif

"杂七杂八的一些设置
  set number
  let g:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "'":"'"}
  set autoindent
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set cindent
  set nobackup
  set noswapfile
  setlocal noswapfile
  set bufhidden=hide
  set clipboard=unnamedplus
  set backspace=2
  set showcmd
  set noerrorbells
  "set nowrap
  "set cursorline
  set mouse=a
" set selection=exclusive
" set selectmode=mouse,key
  "json注释↓
  autocmd FileType json syntax match Comment +\/\/.\+$+


  "光标样式配置:
" Set cursor shape and color
"if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[6 q" 
    " REPLACE mode
    let &t_SR = "\<Esc>[2 q" 
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" 

"colorscheme
colorscheme default

" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线



"初音ミク大好き
"#############################################################################################
"#               ██╗  ██╗ █████╗ ████████╗███████╗██╗   ██╗███╗   ██╗███████╗                #
"#               ██║  ██║██╔══██╗╚══██╔══╝██╔════╝██║   ██║████╗  ██║██╔════╝                #
"#               ███████║███████║   ██║   ███████╗██║   ██║██╔██╗ ██║█████╗                  #
"#               ██╔══██║██╔══██║   ██║   ╚════██║██║   ██║██║╚██╗██║██╔══╝                  #
"#               ██║  ██║██║  ██║   ██║   ███████║╚██████╔╝██║ ╚████║███████╗                #
"#               ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝                #
"#                                                                                           #
"#                           ███╗   ███╗██╗██╗  ██╗██╗   ██╗                                 #
"#                           ████╗ ████║██║██║ ██╔╝██║   ██║                                 #
"#                           ██╔████╔██║██║█████╔╝ ██║   ██║                                 #
"#                           ██║╚██╔╝██║██║██╔═██╗ ██║   ██║                                 #
"#                           ██║ ╚═╝ ██║██║██║  ██╗╚██████╔╝                                 #
"#                           ╚═╝     ╚═╝╚═╝╚═╝  ╚═╝ ╚═════╝                                  #
""############################################################################################
"                                                    
"                        .:...:=.                    
"                    :=----:-=*+--                   
"                    =---:--:+*#++-                  
"                   :-:=--::.-*++=-:                 
"                  .+--.------##*---.                
"                  =+===:..===*#:-:::.               
"                 .=+-=+:.  :*+. :::::               
"                 :-*--+-:.:---. .:::::              
"                .:-==...:=---=.  -:::::             
"                :::--..+**--:  . ::::::.            
"               .::::-.:++=+=...: .-:::::.           
"               ::--:-::-=::--..:  --:::::.          
"              ..-=-=+=:+---+==--  .=-:::::          
"              ::+++*+:=*+=-+***=   +=-:::..         
"             ..-++*+.:+-+=-:+#*=   -+=:::. .        
"            . .++*+:.++:--. =##+   .++:... ..       
"            ..+****=-**-=+. =##*    =+=.... .       
"           ..=*====-+=**:== =##*.   :++::... .      
"          .::=:==---*-=-===-+#**-   .=+-:::....     
"          ::+=:++=++=+-:=*+-*#+=*    -*+:::::...    
"         ::-*++###%%+-=--+-+*%+=#.   :++::::::::    
"        .--##+#*#%%%#-::-*###%*=*=   .=+-::::::::   
"        -:*#*#-+#*##*#=*#**=#%*=+*    -*-:::::::-   
"       :::+*#*====****+**--.%%*++*:   :+-:::::::::  
"      .-:=+==-::::=-:-====:-%#*+=#+   .=-:::::::::  
"     .-:-**+++=-:.::  ..:-=*=***++:   .=-::::::::-  
"    .:::+***+##*#*=.   =#***-..:..    .--:::::::::  
"    :::-*#***##***-    .#***+         .-::--::::::. 
"   .:::=*#***##**+:     =#**#.        ::-=---:::::. 
"   :::-=*****##*#+:     .####-        ::=+==-:::::: 
"  .:::-==+***####=:      *###+        --**+=--::::. 
"  .::::-==+**####+-      -####       :-=**+=--::..  
"  ..:::--=***##*#*=       #***:      --+*++=--:. .  
"  ...::--=***%**#=+.      =**#-     :==+++===-:..   
"  :::-:--=*+*%##+:.:       *###.    =++++=====--.   
"  :::----=++#%##:  :.      :###*   :**+*++++++-:    
"  ::-----=++%%%+    .       -%#%+  -+*******+--     
"   --++===**%##:             -%%%: :-=+++***-:      
"   .-++*****%##               =##*  :.+++++-.       
"     =**+++:%#+                *##-  ..=-=.         
"      .==--:%#-                :%#*    ::           
"        .:::%#-                 +#*.   .            
"           .##=                 .#*+                
"           .#+*.                :**+:               
"           .#++-                ++=*-               
"            #*+*:              -*++#:               
"            :+--.              .-=--                
"                                  
