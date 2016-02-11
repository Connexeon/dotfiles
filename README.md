# dotfiles
dotfiles zsh + antigen for sysadmins

# Installation
```
cd ~
git clone https://github.com/hannesbe/dotfiles.git .dotfiles
cd .dotfiles
./install
```
Or even better, run this oneliner, it checks & installs requirements first.
```
curl -sSL https://gist.github.com/hannesbe/9bc71c527b5cd20a45bf/raw/install-dotfiles.sh | bash -s
```

# Requirements
git python python-yaml python-argparse
Run the oneline installer to have them installed if needed. Supports yum & apt-get.

# Update
```
cd ~/.dotfiles                                                                                                       [0:13:18]
git pull
```
