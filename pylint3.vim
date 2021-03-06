" Author: keith <k@keith.so>
" Description: pylint3 for python files

call ale#Set('python_pylint3_executable', 'pylint3')
call ale#Set('python_pylint3_options', '')
call ale#Set('python_pylint3_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('python_pylint3_change_directory', 1)
call ale#Set('python_pylint3_auto_pipenv', 0)
call ale#Set('python_pylint3_use_msg_id', 0)

function! ale_linters#python#pylint3#GetExecutable(buffer) abort
    if (ale#Var(a:buffer, 'python_auto_pipenv') || ale#Var(a:buffer, 'python_pylint3_auto_pipenv'))
    \ && ale#python#PipenvPresent(a:buffer)
        return 'pipenv'
    endif

    return ale#python#FindExecutable(a:buffer, 'python_pylint3', ['pylint3'])
endfunction

function! ale_linters#python#pylint3#GetCommand(buffer) abort
    let l:cd_string = ''

    if ale#Var(a:buffer, 'python_pylint3_change_directory')
        " pylint3 only checks for pylint3rc in the packages above its current
        " directory before falling back to user and global pylint3rc.
        " Run from project root, if found, otherwise buffer dir.
        let l:project_root = ale#python#FindProjectRoot(a:buffer)
        let l:cd_string = l:project_root isnot# ''
        \   ? ale#path#CdString(l:project_root)
        \   : ale#path#BufferCdString(a:buffer)
    endif

    let l:executable = ale_linters#python#pylint3#GetExecutable(a:buffer)

    let l:exec_args = l:executable =~? 'pipenv$'
    \   ? ' run pylint3'
    \   : ''

    return l:cd_string
    \   . ale#Escape(l:executable) . l:exec_args
    \   . ' ' . ale#Var(a:buffer, 'python_pylint3_options')
    \   . ' --output-format text --msg-template="{path}:{line}:{column}: {msg_id} ({symbol}) {msg}" --reports n'
    \   . ' %s'
endfunction

function! ale_linters#python#pylint3#Handle(buffer, lines) abort
    " Matches patterns like the following:
    "
    " test.py:4:4: W0101 (unreachable) Unreachable code
    let l:pattern = '\v^[a-zA-Z]?:?[^:]+:(\d+):(\d+): ([[:alnum:]]+) \(([^(]*)\) (.*)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        "let l:failed = append(0, l:match)
        let l:code = l:match[3]

        if (l:code is# 'C0303')
        \ && !ale#Var(a:buffer, 'warn_about_trailing_whitespace')
            " Skip warnings for trailing whitespace if the option is off.
            continue
        endif

        if l:code is# 'I0011'
            " Skip 'Locally disabling' message
            continue
        endif

        " if l:code is# 'C0111'
            " " Skip 'Locally disabling' message
            " continue
        " endif

        if ale#Var(a:buffer, 'python_pylint3_use_msg_id') is# 1
            let l:code_out = l:code
        else
            let l:code_out = l:match[4]
        endif

        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'col': l:match[2] + 1,
        \   'text': l:match[5],
        \   'code': l:code_out,
        \   'type': l:code[:0] is# 'E' ? 'E' : 'W',
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('python', {
\   'name': 'pylint3',
\   'executable': function('ale_linters#python#pylint3#GetExecutable'),
\   'command': function('ale_linters#python#pylint3#GetCommand'),
\   'callback': 'ale_linters#python#pylint3#Handle',
\   'lint_file': 1,
\})
