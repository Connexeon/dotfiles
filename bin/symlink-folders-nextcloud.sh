#!/bin/bash

TARGET="$HOME/Nextcloud"
DIRS=("Pictures" "Documents" "Videos" "Music" "Desktop" "Downloads" "Templates")

add_dir_link() {
  DIR=$1
  cd $HOME
  if [ -L $DIR ]; then
    echo "Link exists: $DIR"
  elif [ -d $DIR ]; then
    echo "Dir exists: $DIR"
  else
    ln -s $TARGET/$DIR
    echo "Added symlink: $DIR"
  fi
}

add_file_link() {
  FILE=$1
  cd $HOME
  if [ -L $FILE ]; then
    echo "Link exists: $FILE"
  elif [ -f $FILE ]; then
    echo "File exists: $FILE"
  else
    ln -s $TARGET/$FILE
    echo "Added symlink: $FILE"
  fi
}

add_dir() {
  DIR=$1
  cd $HOME
  if [ -d $DIR ]; then
    echo "Dir exists: $DIR"
  else
    mkdir $DIR
    echo "Added dir: $DIR"
  fi
}

add_deep_link() {
  DIR=$1
  FILENAME=$2
  FILE=$DIR/$FILENAME
  cd $HOME
  if [ -L $FILE ]; then
    echo "Link exists: $FILE"
  elif [ -f $FILE ]; then
    echo "File exists: $FILE"
  elif [ -d $DIR ]; then
    ln -s $TARGET/$FILE $FILE
    echo "Added symlink: $FILE"
  else
    mkdir $DIR
    ln -s $TARGET/$FILE $FILE
    echo "Added symlink: $FILE"
  fi
}

for LNDIR in "${DIRS[@]}"
do
  # Move all files from source to target directory, then
  mv $HOME/$LNDIR/*(DN) $TARGET/$LNDIR/ && rmdir $HOME$LNDIR && add_dir_link $LNDIR

done
