@echo off
setlocal enabledelayedexpansion

call :load_env
call :checkgit

git config --global core.autocrlf true
git config advice.addIgnoredFile false

if "!GITHUB_TOKEN!"=="" (
    echo GITHUB_TOKEN is not set. Please check the env file.
    pause
    exit /b 
)

if "!GITHUB_REPO!"=="" (
    echo GITHUB_REPO is not set. Please check the env file.
    pause
    exit /b 1
)

if "!REPO_PATH!"=="" (
    echo REPO_PATH is not set. Please check the env file.
    pause
    exit /b 1
)

:checkgit
if not exist "!REPO_PATH!\.git\" (
    echo The .git directory does not exist. Initializing the git repository...
    git init "!REPO_PATH!"
    echo Please restart cmd.
    exit /b 0
    pause
) else (
    call :header
)

echo Enter the file name to commit (including extension)
set /p file_name="> "

echo Enter the commit message
set /p commit_message="> "

cd /d "!REPO_PATH!"
if errorlevel 1 (
    echo.
    echo Error: Incorrect repository path.
    pause
    goto :eof
)

rem Remove index.lock file if it exists
if exist .git\index.lock (
    del /f .git\index.lock
)

rem Create or update .gitignore file
(
    echo # Ignore everything
    echo *
    echo.
    echo # But track these files
    echo !.gitignore
    echo !README.md
    echo !%file_name%
) > .gitignore

rem Add .gitignore to the staging area
git add -f .gitignore
if errorlevel 1 (
    echo.
    echo Error: Unable to add the .gitignore file. Please check the file and try again.
    pause
    goto :eof
)

rem Create or update README.md file
(
    echo # GitHub Commit Automation Script made By ^[HongJun^(hJun-KR^)^](https://github.com/hJun-KR^)
    echo.
    echo This script automates the process of committing and pushing changes to GitHub.
) > README.md

rem Add README.md to the staging area
git add -f README.md
if errorlevel 1 (
    echo.
    echo Error: Unable to add the README.md file. Please check the file and try again.
    pause
    goto :eof
)

rem Add the specified file to the staging area
git add -f "%file_name%"
if errorlevel 1 (
    echo.
    echo Error: Unable to add the file. Please check the file name and try again.
    pause
    goto :eof
)

rem Commit the changes
git commit -m "%commit_message%"
if errorlevel 1 (
    echo.
    echo Error: Unable to commit the file. Please check Git settings and try again.
    pause
    goto :eof
)

git branch -M main

rem Set the remote URL with the GitHub token
set remote_url=https://!GITHUB_TOKEN!@github.com/!GITHUB_REPO!.git
git remote add origin %remote_url%

rem Push the changes to the remote repository
git push -f origin main
if errorlevel 1 (
    echo.
    echo Error: Unable to push to GitHub. Please check network connection and remote repository settings.
    pause
    goto :eof
)

echo.
echo ========================================
echo          Commit and Push Successful
echo ========================================
pause
goto :eof

:header
cls
echo ========================================
echo         GitHub Commit Automation
echo ========================================
echo.
goto :eof

:load_env
if exist .env (
    for /f "tokens=1,* delims==" %%a in (.env) do (
        set %%a=%%b
    )
) else (
    echo Cannot find the env file.
    pause
    exit /b 1
)
goto :eof
