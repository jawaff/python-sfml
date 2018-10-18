choco install python

echo "C:"
ls C:\
echo "C:\Users"
ls C:\Users

# TODO Where does Python get installed to? The PATH doesn't get updated.
# $ENV:PATH = $ENV:PATH + ";C:\Users\Jake\AppData\Local\Programs\Python\Python37"

# Refreshes environment variables updated by choco.
refreshenv

python --version
pip --version