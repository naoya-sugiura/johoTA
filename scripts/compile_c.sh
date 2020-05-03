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
fi

cd $PWD

if ! [ -e $1 ]; then
    echo "\"$1\" no such file or directory !"
    exit 1
fi

OUTPUT_FILE=${1%.*}.out
OUTPUT_DIR=$PWD/../bin
gcc -DONLINE_JUDGE  -o2 -w -fmax-errors=3 -std=c11 $1 -lm -o $OUTPUT_FILE

if ! [ -e $OUTPUT_DIR ];
then
    mkdir $OUTPUT_DIR
    echo "setup binary folder"
fi

if ! [ -e $OUTPUT_FILE ]; then
    echo "\"$OUTPUT_FILE\" no such file or directory !"
    echo " compile error !!"
    exit 1
fi
mv $OUTPUT_FILE ../bin

echo "c file compile done !!"
