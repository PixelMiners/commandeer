@echo off
title Commandeer™

echo Commandeer [Version 1.0]
echo (c) 2022 Partiglow. All rights haven't been reserved yet.
echo.
:command
set /p command=%cd% : 
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
) ELSE (
	goto parsecommand
)
:: when the user types "raid shadow legends" it will give you a stupid fricking ad

:: end of area for custom commands
:parsecommand
%command%
cd Logs
echo %cd% : %command%>> logs.txt
%command% >> logs.txt
cd ..
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
echo bootleg command prompt lmao
pause
goto command

:clearlogs
echo fine you baka
cd Logs
echo.> logs.txt
cd ..
goto command