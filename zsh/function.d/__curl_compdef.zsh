# Download/Install shell completion definition
function __curl_compdef() {
  COMPDEF="/usr/local/share/zsh/site-functions/_$1"
  COMPDEF_URL="$2"
  if [[ -e "$COMPDEF" ]]; then
    sudo rm -f $COMPDEF
  fi
  printf "$NX $BD$YE$1$N - Shell Completion Definitions"
  sudo curl -o $COMPDEF $COMPDEF_URL >/dev/null 2>&1 && ( printf "$OK" ) || ( printf "$FL" ; exit 1 )
}
