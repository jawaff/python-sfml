& choco install python

$PYTHON_HOME="C:\Pyton37"
$PYTHON_EXE="$PYTHON_HOME\python.exe"
$SCRIPTS_DIR=$PSScriptRoot

& $PYTHON_EXE --version
& $PYTHON_EXE "$SCRIPTS_DIR\get-pip.py"

# Refreshes environment variables updated by choco.
refreshenv

python --version
pip --version