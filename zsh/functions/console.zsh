# Tail messages log with (or without) search argument
function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/messages | grep -i --color=auto -E "$query"
  else
    tail -f /var/log/messages
  fi
}
