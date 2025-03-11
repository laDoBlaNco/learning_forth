\ KEYBOARD INPUT
\ 4th has a special word 'key', which is used for accepting keyboard input. When the 'key' word
\ is executed, execution is paused until a key is pressed. Once a key is pressed, the key  code
\ is pushed onto the stack

key . key . key . \ there is something in vscode that is using the first

\ PRINT KEYS WITH BEGIN UNITL
\ 4th has another kind of loop called begin until. This works like a while loop in C. Everytime
\ the word until is hit, the interpreter checks to see if the top of the stack is non-zero (true)
\ if it is, it jumps back to the matching begin. if not execution continues.

: print-keycode   begin key dup . 32 = until ;
print-keycode 

\ 'key' waits for key input, then dup duplicates the keycode from 'key'. We then use . to output
\ teh top copy of the keycode and 32 = to check to see if the keycode is equal to 32. If so we
\ break the loop

bye