####################################################################
# Install exa - A modern version of ‘ls’
####################################################################
if !(( $+commands[exa] )); then
  echo "Installing exa - a modern version of 'ls'"

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
    sudo apt-get -y install exa librust-exa+git\*-dev >/dev/null 2>&1
    echo " OK"
    ;;
    *)
    echo "No install procedure for your OS available."
    ;;
  esac
fi
