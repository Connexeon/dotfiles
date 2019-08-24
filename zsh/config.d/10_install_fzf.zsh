####################################################################
# Install fzf - a general-purpose command-line fuzzy finder
####################################################################
CMD="fzf"
CMDTITLE="A general-purpose command-line fuzzy finder"

_install_fzf () {

  $HOME/.fzf/install --no-key-bindings --no-completion --no-update-rc >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )

}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  [[ $DOTFILES_FZF_DISABLED == 0 ]] && unset DOTFILES_FZF_DISABLED
  if (( ! ${+DOTFILES_FZF_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_fzf $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist
else
    export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
fi
