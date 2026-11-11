# cdl -- go to the directory another shell last cd'd into
typeset -g CDL_FILE=${XDG_STATE_HOME:-$HOME/.local/state}/zsh/last-working-dir
command mkdir -p -- "${CDL_FILE:h}"

autoload -Uz add-zsh-hook
function _cdl_record { print -r -- "$PWD" >| "$CDL_FILE" }
add-zsh-hook chpwd _cdl_record

function cdl {
    local d; d=$(<$CDL_FILE) 2>/dev/null
    [[ -d $d ]] && builtin cd -- "$d"
}
