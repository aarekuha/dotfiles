call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " Навигация по файлам
  Plug 'preservim/nerdcommenter'  " Быстрые комментарии
  Plug 'morhetz/gruvbox'  " Визуальная тема
  Plug 'tpope/vim-fugitive'  " Git комманды
  Plug 'easymotion/vim-easymotion'  " Быстрое перемещение по видимой области
  Plug 'junegunn/fzf.vim'  " Поиск файлов и их содержимого
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'vim-airline/vim-airline'  " Статусная строка
  Plug 'vim-airline/vim-airline-themes'  " Оформлнение статусной строки
  Plug 'kshenoy/vim-signature'  " Метки на полях
  Plug 'ryanoasis/vim-devicons'  " Иконки (nerd-tree, status-bar)
  Plug 'mg979/vim-visual-multi'  " Мультикурсоры
  Plug 'iamcco/markdown-preview.vim'  " Live-preview MD markdown
  Plug 'kdheepak/lazygit.nvim'
  Plug 'lifepillar/pgsql.vim'  " Подсветка postgres-синтаксиса
  Plug 'SirVer/ultisnips'  " Сниппеты
  Plug 'dense-analysis/ale'  " Асинхронные линтеры
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'davidhalter/jedi-vim'  " Python автодополнение, навигация и т.п.
  Plug 'puremourning/vimspector'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set fileencodings=utf-8,cp1251,koi8-r,latin1
set inccommand=split
set omnifunc=ale#completion#OmniFunc
set autochdir  " Смена текущей директории на открытый файл
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead /tmp/psql.edit.* set syntax=sql
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Навигация по замечаниям Ale
noremap <silent> <leader>k <Plug>(ale_previous_wrap)
noremap <silent> <leader>j <Plug>(ale_next_wrap)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree - Навигация по файлам
let g:NERDSpaceDelims = 1
let g:NERDTreeIgnore = ['\.pyc$', '\.retry$']
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
" Easymotion
let g:EasyMotion_smartcase = 1
let mapleader = ','
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Сохранение файла
nmap <C-s> :update<CR>
" Навигация по первым двум буквам
nmap <Space> <Plug>(easymotion-s2)
" Навигация по буферам (влево/вправо)
nmap <F1> :bp!<CR>
nmap <F2> :bn!<CR>
" Сокращения для листания вверх/вниз
nnoremap <M-k> <C-u>
nnoremap <M-j> <C-d>
" Поиск текста
nnoremap <C-f> :Ag<CR>
" Поиск файлов
nnoremap <C-p> :Files<CR>
" Переход на строку ниже, несмотря на wrap lines
nnoremap j gj
nnoremap о gj
nnoremap k gk
nnoremap л gk
" Закрытие всех откртых окон без сохранения
nnoremap <C-q><C-q> :qall!<CR>
" Закрытие всех откртых окон с сохранением
nnoremap <C-q><C-w> :wqall!<CR>
" Закрыть текущий буфер
nnoremap <C-w><C-w> :bp<bar>sp<bar>bn<bar>bd<CR>
" Удаление без копирования в буффер
vnoremap x "_x
" Вставка без копирования удаленного в буффер
vnoremap p "_xP
vnoremap P "_xp
" Удаление до конца строки без сохранения
nnoremap <S-x> "_d$
" Сохранить и выйти из режима редактирования
imap <C-s> <ESC>:w<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки статусной строки
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='dark'
let hostname=system('hostname -s | tr -d "\n"')
let g:airline_section_b = '   %{hostname} '
let g:airline#extensions#xkblayout#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bookmark#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled = 1
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sql_type_default = 'pgsql'
" let g:pgsql_pl = ['python']

" Удаление пробелов в конце строк при сохранении
autocmd BufWritePre * :%s/\s\+$//e

" Показать/скрыть папки и файлы
map <C-n> :NERDTreeToggle<CR>
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

" Настройки Vim Visual Multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<A-n>'   " replace C-n
let g:VM_maps['Find Subword Under'] = '<A-n>'   " replace visual C-n
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_mouse_mappings = 1

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

let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>di <Plug>VimspectorBalloonEval
nmap <F3> :VimspectorReset<CR>
