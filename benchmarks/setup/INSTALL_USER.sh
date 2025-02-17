#!/bin/bash

# This runs benchmarks, by default from develop branch of
# github.com/neatio-net/merkle-go
# You can customize this by optional command line args
#
# INSTALL_USER.sh [branch] [repouser]
#
# set repouser as your username to time your fork

BRANCH=${1:-develop}
REPOUSER=${2:-tendermint}

cat <<'EOF' > ~/.goenv
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
EOF

. ~/.goenv

mkdir -p $GOPATH/src/github.com/tendermint
MERKLE=$GOPATH/src/github.com/neatio-net/merkle-go
git clone https://github.com/${REPOUSER}/go-merkle.git $MERKLE
cd $MERKLE
git checkout ${BRANCH}
