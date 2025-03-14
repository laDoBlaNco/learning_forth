\ This example will be showing the process of combining simple command into more powerful ones.
\ I'll start of with some very simple 4th words that control the terminal screen, but first
\ I'll get acquainted with the mechanics of talking to 4th

\ here I print 15 spaces and then emit two *s

\ Let's define some words

( Large Letter F )
: star   42 emit ;
: margin   cr 30 spaces ;
: blip   margin star ;
: stars   0 do star loop ;  \ mmm this one is new 🤔
\ note how our wards are building up on one another. 
\ I don't have to type out what everything is doing cuz forth is very easy to understand whats happening
: bar   margin 5 stars ;
: f   bar blip bar blip blip cr ;
\ this is a quick example of how simple forth words can become a foundation fro more complex words. 
\ a 4th application, when listed, consists of a series of increasily powerful definitions rather than
\ a sequence of instructions to be executed in order as some of the weaker languages are. 😲

\ so compiling in 4th is simply adding my words into the dictionary

15 spaces star star cr

cr star cr star cr star

margin star margin star margin star cr

5 stars cr

35 stars cr

bar blip bar blip blip cr

f

\ DICTIONARY: If the text interpreter finds the colon it points it out to Execute who will take it to
\ be written into the dictionary. If all good the intepreter will tells us 'ok'. 
\ when a word isn't in the dictionary and isn't a number
\ xlerb xlerb ? \ if the interpreter can't find the word in the dictionary, he'll check to see if its a 
\ number. If its not recognized as a number he'll come back to us with a '?'
: greet   ." Hello, I speak 4th " cr ; 

greet

\ THE STACK: 4TH'S WORKSPACE FOR ARITHMETIC
\ In 4th there is only one central location where numbers are temporarily stored before being
\ operated on. That location is called 'the stack'. Nubmers are pushed onto the stack and then
\ operations work on the numbers on the stack.

3 4 + . cr

: four-more   4 + ;
3 four-more . cr

\ note the order of numbers coming off the stack LIFO
2 4 6 8 . . . . cr

\ 10 20 30 . . . . cr \ this gets us a stack underflow

\ we should always maintain track of the 'stack effects' or the glossary of our words.
\ something that tells us what our word needs from the stack and what it'll put back, if anything
\ majority of times words CONSUME data from the stack. to do this in a visual way, 4th programmers
\ conventionally use a special stack notation in their glossaries or tables of words. The 
\ basic form is 
( before -- after ) 
\ The -- separates the things that should be on the stack before we execute from the things that
\ will be left on the stack afterwards. The following for example shows that one number is expected
( n -- ) 
\ and leaves no number on the stack after. Or the following that takes 2 numbers
( n1 n2 -- sum ) 
\ if there is more than 1 n, we number them. Note: stack position is noted by the ORDER not the numbers
\ The rightmost number is on top of the stack, so above the n2 is on top

\ CHAPTER SUMMARY
\ 4th words I've learned so far with the stack notation (n is number and c is char)
\ :xxx yyy; ( -- ) Creats a new definition named xxx consisting of word(s) yyy
\ cr  ( -- ) outputs a newline
\ spaces  ( n -- ) Prints the given number of blank spaces at the terminal. that number comes from the stack
\ emit ( c -- )  Transmits a character to the output device (ascii char code)
\ ." xxx " ( -- ) Prints the character string xxx at the terminal. The " character finishes the string
\ +  (n1 n2 -- n3 ) Adds n1 + n2
\ .  (n -- )  pops and prints a number followed by one space

\ Review of Terms

\ Compile - to generate a dictionary entry in computer memory from source text (the written out form of a 
\           definition) Distinct from 'execute'
\ Dictionary - in 4th, the list of words and definitions including both 'system' and 'user' definitions
\              A dictionary resides in computer memory in compiled form
\ Execute - to perform. Specifically to execute a word is to perform the operations specified in the 
\           compiled definition of the word
\ Extensiblity - a characteristic of a computer language which allows a programmer to add new features or
\                modify existing ones
\ Glossary - a list of words defined in 4th, showing their stack effects and an explanation of what they
\            do, which serves as a reference for programmers
\ Infix Notation - the method of writing operators in between the operands they affect, as in '2 + 5'
\ Input Stream - the text  to be read by the text interpreter. This may be text that I've just typed
\                in at the terminal, or it may be text that is stored on disk
\ Interpret - (when referring to 4ths text interpreter) to read the input stream, then to find each word
\             in the dictionary or failing that, to convert it to a number. 
\ LIFO - (last-in, first-out) the type of stack which 4th uses. A can of tennis balls is a LIFO struture;
\        the last ball I drop in is the one that I must remove first
\ Post-fix Notation - the method of writing operators after the operands they affect (reverse polish noation, rpn)
\                     as in '2 5 +' for '2 + 5'
\ Stack - in 4th, a region of memory which is controlled in such a way that data can be stored or removed
\         in a last-in, first-out (LIFO) fashion
\ Stack Overflow - the error condition that occurs when the entire area of memory allowed for the stack
\                  is completely filled with data.
\ Stack Underflow - the error condition that occurs when an operation expects a value on the stack, but
\                   there is no valid data on the stack
\ Word - in 4th, the name of a definition

\ PROBLEMS
\ note: Every : needs a ;
\       Every ." needs a "

\ #1 - Define a word called gift which, when executed, will type out the name of some gift. 
: gift   ." Booty! " ;
\ now define a word called 'giver' which will print out a person's first name. 
: giver ." Odalis " ;
\ and finally 'thanks' which will use both gift and giver to print out a message
: thanks ." Dear " giver ." thanks for the " gift ." ." ;
thanks cr

\ #2 - Define a word call ten.less which takes a nubmer on the from the stack, subtracts ten,
\      and then returns the answer on the stack (I can ue +)
: ten.less ( n -- n-10 )  10 - ;
76 ten.less . cr

\ #3 - After entering the words in problem 1, enter a new definition for giver to print someone
\      else's name, then execute thanks again. Can I explain they thanks still prints out the first
\      giver's name? Because the first 'giver' is part of the compiled thanks definition. it won't change
: giver ." Juana " ;
cr thanks cr








bye
