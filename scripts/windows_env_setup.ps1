& choco install python

$PYTHON_HOME="C:\Pyton37"
$ENV:PATH=$ENV:PATH + ";$PYTHON_HOME;$PYTHON_HOME\Scripts"

echo $ENV:PATH

python --version
pip --version

# Refreshes environment variables updated by choco.
refreshenv

python --version
pip --version