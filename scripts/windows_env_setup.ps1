& choco install python

$PYTHON_HOME="C:\\Pyton37"
$ENV:PATH=$ENV:PATH + ";$PYTHON_HOME"

echo $ENV:PATH

# Refreshes environment variables updated by choco.
refreshenv

python --version
pip --version