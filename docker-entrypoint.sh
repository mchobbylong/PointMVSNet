#!/bin/bash
FIRST_START="/FIRST_START_CHECKPOINT"
if [ ! -e $FIRST_START ]; then
    touch $FIRST_START
    ./compile.sh
fi

$SHELL
