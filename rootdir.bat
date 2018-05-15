@echo off

set mypath=%cd%
@echo %mypath%


MKDIR Dev

MKDIR Dev\Downloads

pause
echo "Dev\Downloads Created.........."


pause
echo "Installing VSCode.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://vscode-update.azurewebsites.net/latest/win32-x64/stable', 'Dev\Downloads\VScodeSetup.exe')"
	
start Dev\Downloads\VSCodeSetup.exe /VERYSILENT /MERGETASKS=!runcode

echo "VSCode installed.........."


pause

echo "Installing nodejs.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://nodejs.org/dist/v10.1.0/node-v10.1.0-x64.msi', 'Dev\Downloads\nodejs.msi')"
	
MSIEXEC.exe /i Dev\Downloads\nodejs.msi ACCEPT=YES /quiet

echo "nodejs installed.........."


pause
echo "Installing git.........."

start E:\sample\Git-2.13.1.2-64-bit.exe /VERYSILENT /MERGETASKS=!runcode

echo "git installed.........."



rem CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.17.0.windows.1/Git-2.17.0-64-bit.exe', 'git.exe')"
rem echo "git downloaded....."
		  

rem start Dev\Downloads\git.exe /VERYSILENT /MERGETASKS=!runcode


pause
echo "Installing npm.........."

call npm install
echo "Installed npm.........."


pause
echo "Installing ember.........."

call npm install ember-cli -g
echo "Installed ember.........."



pause
echo "Installing bower.........."

call npm install -g bower
echo "Installed bower.........."


pause
echo "Cloning ember-masonry-grid.........."
call git config --global http.sslVerify false


call git clone https://git.bbh.org.in/git/ember-masonry-grid

echo "cloning finished.........."

rem call git clone https://git.bbh.org.in/git/ember-searchable-select.git

exit

