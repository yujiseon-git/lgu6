#!/bin/bash

# 사용자에게 커밋 메시지 입력 받기
read -p "커밋 메시지를 입력하세요: " user_message

# 현재 시간 (서울 시간대)
current_time=$(TZ=Asia/Seoul date "+%Y-%m-%d %H:%M:%S")

# Git add → commit → push
git add .

# 날짜 지정하여 커밋
GIT_COMMITTER_DATE="$current_time" git commit --date="$current_time" -m "$user_message"

# 기본 브랜치로 푸시 (필요시 수정)
git push origin HEAD

# 결과 출력
echo "✅ [$current_time] 커밋 및 푸시 완료: \"$user_message\""