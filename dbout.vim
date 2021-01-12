" Vim syntax file
" " Language: db output
" " Maintainer: Jason Munro

source ~/.config/backup/archlinux.vim
set nowrap
set scrollopt=hor

syn region Heading start=/^ \l/ end=/[-+]\+$/
syn match Border "|"
syn match IntVal " \d\+\(\n\| \)"
syn match NullVal " NULL\(\n\| \)"
syn match NegVal " -\d\+\(\n\| \)"
syn match FloatVal " \d\+\.\d\+\(\n\| \)"
syn match NegFloatVal " -\d\+\.\d\+\(\\n\| \)"
syn match DateTime "\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}\(\.\d\{1,}\|\)"
syn match Time "\d\{2}:\d\{2}:\d\{2}"
syn match TrueVal " t\(\n\| \)"
syn match FalseVal " f\(\n\| \)"

hi def Heading ctermfg=246
hi def IntVal ctermfg=229
hi def FalseVal ctermfg=88
hi def NullVal ctermfg=242
hi def Border ctermfg=240
hi def NegFloatVal ctermfg=160
hi def FloatVal ctermfg=230
hi def NegVal ctermfg=160
hi def DateTime ctermfg=111
hi def Time ctermfg=112
hi def TrueVal ctermfg=64

nmap <F8> :silent! %s/"/\\"/g<CR>:%s/^\-\-\-.*$//g<CR>:%s/^(\d.*//g<CR>:%s/\s\+\|\s/";"/g<CR>:g/^$/d<CR>:%s/^\s*/"/g<CR>:%s/\s*$/"/g<CR>:silent! %s/"\s\+/\"/g<CR>
