@echo off

set mypath=%cd%
@echo %mypath%


MKDIR %CD:~0,3%\Dev1\Downloads


echo "%CD:~0,3%\Dev1\Downloads Created.........."



echo "Installing VSCode.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://vscode-update.azurewebsites.net/latest/win32-x64/stable', '%CD:~0,3%\Dev1\Downloads\VScodeSetup.exe')"
	
start %CD:~0,3%\Dev1\Downloads\VSCodeSetup.exe /VERYSILENT /MERGETASKS=!runcode

echo "VSCode installed.........."



echo "Installing nodejs.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://nodejs.org/dist/v10.1.0/node-v10.1.0-x64.msi', '%CD:~0,3%\Dev1\Downloads\nodejs.msi')"
	
MSIEXEC.exe /i %CD:~0,3%\Dev1\Downloads\nodejs.msi ACCEPT=YES /quiet

echo "nodejs installed.........."



echo "Installing git.........."
REM -- TODO --
REM This is failing we are not able to download from git site.Ideally a git build solution or curl the url may workout
start %CD:~0,3%/Git-2.13.1.2-64-bit.exe /VERYSILENT /MERGETASKS=!runcode

echo "git installed.........."



rem CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.17.0.windows.1/Git-2.17.0-64-bit.exe', 'git.exe')"
rem echo "git downloaded....."
		  

rem start %CD:~0,3%\Dev11\Downloads\git.exe /VERYSILENT /MERGETASKS=!runcode



echo "Installing npm.........."

call npm install
echo "Installed npm.........."



echo "Installing ember.........."

call npm install ember-cli -g
echo "Installed ember.........."




echo "Installing bower.........."

call npm install -g bower
echo "Installed bower.........."



echo "Cloning ember-masonry-grid.........."
call git config --global http.sslVerify false


call git clone https://git.bbh.org.in/git/ember-masonry-grid

call git clone https://git.bbh.org.in/git/ember-table

echo "cloning finished.........."
echo "removed few lines"
exit

