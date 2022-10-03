@echo off





set commandeerlocation=%cd%
set currentdrive=%CD:~0,3%
if exist setupdel_DO-NOT-DELETE goto commandeer
title Commandeer - First Time Setup
echo Welcome to Commandeer!
pause
cls
echo Generating folders..
mkdir "Logs"
mkdir "commandeerData"
timeout 1 >nul
echo. > setupdel_DO-NOT-DELETE
attrib +h setupdel_DO-NOT-DELETE
cls
echo Would you like to set a password?
echo [Y] - Yes
echo [N] - No
choice /N /C:YN %1
if %errorlevel%==1 rem
if %errorlevel%==2 goto startupcheck
set /p "password=Set your password | "
cd commandeerData
echo %password%>pass
cd ..
goto commandeer



:wrongpass
cd Logs
echo User input incorrect password >>logs.txt
cd ..
echo Incorrect password.
pause
goto running

:running
cd commandeerData
set /p pass=<pass
cd ..
cls
echo Enter your password:
set /p "enterpass=Enter | "
IF %enterpass%==%pass% (
	goto start
) ELSE (
	goto wrongpass
)
:commandeer
cd Logs
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"') do set ip=%%b
set ip=%ip:~1%
echo User (%ip%) launched Commandeer >>logs.txt
cd ..
cd commandeerData
if exist pass goto running
if not exist pass goto start
cd ..

:start
cls
cd %currentdrive%
title Commandeer
echo Commandeer - 1.0 ^| 2022 Partiglow. All rights haven't been reserved yet.
echo 
echo.


:command
set /p "command=%cd% | "
:: area for custom commands
:: when the user types "amongus" it will respond with "frick you"
IF "%command%" == "amongus" (
	goto amongus
) ELSE IF "%command%" == "raidshadowlegends" (
	goto raidshadowlegends
) ELSE IF "%command%" == "about" (
	goto about
) ELSE IF "%command%" == "clearlogs" (
	goto clearlogs
) ELSE IF "%command%" == "echo on" (
	goto echoon
) ELSE (
	goto parsecommand
)
:: when the user types "raid shadow legends" it will give you a stupid fricking ad

:: end of area for custom commands
:parsecommand
set previouscd=%cd%
cd %commandeerlocation%
cd Logs
echo %cd% : %command%>> logs.txt
%command%
if %ERRORLEVEL%==9009 echo Unknown Command
cd ..
set "command= "
cd %previouscd%
goto command

:amongus
echo frick you
pause
goto command

:raidshadowlegends
echo 'raidshadowlegends' is recognized as an internal or external command,
echo but first we have to thank our sponsor,
echo Raid Shadow Legends.
echo "RAID Shadow Legends™️ is an immersive online experience with everything you'd expect from a brand new RPG title. It's got an amazing storyline, awesome 3D graphics, giant boss fights, PVP battles, and hundreds of never before seen champions to collect and customize. I never expected to get this level of performance out of a mobile game. Look how crazy the level of detail is on these champions! RAID: Shadow Legends™️ is getting big real fast, so you should definitely get in early. Starting now will give you a huge head start. There's also an upcoming Special Launch Tournament with crazy prizes! And not to mention, this game is absolutely free! So go ahead and check out the video description to find out more about RAID: Shadow Legends™️. There, you will find a link to the store page and a special code to unlock all sorts of goodies. Using the special code, you can get 50,000 Silver immediately, and a FREE Epic Level Champion as part of the new players program, courtesy of course of the RAID Shadow Legends™️ devs."
pause
goto command

:about
echo Commandeer is just Command Prompt but with a bit more features.
pause
goto command

:clearlogs
echo Cleared logs.
cd Logs
echo.> logs.txt
cd ..
goto command

:echoon
echo Are you sure? This will show every command that is running when you do anything.
echo [Y] - I know what I'm doing!
echo [N] - Nah
choice /N /C:YN %1
if %errorlevel%==1 @echo on
if %errorlevel%==2 rem
goto command