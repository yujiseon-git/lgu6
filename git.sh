#!/bin/bash

# 입력 받기
read -p "커밋 메시지를 입력하세요: " commit_message
read -p "날짜를 입력하세요 (예: '2025-04-11 14:00:00'): " commit_date
#
# # Git 스테이지에 변경 사항 추가
git add .
#
# # 환경변수 설정해서 커밋 수행
 GIT_COMMITTER_DATE="$commit_date" git commit --date="$commit_date" -m "$commit_message"
#
echo "[$commit_date] 커밋 완료: $commit_message"

git push
