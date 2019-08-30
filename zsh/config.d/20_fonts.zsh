####################################################################
## Font Related Stuff
####################################################################

funtion _install_nerd_fonts () {
#   revolver start --hide-cursor "Installing Nerd Fonts"
#
#   mkdir -p $1 ; pushd $1 >/dev/null 2>&1
#
#   ## Include these dirs in $PATH if they exist
#   FONTS=(hack firacode)
#   declare -a FILES_TO_SOURCE
# FILES_TO_SOURCE=(
#     "bash_aliases"
#     "bash_exports"
#     "bash_functions"
#     "bash_options"
#     "bash_prompt"
#     "bash.local"
# )
# declare -r FILES_TO_SOURCE
#
#   hack[name]="Hack Nerd Font Mono Regular 12"
#   hack[filename]="Hack Regular Mono Nerd Font Complete.ttf"
#   hack[url]="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
#   firacode[name]="FiraCode Nerd Font Medium 12"
#   firacode[filename]="FiraCode Medium Nerd Font Complete.otf"
#   firacode[url]="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.otf"
#
#   for font in $FONTS ; do
#     curl -fLo "eval$("$font"[url])" \
#       >/dev/null 2>&1
#     echo eval$("$font"[url])
#   done
#
#   fc-cache -f -v >/dev/null 2>&1
#   revolver update "OK Nerd Fonts installed"
#
#   revolver update "Setting Monospace Font"
#
#   FONT_MONOSPACE=""
#   # gsettings set org.gnome.desktop.interface monospace-font-name "Hack Nerd Font Mono Regular 13"
#   gsettings set org.gnome.desktop.interface monospace-font-name $FONT_MONOSPACE
#
#   revolver update "OK Monospace Font set to $FONT_MONOSPACE"
#
#   revolver stop
#   popd
}

FONT_USER_DIR=$HOME/.fonts
if [ -d $FONT_USER_DIR ]; then
  # Load all .sh files in $HOME/.fonts
  # for FONT_SH in $FONT_USER_DIR/*.sh; do
  #   . $FONT_SH
  # done
  # Reload font cache
  fc-cache -f >/dev/null 2>&1
else
  _install_nerd_fonts $FONT_USER_DIR
fi
