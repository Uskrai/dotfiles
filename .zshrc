# zmodload zsh/zprof

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

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source ${ZINIT_HOME}/zinit.zsh

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light clarketm/zsh-completions
zinit light Aloxaf/fzf-tab

zinit ice svn
zinit snippet OMZP::extract
zinit snippet OMZP::last-working-dir
zinit snippet OMZP::colored-man-pages

# typeset -gA FAST_BLIST_PATTERNS 
# FAST_BLIST_PATTERNS[$HOME/dling]=1
# zinit light zdharma-continuum/fast-syntax-highlighting

ZSH_HIGHLIGHT_DIRS_BLACKLIST=($HOME/dling)
zinit ice wait"1" silent
zinit light "zsh-users/zsh-syntax-highlighting"

# Load theme file
# zplug 'dracula/zsh', as:theme
zinit ice depth"1" as"theme"
zinit light romkatv/powerlevel10k

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  last-working-dir
  fzf
  fzf-tab
  extract
  cp
  colored-man-pages
  rsync
)

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

autoload -U select-word-style
select-word-style bash

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ~/.p10k.zsh

fpath+=~/.zfunc

alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls="exa --icons --group-directories-first"
alias enable-mic="~/script/mic_over_mumble.sh"
alias toggle-touchpad="~/script/toggle-touchpad.sh"
alias zip-folder="~/script/zip.sh"
alias locate-dling="slocate -d ~/.mlocate-dling"
alias idea="_JAVA_AWT_WM_NONREPARENTING=1 intellij-idea-ultimate-edition"

alias joinpdf="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite"

alias foldervimtotml="~/script/folder_vim_to_html.sh"
alias qemu=qemu-system-x86_64

function cdzsh {
  add-zsh-hook -D chpwd chpwd_last_working_dir
  cd $1
  add-zsh-hook chpwd chpwd_last_working_dir
}

alias mado="cdzsh ~/manga/relm/bin/; RUST_LOG=mado_engine=trace ./mado-relm; cdzsh -"

# remove empty directory recursively
function rmdirr {
  find -D all $@ -type d -empty -delete
}

# History Configuration
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

source ~/.profile

# eval "$(diesel completions zsh)"
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"

bindkey -r '^[c'
# bindkey -r <M-c>
#
unsetopt caseglob

# zprof | less
