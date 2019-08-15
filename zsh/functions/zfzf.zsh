#======================================================================================
# Z with fzf
#======================================================================================

# fzf for z
unalias z
function z {
    if [[ -z "$*" ]]; then
        cd "$(_z -l 2>&1 | sed -n 's/^[ 0-9.,]*//p' | fzf-tmux +s)"
    else
        _last_z_args="$@"
        cd "$(_z -l 2>&1 | sed -n 's/^[ 0-9.,]*//p' | fzf-tmux +s -q $_last_z_args)"
    fi
}

function zz {
    cd "$(_z -l 2>&1 | sed -n 's/^[ 0-9.,]*//p' | fzf-tmux -q $_last_z_args)"
}

alias j=z
alias jj=z
