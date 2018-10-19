param(
  [string]$PYTHON_VERSION,
  [string]$PYTHON_HOME
)

echo "PythonHome=$PYTHON_HOME"

# Variables describing expected environment
$PYTHON_SCRIPTS="$PYTHON_HOME\Scripts"
$PYTHON_EXE="$PYTHON_HOME\python.exe"
$SCRIPTS_DIR=$PSScriptRoot

# Installs Python into $PYTHON_HOME
# We specifically need a version of Python that is built with VS14
& choco install python --version $PYTHON_VERSION --allow-downgrade
# Downloads pip into $PYTHON_SCRIPTS
& $PYTHON_EXE "$SCRIPTS_DIR\get-pip.py"

# Installs the Visual Studio 14 (2015) compiler
& choco install vcbuildtools

