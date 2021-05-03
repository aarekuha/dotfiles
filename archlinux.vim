""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " Навигация по файлам
  Plug 'preservim/nerdcommenter'  " Быстрые комментарии
  Plug 'morhetz/gruvbox'  " Визуальная тема
  Plug 'tpope/vim-fugitive'  " Git комманды
  Plug 'airblade/vim-gitgutter'  " Отображение изменений
  Plug 'easymotion/vim-easymotion'  " Быстрое перемещение по видимой области
  Plug 'junegunn/fzf.vim'  " Поиск файлов и их содержимого
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'vim-airline/vim-airline'  " Статусная строка
  Plug 'vim-airline/vim-airline-themes'  " Оформлнение статусной строки
  Plug 'kshenoy/vim-signature'  " Метки на полях
  Plug 'Vimjas/vim-python-pep8-indent'  " Правильные отступы для python
  Plug 'dense-analysis/ale'  " Асинхронные линтеры
  Plug 'turbio/bracey.vim'  " Live-preview html
  Plug 'ryanoasis/vim-devicons'  " Иконки (nerd-tree, status-bar)
  Plug 'davidhalter/jedi-vim'  " Python автодополнение, навигация и т.п.
  Plug 'mg979/vim-visual-multi'  " Мультикурсоры
  Plug 'iamcco/markdown-preview.vim'  " Live-preview MD markdown
  Plug 'kdheepak/lazygit.nvim'
  Plug 'lifepillar/pgsql.vim'  " Подсветка postgres-синтаксиса
  Plug 'tpope/vim-dadbod'  " Подключение к БД и выполнение запросов
  Plug 'SirVer/ultisnips'  " Сниппеты
  Plug 'kamykn/popup-menu.nvim'
  Plug 'puremourning/vimspector'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'PhilRunninger/nerdtree-buffer-ops'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'mattn/vim-lsp-settings'
  Plug 'liuchengxu/vista.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Цветовое оформлени" Цветовое оформление
colorscheme gruvbox
hi Normal ctermfg=253 ctermbg=NONE  " Переопределение цвета фона

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Основные настройки
set number  " Отображение номеров строк
set clipboard^=unnamedplus  " Копирование в clipboard
set incsearch  " Инкрементальныый поиск
set smartcase  " Поиск: регистр важен только при наличии заглавных
set noswapfile  " Отключение временных файлов
set scrolloff=5  " Внизу/вверху всегда видно минимум 5 строк
set undofile  " Сохранение журнала изменений для каждого файла
set cursorline  " Подсветка текущей строки
set cursorcolumn  " Подсветка текущего столбца
set mouse=a  " Включение мыши
set autochdir  " Смена текущей директории на открытый файл
set relativenumber  " Относительные номера строк
set ic  " Игнорирование регистра при поиске
set tabstop=4  " Отступ
set softtabstop=4  " Soft tab width in spaces
set shiftwidth=4  " Amount of spaces when shifting
set expandtab
set textwidth=120  " Длина строки
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set tags=./tags,tags;$HOME  " Указывает где искать файл tags (текущая директория и выше, вплоть до домашней)
set list  " Отображение спецюсимволов
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·  " Спец.символы
set selection=exclusive  " Убирает выделение символа конца строки
set omnifunc=ale#completion#OmniFunc
set fileencodings=utf-8,cp1251,koi8-r,latin1
set inccommand=split
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead /tmp/psql.edit.* set syntax=sql

" NerdTree - Навигация по файлам
let g:NERDSpaceDelims = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeIgnore = ['\.pyc$', '\.retry$']
let g:NERDSpaceDelims = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowBookmarks = 1

" Jedi - автодополнение и навигация по коду
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" Ale - асинхронная проверка линтерами и коррекция
let g:ale_python_flake8_auto_pipenv = 1
let g:ale_python_flake8_change_directory = 1
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_options = ''
let g:ale_python_flake8_use_global = 1
let g:ale_linters = { 'python': ['flake8'] }
let b:ale_fixers = ['autopep8']
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:ale_lint_on_enter = 1
let g:ale_python_auto_pipenv = 1
let g:ale_sign_column_always = 1
let g:ale_completeon_enabled = 1
" let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"

" LazyGit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<A-n>'   " replace C-n
let g:VM_maps['Find Subword Under'] = '<A-n>'   " replace visual C-n
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_mouse_mappings = 1

" Прочее
let g:session_dir = '~/.vim/sessions'
let g:EasyMotion_smartcase = 1
let mapleader = ','
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Сохранение файла
nmap <C-s> :update<CR>

" Вставка тудушки в Python-файле
autocmd FileType python nmap <F8> A  # TODO:<space>

" Переход по идентичным отступам
" Смещение строк
noremap <C-S-k> :m .-2<CR>
noremap <C-S-j> :m .+1<CR>
" Навигация по замечаниям Ale
noremap <silent> <leader>k <Plug>(ale_previous_wrap)
noremap <silent> <leader>j <Plug>(ale_next_wrap)
" Выставление breakpoints python
noremap <leader><F7> <ESC>O__import__('pdb').set_trace()<ESC>
noremap <leader><F8> <ESC>:g/^\s*__import__('pdb').set_trace()/d<CR>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Space> <Plug>(easymotion-s2)
nmap <F1> :bp!<CR>
nmap <F2> :bn!<CR>

nnoremap <M-k> <C-u>
nnoremap <M-j> <C-d>
" Поиск текста
nnoremap <C-f> :Ag<CR>
" Поиск файлов
nnoremap <C-p> :Files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" Выделения
nnoremap <M-l> v$
nnoremap <M-h> v^
nnoremap <M-w> viw
" Перемещение в видимой области по первым двум буквам текста
" Переход на строку ниже, несмотря на wrap lines
nnoremap j gj
nnoremap о gj
nnoremap k gk
nnoremap л gk
nnoremap <C-l> $
nnoremap <C-h> ^
nnoremap gn :tabnew<CR>
" Завершение работы (закрытие всех откртых окон)
nnoremap <C-q><C-q> :qall!<CR>
nnoremap <C-q><C-w> :wqall!<CR>
" Закрыть текущий буфер
nnoremap <C-w><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>
" Удаление без записи в clipboard
nnoremap x "_x
" Сохранение/загрузка сессий (расположение вкладок/панелей
exec 'nnoremap ss :mks! ' . g:session_dir . '/<C-D>'
exec 'nnoremap sr :so ' . g:session_dir. '/<C-D>'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Выделения
vmap <M-h> v^
vmap <M-l> v$
vmap <M-w> BvvE
" Удаление без копирования в буффер
vnoremap x "_x
" Вставка без копирования удаленного в буффер
vnoremap p "_dP
vnoremap P "_dP
" Перемещение
vnoremap <C-l> $
vnoremap <C-h> ^
" Помещение выделенного текста в кавычки/скобки
" vnoremap ' o<ESC>i <ESC>r'gvol<ESC>i <ESC>r'gvl
" vnoremap " o<ESC>i <ESC>r"gvol<ESC>i <ESC>r"gvl
" vnoremap ( o<ESC>i <ESC>r(gvol<ESC>i <ESC>r)gvl
" vnoremap { o<ESC>i <ESC>r{gvol<ESC>i <ESC>r}gvl
" vnoremap [ o<ESC>i <ESC>r[gvol<ESC>i <ESC>r]gvl
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap <C-s> <ESC>:w<CR>
inoremap <C-DEL> <C-o>dw
inoremap <C-SPACE> <C-n>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Настройки статусной строки
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='dark'
" let hostname=system('hostname -s | tr -d "\n"')
" let g:airline_section_b = '   %{hostname} '
let g:airline#extensions#xkblayout#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bookmark#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline_extensions = ['branch', 'tabline', 'ale']
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:sql_type_default = 'pgsql'
" let g:pgsql_pl = ['python']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Удаление пробелов в конце строк
autocmd BufWritePre * :%s/\s\+$//e
" Сохранение и загрузка состояния складок (folds)
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Подсветка строки и столбца в соответствии с текущей раскладкой клавиатуры
let g:settedLocale = 0
function! ChangeHilights(timer)
  let currentLocale = system("xset -q | grep LED | awk '{ split($10, ch, \"\"); print ch[5]; }'")
  if (g:settedLocale != currentLocale)
    let g:settedLocale = currentLocale
    if (currentLocale == 1)
      hi ColorColumn ctermbg=17
      hi CursorLine ctermbg=17
    else
      hi ColorColumn ctermbg=235
      hi CursorLine ctermbg=235
    endif
  endif
endfunction

call timer_start(500, 'ChangeHilights', {'repeat':-1})
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" vim-dadbod
func! DBExe(...)
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    endif
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:1 == 'char'
        silent exe 'normal! gvy'
    elseif a:1 == 'line'
        silent exe "normal! '[V']y"
    else
        silent exe 'normal! `[v`]y'
    endif

    execute "DB " . @@

    let &selection = sel_save
    let @@ = reg_save
endfunc

xnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'

xmap <leader>db  <Plug>(DBExe)
nmap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nmap <leader>dbb <Plug>(DBExeLine)

"source ~/.config/backup/dadbods.vim
" let dadbods = [
    " \{
        " \"name": "PG: MDB (PROD), sender.cc-perm.bss.loc:5432/mdb (username)",
        " \"url": "postgresql://username:password@sender.cc-perm.bss.loc:5432/mdb"
    " \},
" \]

"function! My_callback_str(val) abort
"    for element in g:dadbods
"        if element.name == a:val
"            let g:db=element.url
"        endif
"    endfor
"endfunction
"
"let Callback_fn = {v -> My_callback_str(v)}
"nmap <F12> :call popup_menu#open(map(copy(g:dadbods), {k,v -> v.name}), Callback_fn)<CR>


let g:vimspector_enable_mappings = 'HUMAN'

let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
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

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
nmap <C-m> :Vista!!<CR>

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" if executable('pyls')
    " " pip install python-language-server
    " au User lsp_setup call lsp#register_server({
        " \ 'name': 'pyls',
        " \ 'cmd': {server_info->['pyls']},
        " \ 'allowlist': ['python'],
        " \ })
" endif

" augroup lsp_install
    " au!
    " " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    " autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END

