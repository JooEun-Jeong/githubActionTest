# get current info
SLACK_WEBHOOK_URL=$1
REPO_URL=$2
PR_CONTENT=$3

DAILY_MESSAGE="Deploy Success!
Updated info: ${PR_CONTENT}
Repo: ${REPO_URL}"

echo $DAILY_MESSAGE
# 슬랙 채널로 메시지 요청
curl -X POST --data-urlencode "payload={\"channel\": \"#test-for-github-action\", \"username\": \"Alert Manager\", \"text\": \"${DAILY_MESSAGE}\", \"icon_emoji\": \":seal:\"}" $SLACK_WEBHOOK_URL