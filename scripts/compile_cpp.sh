#! /bin/sh

if [ $# = 0 ]; then
    echo "too little arguments !"
    echo "argument must be greater than 1"
    exit 1
fi

if ! [ `echo $PWD | grep "src"` ]; then
    echo "please compile in src dir"
    exit 1
fi

cd $PWD

if ! [ -e $1 ]; then
    echo "\"$1\" no such file or directory !"
    exit 1
fi

INCLUDE_DIR=$PWD/../include
OUTPUT_DIR=$PWD/../bin
OUTPUT_FILE=${1%.*}.out
THREAD=""
for x in "$@"
do
    if [ $x = "--thread" ]; then
        THREAD="-pthread"
        break
    fi
done

if [ -e $INCLUDE_DIR ]; then
    g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 $1 -lm -o $OUTPUT_FILE -I $INCLUDE_DIR $THREAD
else
    g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 $1 -lm -o $OUTPUT_FILE $THREAD
fi

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

echo "cpp file compile done !!"
