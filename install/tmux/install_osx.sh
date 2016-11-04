#!/bin/sh
# Install tmux for OSX.
#
# WARNING: This is a destructive install that will overwrite .tmux.conf.

SCRIPT_DIR=$(dirname $0)
brew install tmux
hash -r

cp $SCRIPT_DIR/../../.tmux.conf ~

