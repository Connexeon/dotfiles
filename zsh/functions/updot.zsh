# Update dotfiles & dependencies
function updot () {
  pushd ~/.dotfiles
  git remote set-url origin https://github.com/Connexeon/dotfiles.git
  git pull origin master
  chronic upgrade_oh_my_zsh
  chronic antigen selfupdate
  chronic update-submodules
  chronic ./install && echo "[ OK ] Relogin or run 'exec zsh' to apply changes"
  popd
}
