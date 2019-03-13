#!/bin/bash

EMACS_DIR=~/.emacs.d
YCMD_DIR=${EMACS_DIR}/ycmd

function checkout_ycmd {
    cd $EMACS_DIR
    git submodule update --init --recursive
}


function build_ycmd_module {
    cd $YCMD_DIR
    python3 build.py --clang-completer --rust-completer --js-completer --java-completer
}

if [ -d ${YCMD_DIR} -a -z "$(ls -A ${YCMD_DIR})" ]; then
    checkout_ycmd
fi
build_ycmd_module
