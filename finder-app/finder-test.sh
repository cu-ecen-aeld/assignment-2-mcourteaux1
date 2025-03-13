#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

set -e
set -u

NUMFILES=10
WRITESTR=AELD_IS_FUN
WRITEDIR=/tmp/aeld-data
username=$(cat conf/username.txt)

if [ $# -lt 3 ]
then
    echo "Using default value ${WRITESTR} for string to write"
    if [ $# -lt 1 ]
    then
        echo "Using default value ${NUMFILES} for number of files to write"
    else
        NUMFILES=$1
    fi  
else
    NUMFILES=$1
    WRITESTR=$2
    WRITEDIR=/tmp/aeld-data/$3
fi

MATCHSTR="The number of files are ${NUMFILES} and the number of matching lines are ${NUMFILES}"

echo "Writing ${NUMFILES} files containing string ${WRITESTR} to ${WRITEDIR}"

rm -rf "${WRITEDIR}"

assignment=$(cat conf/assignment.txt)

if [ "$assignment" != "assignment1" ]
then
    mkdir -p "$WRITEDIR"

    if [ -d "$WRITEDIR" ]
    then
        echo "$WRITEDIR created"
    else
        exit 1
    fi
fi

for i in $(seq 1 $NUMFILES)
do
    ./finder-app/writer "$WRITEDIR/file$i.txt" "$WRITESTR"
done

# Capture the actual output of finder.sh
OUTPUTSTRING=$(./finder-app/finder.sh "$WRITEDIR" "$WRITESTR")

# Debugging output to compare expected and actual results
echo "DEBUG: Expected output: '${MATCHSTR}'"
echo "DEBUG: Actual output: '${OUTPUTSTRING}'"

# Compare expected vs actual output
if echo "$OUTPUTSTRING" | grep -q "$MATCHSTR"; then
    echo "success"
    exit 0
else
    echo "failed: expected '${MATCHSTR}' but found '${OUTPUTSTRING}'"
    exit 1
fi

