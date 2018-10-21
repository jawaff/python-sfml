param(
  [string]$PYTHON_VERSION,
  [string]$PYTHON_HOME
)

echo "PythonHome=$PYTHON_HOME"

# Variables describing expected environment
$PYTHON_SCRIPTS="$PYTHON_HOME\Scripts"
$PYTHON_EXE="$PYTHON_HOME\python.exe"
$SCRIPTS_DIR=$PSScriptRoot

# Expects Python is installed into $PYTHON_HOME -- not forced.
# We specifically need a version of Python that is built with VS14
& choco install python --version $PYTHON_VERSION --allow-downgrade
# Downloads pip into $PYTHON_SCRIPTS
& $PYTHON_EXE "$SCRIPTS_DIR\get-pip.py"

# Installs the Visual Studio 14 (2015) compiler if it doesn't already exist.
$VS_DIR="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin"
If(!(test-path $VS_DIR))
{
  & choco install vcbuildtools
}
Else
{
  echo "Already Installed: $VS_DIR"
}

# The default VS2017 direrctory needs to be deleted so that it doesn't interfere with the VS2015 build.
Remove-Item "C:\Program Files (x86)\Microsoft Visual Studio\2017" -Force -Recurse
