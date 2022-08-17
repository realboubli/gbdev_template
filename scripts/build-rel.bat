rgbasm -v -i ./include -o ./build/bin/main.o ./src/main.asm
rgblink -v --dmg -o ./build/release/main.gb ./build/bin/main.o
rgbfix -c -v -t GameTitle -p 0xFF ./build/release/main.gb

#