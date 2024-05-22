# GitHub Commit Automation Script

이 스크립트는 GitHub에 변경 사항을 커밋하고 푸시하는 과정을 자동화합니다.

## 사용 방법

1. `.env` 파일을 생성하고, 아래의 환경 변수를 설정합니다:
    - `GITHUB_TOKEN`: GitHub 토큰
    - `GITHUB_REPO`: GitHub 저장소 이름 (예: `username/repo`)
    - `REPO_PATH`: 로컬 Git 저장소의 경로

2. 스크립트를 실행합니다. 스크립트는 커밋할 파일 이름과 커밋 메시지를 물어봅니다.

