# Color Scheme for Gnome Terminal and Pantheon Terminal
# > Color Schemes For Ubuntu, Linux Mint, Elementary OS and all distributions that use gnome terminal or Pantheon Terminal, initially inspired by Elementary OS Luna.
# http://mayccoll.github.io/Gogh/
function gogh () {
  echo "Color Schemes For Ubuntu, Linux Mint, Elementary OS and all distributions that use gnome terminal or Pantheon Terminal, initially inspired by Elementary OS Luna."
  echo "Find scheme gallery here: http://mayccoll.github.io/Gogh/"
  read KEY\?"Hit any key list available schemes to install."
  case "$OS" in
    Linux|BSD)
    bash -c  "$(wget -qO- https://git.io/vQgMr)"
    ;;
    OSX)
    bash -c  "$(curl -sLo- https://git.io/vQgMr)"
    ;;
    *)
    bash -c  "$(wget -qO- https://git.io/vQgMr)"
    ;;
  esac
}
