#!/usr/bin/env bash
set -e -x

# Argumets
CUR_OS="$1"
SFML_VERSION="$2"

# Retrieves the directory of this script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Install Constants
CUR_DIR="$SCRIPT_DIR/.."
EXT_LIBS_DIR="$CUR_DIR/extlibs"
SFML_DIR="$EXT_LIBS_DIR/SFML-$SFML_VERSION"

echo "Setting up environment variables for SFML:"
if [ "$CUR_OS" = "linux" ]
then
  # Compile time environment variables for gcc.
  export CPPFLAGS="-I$SFML_DIR/include"
  export LIBRARY_PATH="$SFML_DIR/lib"
  echo "CPPFLAGS=$CPPFLAGS"
  echo "LIBRARY_PATH=$LIBRARY_PATH"
elif [ "$CUR_OS" = "osx" ]
then
  echo "TODO"
fi

# No environment variables exist for linking the SFML dependency as far as I know.
# The setup.py's SFML linking is sufficient for the Windows case.
