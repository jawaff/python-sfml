#!/usr/bin/env bash

# Retrieves the directory of this script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Install Constants
CUR_DIR="$SCRIPT_DIR/.."
SFML_VERSION="2.3.2"
EXT_LIBS_DIR="$CUR_DIR/extlibs"
SFML_DIR="$EXT_LIBS_DIR/SFML-$SFML_VERSION"
SFML_DOWNLOAD_PAGE="https://www.sfml-dev.org/files/4"

# Argumets
CUR_OS="$1"

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

ls $EXT_LIBS_DIR
ls $SFML_DIR

echo "Setting up environment variables for SFML:"
if [ "$CUR_OS" = "linux" ]
then
  # Compile time environment variables for gcc.
  #set CPPFLAGS="-I$SFML_DIR/include"
  #set LIBRARY_PATH="$SFML_DIR/lib"
  echo "CPPFLAGS=$CPPFLAGS"
  echo "LIBRARY_PATH=$LIBRARY_PATH"
elif [ "$CUR_OS" = "windows" ]
then
  echo "No variables needed in the Bash environment"
elif [ "$CUR_OS" = "osx" ]
then
  echo "TODO"
else
  echo ERROR: Unsupported OS Detected: $CUR_OS
  exit 1
fi
