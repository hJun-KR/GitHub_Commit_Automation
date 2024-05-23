# GitHub Commit Automation Script by hJun-KR

이 스크립트는 GitHub에 변경 사항을 커밋하고 푸시하는 과정을 자동화합니다.

## 사용 방법

1. `.env` 파일을 생성하고, 아래의 환경 변수를 설정합니다:
    - `GITHUB_TOKEN`: GitHub 토큰
    - `GITHUB_REPO`: GitHub 저장소 이름 (예: `username/repo`)
    - `REPO_PATH`: 로컬 Git 저장소의 경로

2. 스크립트를 실행합니다. 스크립트는 커밋할 파일 이름과 커밋 메시지를 물어봅니다.

## GitHub 토큰 생성하기

이 스크립트를 사용하려면 GitHub 토큰이 필요합니다. GitHub 토큰을 생성하는 방법은 다음과 같습니다:

1. GitHub에 로그인합니다.
2. 오른쪽 상단의 프로필 사진을 클릭하고, 드롭다운 메뉴에서 'Settings'를 선택합니다.
3. 왼쪽 사이드바에서 'Developer settings'를 클릭합니다.
4. 'Developer settings' 페이지에서 'Personal access tokens'를 클릭합니다.
5. 'Generate new token' 버튼을 클릭합니다.
6. 'Note' 필드에 토큰에 대한 설명을 입력합니다 (예: "Commit Automation Script").
7. 'Select scopes' 섹션에서 필요한 권한을 선택합니다. 이 스크립트에서는 'repo' 권한이 필요합니다.
8. 페이지 하단의 'Generate token' 버튼을 클릭합니다.
9. 생성된 토큰을 복사하고 안전한 장소에 저장합니다. 이 토큰은 다시 보여지지 않으므로, 잃어버리지 않도록 주의해야 합니다.
10. 이 토큰을 `.env` 파일의 `GITHUB_TOKEN` 변수에 붙여넣습니다.
