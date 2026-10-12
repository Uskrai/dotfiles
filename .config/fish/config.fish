if status is-interactive
    # set -gx MCFLY_LIGHT TRUE

    zoxide init fish | source
    if test -z $fish_private_mode
        mcfly init fish | source
    end
    direnv hook fish | source
    function __onpwd --on-variable PWD
        set --universal LAST_WORKING_DIR $PWD
    end

    fish_vi_key_bindings
end

fenv source ~/.profile
set -gx GPG_TTY (tty)

function cdl --wraps='cd' --description 'go to last working directory'
    cd "$LAST_WORKING_DIR"
end

function rmdirr --wraps='find' --description 'remove directory recursively'
    find -D all $argv -type d -empty -delete
end

function dlv --wraps='yt-dlp'
    yt-dlp -S "res:480" $argv
end

function zc --wraps="zellij" --description 'Zellij: attach or create session named after cwd'
    zellij attach -c "$(basename $(pwd))" $argv
end

function tc --wraps="tmux" --description 'tmux: attach or create session named after cwd'
    tmux new -A -s "$(basename $(pwd))" $argv
end

# function sway
#   /bin/sway $argv >> ~/.local/state/sway.log 2>&1
# end
# pnpm end
