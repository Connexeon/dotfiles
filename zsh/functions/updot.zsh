# Update dotfiles & dependencies
function updot () {
  pushd ~/.dotfiles
  git remote set-url origin https://github.com/Connexeon/dotfiles.git
  git pull origin master
  ./install
  upgrade_oh_my_zsh
  antigen-selfupdate
  update-submodules
  echo "Relogin or run 'exec zsh' to apply changes"
  popd
}
