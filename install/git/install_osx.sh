#!/bin/sh
# Install latest git for OSX.
#
# WARNING: This is a destructive install that will overwrite .gitconfig.

SCRIPT_DIR=$(dirname $0)

brew install git
hash -r

cp $SCRIPT_DIR/../../.gitconfig ~
cp $SCRIPT_DIR/../../.gitignore_global ~

echo
echo "===================="
echo
echo "To launch the new git, ensure your PATH is configured with /usr/local/bin"
echo "before /usr/bin."
echo "PATH=$PATH"
