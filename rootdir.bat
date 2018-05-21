@echo off

set mypath=%cd%
@echo %mypath%

MKDIR %CD:~0,3%\Dev\Downloads

echo "%CD:~0,3%\Dev\Downloads Created.........."
pause

echo "Installing VSCode.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://vscode-update.azurewebsites.net/latest/win32-x64/stable', '%CD:~0,3%\Dev\Downloads\VScodeSetup.exe')"
	
start %CD:~0,3%\Dev\Downloads\VSCodeSetup.exe /VERYSILENT /MERGETASKS=!runcode

echo "VSCode installed.........."

echo "Installing nodejs.........."

CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://nodejs.org/dist/v8.11.2/node-v8.11.2-x64.msi', '%CD:~0,3%\Dev\Downloads\nodejs.msi')"
	
MSIEXEC.exe /i %CD:~0,3%\Dev\Downloads\nodejs.msi ACCEPT=YES /quiet

echo "nodejs installed.........."

echo "Installing git.........."
REM -- TODO --
REM This is failing we are not able to download from git site.Ideally a git build solution or curl the url may workout
start %CD:~0,3%Git-2.13.1.2-64-bit.exe /VERYSILENT /MERGETASKS=!runcode

echo "git installed.........."

rem CALL powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.17.0.windows.1/Git-2.17.0-64-bit.exe', 'git.exe')"
rem echo "git downloaded....."
		  
rem start %CD:~0,3%\Dev1\Downloads\git.exe /VERYSILENT /MERGETASKS=!runcode

echo "Installing npm.........."

call npm install
echo "Installed npm.........."

echo "Installing ember.........."

call npm install ember-cli -g
echo "Installed ember.........."

echo "Installing bower.........."

call npm install -g bower
echo "Installed bower.........."

call git config --global http.sslVerify false

echo "Cloning ember-masonry-grid.........."
 pause
 call git clone https://git.bbh.org.in/git/ember-masonry-grid  "%CD:~0,3%Dev\ember-masonry-grid"
 echo "Ember-masonry-grid cloning finished.........."
 chdir /D %CD:~0,3%Dev\ember-masonry-grid
pause
REM  call npm install  "%CD:~0,3%Dev\ember-masonry-grid\"
 call npm install  
 echo "npm installed............"
 pause
 echo "Installing Bower.........."
 call bower install 
 echo "bower installed............"


 pause
echo "Cloning bbhverse.........."
pause
 call git clone https://git.bbh.org.in/git/bbhverse  "%CD:~0,3%Dev\bbhverse"
 echo "bbhverse cloning finished.........."
 chdir /D %CD:~0,3%Dev\bbhverse
pause
call npm install  
 echo "npm installed............"
 pause


echo "Cloning loopback.........."
pause
 call git clone https://git.bbh.org.in/git/loopback  "%CD:~0,3%Dev\loopback"
 echo "loopback cloning finished.........."
 pause
 chdir /D %CD:~0,3%Dev\loopback
 echo " installing npm..........."
 call npm install
 echo "Installed npm..........."
 pause


echo "Cloning ember-searchable-select........."
pause
call git clone https://github.com/baptistdev/ember-searchable-select.git  "%CD:~0,3%Dev\ember-searchable-select"
echo "ember-searchable-select cloning finished.........."
pause
REM chdir /D %CD:~0,3%Dev\ember-searchable-select
REM echo "installing npm.........." 
REM npm cache clean --force
REM call npm install  
REM pause
REM echo "npm installed............"
REM echo "Installing Bower.........."
REM call bower install 
REM echo "bower installed............"
REM pause

echo "Cloning QMS.........."
pause
call git clone https://git.bbh.org.in/git/qms  "%CD:~0,3%Dev\qms"
echo "QMS cloning finished.........."
pause

REM chdir /D %CD:~0,3%Dev\qms
REM echo "Installing npm.........."
REM call npm install
REM echo "npm installed............"
REM pause
REM echo "Installing Bower.........."
REM call bower install 
REM echo "bower installed............"
REM pause


echo "removed few lines"
exit 

