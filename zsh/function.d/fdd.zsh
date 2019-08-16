# fd - Find any directory and cd to selected directory
function fdd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
  -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
