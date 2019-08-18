####################################################################
# PATH stuff
####################################################################

## Include these dirs in $PATH if they exist
_path_include=($HOME/bin $HOME/.local/bin $HOME/.dotfiles/bin $HOME/.zsh/submodules/revolver)

for _path in $_path_include ; do

  if [ -e $_path ]; then
    path+=$_path
  fi
done
