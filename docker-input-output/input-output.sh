#!/bin/bash

if [ $# != 1 ]
then
    echo "Usage: ./$(basename $0) sizeInGb"
    exit 111
fi

dd if=/dev/zero of=/root/outputfile-size-$1Gb count=$1 bs=1G
