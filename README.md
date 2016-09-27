# dotfiles
dotfiles zsh + antigen for (CentOS) sysadmins

# Installation
```
cd ~
git clone https://github.com/hannesbe/dotfiles.git .dotfiles
cd .dotfiles
./install
```
Or even better, run this oneliner, it checks & installs requirements first.
```
curl -sSL https://raw.githubusercontent.com/hannesbe/dotfiles/master/bootstrap | bash -s
```

# Requirements
git python python-yaml python-argparse
Run the oneline installer to have them installed if needed. Supports yum & apt-get.

# Update
```
cd ~/.dotfiles && git pull origin master && git submodule update --remote  --recursive
```
or just use the alias `updot`.
