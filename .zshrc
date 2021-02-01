export PATH=$PATH:/snap/bin:/home/rekuha/programs/dotnet:$HOME/.local/bin
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

export NNN_BMS='d:~/Downloads;p:~/projects'
export NNN_OPENER=xdg-open
export NNN_PLUG='d:diffs;f:fzcd;z:fzz;]:dragdrop'

export SQLPATH=$ORACLE_HOME/sqlplus/admin
# export NLS_LANG=RUSSIAN_RUSSIA.CL8MSWIN1251
export NLS_LANG=RUSSIAN_CIS.AL32UTF8

ZSH_THEME="amuse"
plugins=(colored-man-pages git docker composer npm timer zsh_reload wd colorize fzf)

source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect "o" accept-and-infer-next-history

setxkbmap -layout us,ru
setxkbmap -option 'grp:alt_shift_toggle'
#
# ###### #### ### grep'##
# export GREP_COLORS="mt=33"
# export GREP_OPTIONS='--color=auto'
PROMPT='%{$fg_bold[green]%} %~ %{$fg_bold[blue]%} > $HOST%{$reset_color%} $(git_prompt_info)   %{$fg_bold[red]%}%*%{$reset_color%}
%{$fg_bold[yellow]%} %{$reset_color%} '

LC_ALL="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_GB.UTF-8"
LC_TIME="en_GB.UTF-8"
LC_COLLATE="en_GB.UTF-8"
LC_MONETARY="en_GB.UTF-8"
LC_MESSAGES="en_GB.UTF-8"

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history

alias d1='cd -'
alias d2='cd -2'
alias d3='cd -3'
alias d4='cd -4'
alias d5='cd -5'
alias d6='cd -6'
alias d7='cd -7'
alias d8='cd -8'
alias d9='cd -9'

alias la='ls -A --group-directories-first'
alias l='ls -CF --group-directories-first'
alias ll='ls -alFh --group-directories-first'
alias mc='mc -S dark'
alias v='nvim'
alias vim='nvim'
alias sql='cd ~/.sqlplus && rlwrap sqlplus'
alias sqlplus='rlwrap sqlplus /usr/sqlplus/admin/glogin.sql'
alias sqlcl='/opt/sqlcl/bin/sql'
alias act='source ./venv/bin/activate && PYTHONPATH=$PWD/venv/lib/python3.5/site-packages:$PWD'
alias nvimdiff='nvim -d'
alias vimdiff='nvim -d'
alias writer='/usr/bin/libreoffice -writer'
alias calc='/usr/bin/libreoffice -calc'
alias draw='/usr/bin/libreoffice -draw'
alias vpn="~/vpn.sh"
alias sqldeveloper='/home/alex/oracle/product/sqldeveloper/sqldeveloper/sqldeveloper.sh'
alias sdev='/home/alex/oracle/product/sqldeveloper/sqldeveloper/sqldeveloper.sh'
alias odi='cd /home/alex/oracle/product/11.1.1/Oracle_ODI_1/oracledi/client && ./odi.sh'
alias wping='~/wping.sh'
alias nnn='nnn -deH'
alias psql="PAGER='nvim -u ~/.config/backup/dbout.vim' psql"
# alias nnn='nnn -deHx'
# alias history='fc -li | grep $(date -I)'

# ########### ####### ###### ### #########
compinit
_comp_options+=(globdots)

# PROMPT='asdas'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/alex/.sdkman"
[[ -s "/home/alex/.sdkman/bin/sdkman-init.sh" ]] && source "/home/alex/.sdkman/bin/sdkman-init.sh"

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

