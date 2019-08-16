####################################################################
# Install ripgrep - A fast command-line search tool
####################################################################
if !(( $+commands[rg] )); then
  echo "Installing ripgrep - A fast command-line search tool"

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
    sudo apt -y install ripgrep >/dev/null 2>&1
    echo " OK"
    ;;
    *)
    echo "No install procedure for your OS available."
    ;;
  esac
fi
