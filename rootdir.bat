@echo off

set mypath=%cd%
@echo %mypath%


MKDIR %CD:~0,3%\Dev1\Downloads


echo "%CD:~0,3%\Dev1\Downloads Created.........."

echo "Installing VSCode.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://vscode-update.azurewebsites.net/latest/win32-x64/stable', '%CD:~0,3%\Dev1\Downloads\VScodeSetup.exe')"
	
start %CD:~0,3%\Dev1\Downloads\VSCodeSetup.exe /VERYSILENT /MERGETASKS=!runcode

echo "VSCode installed.........."

pause

echo "Installing git.........."
REM -- TODO --
REM This is failing we are not able to download from git site.Ideally a git build solution or curl the url may workout
start %CD:~0,3%/Git-2.13.1.2-64-bit.exe /VERYSILENT /MERGETASKS=!runcode
echo "git installed.........."

pause

echo "Installing nodejs.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://nodejs.org/dist/v10.1.0/node-v10.1.0-x64.msi', '%CD:~0,3%\Dev1\Downloads\nodejs.msi')"
	
MSIEXEC.exe /i %CD:~0,3%Dev1\Downloads\nodejs.msi ACCEPT=YES /passive

echo "nodejs installed.........."

pause

echo "Cloning necessary repositories.........."


call git config --global http.sslVerify false



echo "Cloning ember-masonry-grid.........."
call git clone https://git.bbh.org.in/git/ember-masonry-grid %CD:~0,3%\Dev1\ember-masonry-grid
echo "Cloned ember-masonry-grid......... "
pause


echo "Cloning bbhverse.........."
call git clone https://git.bbh.org.in/git/bbhverse %CD:~0,3%\Dev1\bbhverse
echo " Cloned bbhverse.........."
pause


echo "Cloning loopback.........."
call git clone https://git.bbh.org.in/git/loopback %CD:~0,3%\Dev1\loopback
echo "Cloned loopback........."


echo "Cloning qms.........."
call git clone https://git.bbh.org.in/git/qms %CD:~0,3%\Dev1\qms
echo "Cloned qms..........."
pause


echo "Cloning ember-searchable-select.........."
call git clone https://github.com/baptistdev/ember-searchable-select.git %CD:~0,3%\Dev1\ember-searchable-select
echo "Cloned ember-searchable-select........"
pause
echo "cloning finished.........."

exit

