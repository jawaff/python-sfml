#!/usr/bin/env bash
set -e -x

# Argumets
CUR_OS="$1"
SFML_VERSION="$2"

if [ $CUR_OS == "" ] || [ $SFML_VERSION == ""]
then
  echo Usage: ./scripts/sfml_install.sh CUR_OS SFML_VERSION
  exit 1
fi

# Retrieves the directory of this script.
SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Install Constants
CUR_DIR="$SCRIPTS_DIR/.."
EXT_LIBS_DIR="$CUR_DIR/extlibs"
SFML_DIR="$EXT_LIBS_DIR/SFML-$SFML_VERSION"
SFML_DOWNLOAD_PAGE="https://www.sfml-dev.org/files/"

# Only download SFML if it doesn't already exist.
if [ ! -d $SFML_DIR ]
then
  echo "Current OS: $CUR_OS"
  if [ "$CUR_OS" = "linux" ]
  then
    TAR_FILENAME=SFML-$SFML_VERSION-linux-gcc-64-bit.tar.gz
  elif [ "$CUR_OS" = "windows" ]
  then
    TAR_FILENAME=SFML-$SFML_VERSION-windows-vc14-64-bit.zip
  elif [ "$CUR_OS" = "osx" ]
  then
    TAR_FILENAME=SFML-$SFML_VERSION-osx-clang-universal.tar.gz
  else
    echo ERROR: Unsupported OS Detected: $CUR_OS
    exit 1
  fi

  echo "Downloading: $TAR_FILENAME"
  wget "$SFML_DOWNLOAD_PAGE$TAR_FILENAME"
  
  echo "Extracting SFML-$SFML_VERSION into $EXT_LIBS_DIR:"
  if [ "$CUR_OS" = "windows" ]
  then
    unzip $TAR_FILENAME -d $EXT_LIBS_DIR
  else
    tar -xvzf $TAR_FILENAME -C $EXT_LIBS_DIR
  fi
else
  echo "Already Installed: $SFML_DIR"
fi
  