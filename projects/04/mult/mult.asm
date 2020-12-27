// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// PSEUDO CODE (high level):
//      let product = 0;
//      let repetition = r0
//      let addnumber = r1
//      for(int i = 0; i < repetition; i++) {
//          product += addnumber;    
//}
//      r2 = product
// Put your code here.

@product // variable product
M=0      // sets product to 0
// Now we need to set the repetition variable to the r0 register
@R0
D=M
@repetition
M=D

// Now we need to set the addnumber variable to the r1 register
@R1
D=M
@addnumber
M=D

(LOOP)
// Make sure the repetition variable is not equal to zero, if it is, jump to end
@repetition
D=M
@PREEND
D;JEQ

// Now, add the addnumber variable to the product variable
@addnumber
D=M

@product
M = D + M

@repetition
M = M - 1

@LOOP
0;JMP
(PREEND)

@product
D = M

@R2
M = D

(END)
@END
0;JMP