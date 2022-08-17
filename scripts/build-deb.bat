@echo off
echo [92mBuilding...[0m
echo [1mrgbasm -v -h -L -Weverything -E -i ./include -o ./build/bin/debug/main.o ./src/main.asm[0m
rgbasm -v -L -Weverything -E -i ./include -o ./build/bin/debug/main.o ./src/main.asm
if errorlevel 1 goto error
echo.
echo [92mLinking...[0m
echo [1mrgblink -v --dmg -n ./build/debug/main.sym -o ./build/debug/main.gb ./build/bin/debug/main.o[0m
rgblink -v --dmg -n ./build/debug/main.sym -o ./build/debug/main.gb ./build/bin/debug/main.o
if errorlevel 1 goto error
echo.
echo [92mFixing...[0m
echo [1mrgbfix -c -t GameTitle -p 0xFF ./build/debug/main.gb[0m
rgbfix -c -t GameTitle -p 0xFF ./build/debug/main.gb
if errorlevel 1 goto error
echo.
echo [92mBuild done![0m
exit /b 0
:error
echo [31mAn error occured. Build failed.[0m
exit /b 1