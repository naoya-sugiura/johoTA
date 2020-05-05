#! /bin/sh

if [ $# -le 1 ]; then
    echo "too little arguments !"
    echo "argument must be grater than 2"
    exit 1
fi

if ! [ `echo $PWD | grep "src"` ]; then
    echo "please compile in src dir"
    exit 1
fi

cd $PWD/..
TEST_CASE_DIR="test_case/${1%.*}"
if ! [ -e $TEST_CASE_DIR ]; then
    mkdir $TEST_CASE_DIR
    echo "setup test case dir"
fi

TEST_CASE_IN=0
for pathfile in $TEST_CASE_DIR/*.in; do
    CURR_TEST_CASE=${pathfile##*/}
    CURR_TEST_CASE=${CURR_TEST_CASE%.*}
    if [ $TEST_CASE_IN -lt $CURR_TEST_CASE ]; then
        TEST_CASE_IN=$CURR_TEST_CASE
    fi
done
TEST_CASE_OUT=${TEST_CASE_DIR}/$(($TEST_CASE_IN+1)).out
TEST_CASE_IN=${TEST_CASE_DIR}/$(($TEST_CASE_IN+1)).in

BIN_FILE=bin/${1%.*}.out
if ! [ -e $BIN_FILE ]; then
    echo "\"$BIN_FILE\" no such file or directory !"
    exit 1
fi

ARG_IN=${@#* }
echo "===== input  ====="
echo "$ARG_IN"
echo "$ARG_IN" >> $TEST_CASE_IN
./$BIN_FILE < $TEST_CASE_IN >> $TEST_CASE_OUT
echo "===== output ====="
./$BIN_FILE < $TEST_CASE_IN
echo ""
echo "generated \"$TEST_CASE_IN\" and \"$TEST_CASE_OUT\""
