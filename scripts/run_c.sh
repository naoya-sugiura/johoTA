#! /bin/sh

if [ $# = 0 ]; then
    echo "too little arguments !"
    echo "argument must be 1"
    exit 1
elif [ $# -ne 1 ]; then
    echo "too many arguments !"
    echo "argument must be 1"
    exit 1
fi

if ! [ `echo $PWD | grep "src"` ]; then
    echo "please compile in src dir"
    exit 1
fi

cd $PWD/../bin
OUTPUT_FILE=${1%.*}.out

if ! [ -e $OUTPUT_FILE ]; then
    echo "\"$OUTPUT_FILE\" no such file or directory !"
    exit 1
fi
./$OUTPUT_FILE
