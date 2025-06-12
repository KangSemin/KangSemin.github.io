#!/bin/bash

if [ -z "$1" ]
  then
    echo "사용법: ./newpost.sh '글 제목'"
    exit 1
fi

# 한글 제목 → 파일명 슬러그로 변환
slug=$(echo "$1" | iconv -f utf-8 -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

filename="content/posts/$slug.md"

hugo new posts/$slug.md

# 파일 오픈 (원하면 주석처리 가능)
open $filename
