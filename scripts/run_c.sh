#! /bin/sh

if [ $# -le 0 ]; then
    echo "too little arguments !"
    echo "argument must be grater than 1"
    exit 1
fi

if ! [ `echo $PWD | grep "src"` ]; then
    echo "please running in src dir"
    exit 1
fi

cd $PWD
OUTPUT_FILE=../bin/${1%.*}.out

if ! [ -e $OUTPUT_FILE ]; then
    echo "\"$OUTPUT_FILE\" no such file or directory !"
    exit 1
fi

ARG_IN=${@#* }
./$OUTPUT_FILE $ARG_IN
