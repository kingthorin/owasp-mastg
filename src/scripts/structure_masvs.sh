#!/bin/bash

if [ -d "../owasp-masvs/" ] ; then
    MASVS_DIR=../owasp-masvs
elif [ -d "./owasp-masvs/" ] ; then
    MASVS_DIR=./owasp-masvs
else
    echo "Error: Please clone owasp-masvs to same directory as owasp-mastg: cd .. && git clone https://github.com/OWASP/owasp-masvs.git"
    exit 1
fi

cp -r $MASVS_DIR/Document/*-*.md docs/MASVS/
cp -r $MASVS_DIR/controls/ docs/MASVS/controls/

if [[ "$(uname)" == "Darwin" ]]; then
    SED="gsed"
else
    SED="sed"
fi

mkdir -p docs/assets/MASVS/Images
cp $MASVS_DIR/Document/images/* docs/assets/MASVS/Images
$SED -i "s#images/#../../../assets/MASVS/Images/#g" docs/MASVS/**/*.md
$SED -i "s#images/#../../assets/MASVS/Images/#g" docs/MASVS/*.md
