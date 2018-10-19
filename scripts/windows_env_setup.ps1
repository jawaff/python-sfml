choco install python

$PYTHON_HOME="C:\Pyton37"
ls "$PYTHON_HOME"
$ENV:PATH = $ENV:PATH + ";$PYTHON_HOME"

# Refreshes environment variables updated by choco.
refreshenv

python --version
pip --version