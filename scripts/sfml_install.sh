#!/usr/bin/env bash

# Retrieves the directory of this script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
CUR_DIR="$SCRIPT_DIR/.."
SFML_VERSION="2.3.2"
EXT_LIBS_DIR="$CUR_DIR/extlibs"
SFML_DIR="$EXT_LIBS_DIR/SFML-$SFML_VERSION"

echo "Downloading SFML-$SFML_VERSION:"

wget https://www.sfml-dev.org/files/SFML-$SFML_VERSION-linux-gcc-64-bit.tar.gz

echo "Extracting SFML-$SFML_VERSION into $EXT_LIBS_DIR:"

# "SFML-$SFML_VERSION" is the directory that is placed into extLibs/.
# The SFML dir contains an include/, lib/ and share/ directory.
tar -xvzf SFML-$SFML_VERSION-linux-gcc-64-bit.tar.gz -C $EXT_LIBS_DIR

ls $EXT_LIBS_DIR
ls $SFML_DIR

echo "Setting up environment variables for SFML:"

# Compile time environment variables for gcc.
export CPPFLAGS="-I$SFML_DIR/include"
export LIBRARY_PATH="$SFML_DIR/lib"

echo "CPPFLAGS=$CPPFLAGS"
echo "LIBRARY_PATH=$LIBRARY_PATH"