" Pluguins
call plug#begin()
Plug 'nvim-lua/plenary.nvim' "Dependênci do Telescope
Plug 'nvim-telescope/telescope.nvim' "Localiza arquivos
Plug 'andweeb/presence.nvim' "Presença do Discord (WSL1 ou Linux)
Plug 'wakatime/vim-wakatime' "WakaTime
Plug 'vim-airline/vim-airline' "barra inferior
Plug 'vim-airline/vim-airline-themes' "temas da barra inferior
Plug 'navarasu/onedark.nvim' "one dark mode
Plug 'kyazdani42/nvim-web-devicons' "icones geral
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } "gerencidor de abas
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "TSInstall C (dependência do Telescope)
Plug 'Raimondi/delimitMate' "Auto par () {} []
Plug 'kien/rainbow_parentheses.vim' "Cor dos pares de () {} []
Plug 'scrooloose/nerdtree' "See dirs and files
Plug 'Xuyuanp/nerdtree-git-plugin' "git and nerd tree
Plug 'ryanoasis/vim-devicons' "Icons for plugins
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "color for icons
Plug 'voldikss/vim-floaterm'
call plug#end()
    
" Basic Settins
set number
set nu
set autoindent
set incsearch
set noshowmode
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab

" Mapping
map <C-q> :quit!<CR>
map <C-s> :w<CR>
map <C-m> :FloatermNew --autoclose=0<CR>
map <S-q> :BufferLineCloseLeft<CR>
map <S-e> :BufferLineCloseRight<CR>
"map <F5> :w <CR> :!gcc % -o %< && ./%< <CR>
map <C-A-n> :FloatermNew --autoclose=0 gcc % -o %< && ./%<<CR>

" Color Theme
syntax on
colorscheme onedark

" Tab Buffer Config
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

nnoremap <Tab> :BufferLineCyclePrev<CR>

nnoremap <silent><C-PageUp> :BufferLineCycleNext<CR>
nnoremap <silent><C-PageDown> :BufferLineCyclePrev<CR>

nnoremap <silent><C-A-PageUp> :BufferLineMoveNext<CR>
nnoremap <silent><C-A-PageDown> :BufferLineMovePrev<CR>

nnoremap <silent><C-w> :BufferLinePickClose<CR>

" NERDTree Mapping
let NERDTreeMinimalUI=1
nnoremap <C-p> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=28

" Airline
let g:airline_powerline_fonts = 1 "Ativa ícones na AirLine

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Telescope Config
map <C-f> :Telescope find_files<CR> 
"Lista os arquivos em seu diretório de trabalho atual, respeita .gitignore

" Rainbow
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

"terminal
"map <F5> :FloatermKill<CR>
