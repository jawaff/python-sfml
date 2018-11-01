#!/bin/bash
set -e -x

# Argumets
CUR_OS="$1"
SFML_VERSION="$2"

# Retrieves the directory of this script.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Install a system package required by our library
yum install -y atlas-devel

. $SCRIPT_DIR/env_setup.sh $CUR_OS $SFML_VERSION

# Compile wheels
for PYBIN in /opt/python/*/bin; do
    "${PYBIN}/pip" install -r /io/requirements-dev.txt
    "${PYBIN}/pip" wheel /io/ -w dist/
done

# Bundle external shared libraries into the wheels
for whl in dist/*.whl; do
    auditwheel repair "$whl" -w /io/dist/
done

# Install packages and test
for PYBIN in /opt/python/*/bin/; do
    "${PYBIN}/pip" install python-sfml --no-index -f /io/dist
    # TODO Execute Linux tests like the following:
    # (cd "$HOME"; "${PYBIN}/nosetests" pymanylinuxdemo)
done