@echo off
if exist CheesyPizza.exe goto run
echo Place this in the build folder
echo.
pause
exit

:run
if not exist xdelta mkdir xdelta
echo --- files ---
copy /y "CheesyPizza.dll" "xdelta\CheesyPizza.dll"
copy /y "NekoPresence_x64.dll" "xdelta\NekoPresence_x64.dll"
copy /y "data\intro.mp4" "xdelta\intro.mp4"
copy /y "data\lang\english.txt" "xdelta\english.txt"
echo --- exe ---
xdelta3 -c -v -s "D:\SteamLibrary\steamapps\common\Pizza Tower\RAW\PizzaTower.exe" "CheesyPizza.exe" > "xdelta\exe-yyc.xdelta"
echo --- data ---
xdelta3 -c -v -s "D:\SteamLibrary\steamapps\common\Pizza Tower\RAW\data.win" "data.win" > "xdelta\data.xdelta"
echo --- banks ---
xdelta3 -c -v -s "D:\SteamLibrary\steamapps\common\Pizza Tower\RAW\Master.bank" "data/sound/Master.bank" > "xdelta\masterbank.xdelta"
xdelta3 -c -v -s "D:\SteamLibrary\steamapps\common\Pizza Tower\RAW\Master.strings.bank" "data/sound/Master.strings.bank" > "xdelta\masterstringsbank.xdelta"
xdelta3 -c -v -s "D:\SteamLibrary\steamapps\common\Pizza Tower\RAW\music.bank" "data/sound/music.bank" > "xdelta\musicbank.xdelta"
xdelta3 -c -v -s "D:\SteamLibrary\steamapps\common\Pizza Tower\RAW\sfx.bank" "data/sound/sfx.bank" > "xdelta\sfxbank.xdelta"
