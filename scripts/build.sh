#!/bin/bash

SCRIPT_DIR=`dirname $0`
NAME=$1
VERSION=$2
DESC=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <name> <version> <description>"
    exit 1
fi

echo NAME=$NAME
echo VERSION=$VERSION
echo DESC=$DESC

echo ">> generate-vagrantfile.sh"
$SCRIPT_DIR/generate-vagrantfile.sh $NAME $VERSION

echo ">> build-box.sh"
$SCRIPT_DIR/build-box.sh $NAME $VERSION

echo ">> generate-json.sh"
$SCRIPT_DIR/generate-json.sh $NAME $VERSION "$DESC"

echo ">> add-vagrant-box.sh"
$SCRIPT_DIR/add-vagrant-box.sh $NAME $VERSION 