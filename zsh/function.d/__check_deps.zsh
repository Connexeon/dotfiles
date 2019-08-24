# Check for and install if missing the required packages
function __check_deps {
  # echo_message header "Starting 'check_dependencies' function"
  # echo_message title "Checking if necessary dependencies are installed..."
  # Variables

  # Currently only for distros with DEB package manager
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      LIST=$HOME/.dotfiles/dependencies.list

      # Check dependencies
    	for PACKAGE in $(cat $LIST); do
        # If package is not installed
        if [ $(check_package_installed $PACKAGE) != 0 ]; then
          echo_message info "This script requires '$PACKAGE' and it is not present on your system."
          echo_message question 'Would you like to install it to continue? (Y)es, (N)o : ' && read REPLY
          case $REPLY in
            # Positive action
            [Yy]* )
            echo_message warning "Requires root privileges"
            superuser_do "apt install -y -qq $PACKAGE" && echo_message success "Package '$PACKAGE' installed." || echo_message error "Package '$PACKAGE' installation failed."
            ;;
            # Negative action
            [Nn]* )
            echo_message info "Exiting..."
            exit 99
            ;;
            # Error
            * )
            echo_message error 'Sorry, try again.' && check_dependencies
            ;;
          esac
        else
          # echo_message info "Dependency '$PACKAGE' is installed."
        fi
      done
      # echo_message success "All dependencies are installed. :)"
      ;;
  esac
}
