#!/usr/bin/env bash
#
# Usage: bootstrap-rvm.bash [branch]
# If not given, 'branch' defaults to 'stable'

set -x
exec > /tmp/bootstrap.out
exec 2> /tmp/bootstrap.err
set -e
branch=$1
[ -z "$branch" ] && branch=stable

USER="$(whoami)"
HOME="$(getent passwd "$USER" | awk -F: '{print $(NF-1)}')"

echo "HOME: $HOME"
cd $HOME
export HOME

rvm="${HOME}/.rvm/scripts/rvm"
if [ ! -f "$rvm" ] ; then
  curl -L https://get.rvm.io | bash -s stable
fi
