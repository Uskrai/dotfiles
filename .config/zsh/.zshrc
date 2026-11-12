# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source ${ZINIT_HOME}/zinit.zsh
export HISTFILE=${ZDOTDIR}/zsh_history

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit ice as"program" from"gh-r" pick"zsh-patina-*/zsh-patina" atload'eval "$(zsh-patina activate)"'
zinit light michel-kraemer/zsh-patina

eval "$(direnv hook zsh)"

. "${ZDOTDIR}/cdl.zsh"
. "${ZDOTDIR}/functions.zsh"

fpath+=${ZDOTDIR}/zfunc

alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls="exa --icons --group-directories-first"

# remove empty directory recursively
function rmdirr {
    find "${@:-.}" -type d -empty -delete
}

# History Configuration
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

# vi mode (replaces hand-rolled keymap hooks)
function zvm_config() {
    # cursor shapes already default to block (normal) / beam (insert)
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# zsh-vi-mode rebinds keys on init; re-apply the plugin bindings it overrides
zvm_after_init_commands+=('bindkey "^I" fzf-tab-complete')
zvm_after_init_commands+=('bindkey -M viins "^R" atuin-search-viins')

KEYTIMEOUT=1
