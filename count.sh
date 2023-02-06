# get current info
## count info!!!
SLACK_WEBHOOK_URL=$1
DATE=$(date "+%Y.%m.%d")
DAY=$(date "+%d")
MON=$(date "+%0m")
YEAR=$(date "+%Y")
TARGET_FILE_NAME="${MON}${DAY}"
TARGET_FILE_PATH="JooEun/${TARGET_FILE_NAME}"
MENT=""
COUNT=$(ls -l $TARGET_FILE_PATH | grep -E "(*.py|*.cpp|*.c)" | wc -l | sed 's/ //g')
if [ $? -eq 1 ];then
  MENT="문제를 하나라도 푸세요!"
  COUNT=0
else
  if [ $COUNT -ge 1 -a $COUNT -lt 2 ]
  then
    MENT="문제를 하나 더 푸는게 어떨까요?"
  else
    MENT="잘하고 있습니다!"
  fi
fi
DAILY_MESSAGE="현재일($TARGET_FILE_NAME)기준으로, ${COUNT}문제를 풀었어요\n"
# 슬랙 채널로 메시지 요청
curl -X POST --data-urlencode "payload={\"channel\": \"#test-for-github-action\", \"username\": \"Ghost\", \"text\": \"${DAILY_MESSAGE}\", \"icon_emoji\": \":smile:\"}" "$SLACK_WEBHOOK_URL"