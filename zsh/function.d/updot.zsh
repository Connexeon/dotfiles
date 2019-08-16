# Update dotfiles & dependencies
function updot () {
  pushd ~/.dotfiles
  git remote set-url origin https://github.com/Connexeon/dotfiles.git >/dev/null 2>&1
  git pull origin master >/dev/null 2>&1
  upgrade_oh_my_zsh >/dev/null 2>&1
  antigen selfupdate >/dev/null 2>&1
  update-submodules >/dev/null 2>&1
  ./install && echo "[ OK ] Relogin or run 'exec zsh' to apply changes"
  popd
}
