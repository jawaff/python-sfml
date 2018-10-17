#!/usr/bin/env bash

# Retrieves the directory of this script.
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

wget https://www.sfml-dev.org/files/SFML-2.3.2-linux-gcc-64-bit.tar.gz

# SFML-2.3.2 is the directory that is placed into extLibs/.
# The SFML dir contains an include/, lib/ and share/ directory.
tar -xvzf SFML-2.3.2-linux-gcc-64-bit.tar.gz -C extlibs/

# Compile time environment variables for gcc.
export CPPFLAGS="-I$CUR_DIR/extlibs/SFML-2.3.2/lib"
export LIBRARY_PATH="$CUR_DIR/extlibs/SFML-2.3.2/lib"