set nohlsearch
set incsearch
set ts=2
set shiftwidth=2
set expandtab
set showmode
set autoindent
set smartindent
set lazyredraw
set scrolloff=10

syntax on

syn sync fromstart

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"remove trailing whitespace
command TWS %s/\s\+$//

"return from insert mode to normal
"inoremap ii <ESC>
inoremap ;i <ESC>

"map ; to ;;
nnoremap ;; ;

"open and return to normal
nnoremap ;o o<ESC>

"push 0 register (last yank)
nnoremap ;p "0p

"find function
nnoremap ;f /function

"split sql/print/etc
function SplitString()
    let col = getpos('.')
    let pos = col[2] + 1
    let line = getline('.')
    if match(line, 'print(') > -1
        execute ':s/\(\(^\s*\).*\)\%<'.pos.'c/\1");\r\2print("/'
    else
        execute ':s/\(\(^\s*\$\w\+\).*\)\%<'.pos.'c/\1";\r\2 .= "/'
    endif
endfunction

nnoremap ;s :call SplitString()<cr>

"join sql/print/etc
nnoremap ;j JF"df"
