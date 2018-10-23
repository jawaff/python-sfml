#!/usr/bin/env bash

# Argumets
PYTHON_VERSION="$1"
PYTHON_HOME="$2"

if [ $PYTHON_VERSION == "" ] || [ $PYTHON_HOME == ""]
then
  echo Usage: ./scripts/windows_base_install.sh PYTHON_VERSION PYTHON_HOME
  exit 1
fi

PYTHON_SCRIPTS="$PYTHON_HOME/Scripts"
PYTHON_EXE="$PYTHON_HOME/python.exe"
# Retrieves the directory of this script.
SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo "PYTHON_VERSION=$PYTHON_VERSION"
echo "PYTHON_HOME=$PYTHON_HOME"

# Expects Python is installed into $PYTHON_HOME -- not forced.
# We specifically need a version of Python that is built with VS14
choco install python --version $PYTHON_VERSION --allow-downgrade
# Downloads pip into $PYTHON_SCRIPTS
$PYTHON_EXE "$SCRIPTS_DIR\get-pip.py"

# Installs the Visual Studio 14 (2015) compiler if it doesn't already exist.
choco install vcbuildtools

rm -r 'C:\Program Files (x86)\Microsoft Visual Studio\2017'
