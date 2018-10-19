# Variables describing expected environment
$PYTHON_HOME='C:\Python37'
$PYTHON_SCRIPTS="$PYTHON_HOME\Scripts"
$PYTHON_EXE="$PYTHON_HOME\python.exe"
$SCRIPTS_DIR=$PSScriptRoot

# Installs Python into $PYTHON_HOME
& choco install python

# Downloads pip into $PYTHON_SCRIPTS
& $PYTHON_EXE "$SCRIPTS_DIR\get-pip.py"

# Updates the PATH variable for the outer shell.
$ENV:PATH=$ENV:PATH + ";$PYTHON_HOME;$PYTHON_SCRIPTS"
