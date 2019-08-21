# Helper function (https://unix.stackexchange.com/questions/317687/command-not-found-when-sudoing-function-from-zshrc)
zsudo() sudo zsh -c "$@"

# accept user passwords and pass them to another command that requires superuser privilege
function superuser_do() {
  # echo_message header "Starting 'superuser_do' function"
  # check if current user is root
  if [[ $EUID = 0 ]]; then
    echo_message warning "You are logged in as the root user. Again, this is not recommended. :/"
    # Running command without sudo
    $@
  else
    # Passing to sudo helper function zsudo()
    zsudo "$@"
  fi
}
