#!/bin/bash

# get current info
DATE=$(date "+%Y.%m.%d")
DAY=$(date "+%d")
MON=$(date "+%0m")
YEAR=$(date "+%Y")
TARGET_FILE_NAME="${MON}${DAY}"
TARGET_FILE_PATH="JooEun/${TARGET_FILE_NAME}"
COUNT=$(ls -l $TARGET_FILE_PATH | grep -E "(*.py|*.cpp|*.c)" | wc -l | sed 's/ //g')
MENT=""
echo "#BAEKJOON  \n 오늘 푼 문제의 수는 $(COUNT)입니다." > README.md