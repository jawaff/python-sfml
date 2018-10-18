#!/usr/bin/env bash

wget https://www.sfml-dev.org/files/SFML-2.3.2-linux-gcc-64-bit.tar.gz

# SFML-2.3.2 is the directory that is placed into extLibs/.
# The SFML dir contains an include/, lib/ and share/ directory.
tar -xvzf SFML-2.3.2-linux-gcc-64-bit.tar.gz -C extlibs/

# Retrieves the directory of this script.
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Compile time environment variables for gcc.
export CPPFLAGS="-I$CUR_DIR/extlibs/SFML-2.3.2/include"
export LIBRARY_PATH="$CUR_DIR/extlibs/SFML-2.3.2/lib"

echo "CPPFLAGS=$CPPFLAGS"
echo "LIBRARY_PATH=$LIBRARY_PATH"