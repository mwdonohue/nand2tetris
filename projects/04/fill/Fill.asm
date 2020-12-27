// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// PSEUDO
//      Whenever a key is pressed, blacken the screen (but what does this mean?)
// Put your code here.

// The main loop


(MAIN)

// Goal: Probe the keyboard and see if its value is equal to 0
@KBD // A = KBD      -- the address
D=M  // D = RAM[KBD] -- the value

@ISNOTPRESSED // A = ISNOTPRESSED
D,JEQ         // IF RAM[KBD] == 0, jump to the ISNOTPRESSED LABEL, otherwise, turn the screen black

// Goal: Turn the screen black

// Outside of the loop:
// 1. Get the memory location of the screen -- store it as a variable because it will change in the loop
@SCREEN // A = LOCATION OF SCREEN
D = A   // D = LOCATION OF SCREEN
@screenmemory // A = LOCATION OF VARIABLE SCREENMEMORY
M = D // RAM[LOCATION OF VARIABLE SCREENMEMORY] = LOCATION OF SCREEN

(FILLLOOP)
// The condition: 
// 1. Make sure the memory location of the keyboard - the memory location of the screen is greater than 0
// 2. If it's greater than 0, continue with the loop
// 3. If it's less than or equal to 0, jump to main
@KBD // A = LOCATION OF KEYBOARD
D = A // D = LOCATION OF KEYBOARD
@screenmemory // A = LOCATION OF VARIABLE SCREENMEMORY
D = D-M // D = LOCATION OF KEYBOARD - VALUE OF LOCATION OF SCREEN MEMORY
@MAIN // A = MAIN
D,JEQ // JUMP TO MAIN IF D == 0

// The loop:
// 1. Set the memory location of the screen equal to 1
// 2. Increment the memory location of the screen by 1
// 3. JUMP TO FILLLOOP unconditionally
@screenmemory // A = LOCATION OF VARIABLE SCREENMEMORY
A = M         // A NOW EQUALS THE VALUE OF SCREENMEMORY
M = -1         // RAM[VALUEOFSCREENMEMORY] = 1 (black)
@screenmemory // A = LOCATION OF THE VARIABLE SCREENMEMORY
D = M         // D = VALUE OF VARIABLE SCREENMEMORY
D = D + 1     // INCREMENT D
M = D         // SET VALUE OF VARIABLE SCREENMEMORY TO D

@FILLLOOP     // A = FILLOOP
0, JMP        // JUMP UNCONDITIONALLY



(ISNOTPRESSED)
// Goal: Turn the screen white

// Outside of the loop:
// 1. Get the memory location of the screen -- store it as a variable because it will change in the loop
@SCREEN // A = LOCATION OF SCREEN
D = A   // D = LOCATION OF SCREEN
@screenmemory // A = LOCATION OF VARIABLE SCREENMEMORY
M = D // RAM[LOCATION OF VARIABLE SCREENMEMORY] = LOCATION OF SCREEN

(UNFILLLOOP)
// The condition: 
// 1. Make sure the memory location of the keyboard - the memory location of the screen is greater than 0
// 2. If it's greater than 0, continue with the loop
// 3. If it's less than or equal to 0, jump to main
@KBD // A = LOCATION OF KEYBOARD
D = A // D = LOCATION OF KEYBOARD
@screenmemory // A = LOCATION OF VARIABLE SCREENMEMORY
D = D-M // D = LOCATION OF KEYBOARD - VALUE OF LOCATION OF SCREEN MEMORY
@MAIN // A = MAIN
D,JEQ // JUMP TO MAIN IF D == 0

// The loop:
// 1. Set the memory location of the screen equal to 1
// 2. Increment the memory location of the screen by 1
// 3. JUMP TO FILLLOOP unconditionally
@screenmemory // A = LOCATION OF VARIABLE SCREENMEMORY
A = M         // A NOW EQUALS THE VALUE OF SCREENMEMORY
M = 0         // RAM[VALUEOFSCREENMEMORY] = 1 (black)
@screenmemory // A = LOCATION OF THE VARIABLE SCREENMEMORY
D = M         // D = VALUE OF VARIABLE SCREENMEMORY
D = D + 1     // INCREMENT D
M = D         // SET VALUE OF VARIABLE SCREENMEMORY TO D

@UNFILLLOOP     // A = FILLOOP
0, JMP        // JUMP UNCONDITIONALLY