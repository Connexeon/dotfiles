####################################################################
# Install fzf - a general-purpose command-line fuzzy finder
####################################################################
CMD=fzf
CMDTITLE="Installing fzf - a general-purpose command-line fuzzy finder"

if !(( $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"
  $HOME/.fzf/install --no-key-bindings --no-completion --no-update-rc && echo " OK"
  # >/dev/null 2>&1

fi

# Load if command exists
if (( $+commands[$CMD] )); then

  export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

else

fi
