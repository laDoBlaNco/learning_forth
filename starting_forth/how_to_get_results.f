\ the 4 simplest integer-arithmetic operators in 4th
\ + ( n1 n2 -- sum ) adds
\ - ( n1 n2 -- diff ) subtracts (n1 - n2)
\ * ( n1 n2 -- prod ) multiplies
\ / ( n1 n2 -- quot ) divides (n1/n2)

\ all of the operators work the same as we saw addition:
17 5 + . cr
7 8 * . cr
\ when dealing with operands and the order matters, just remember rpn or postfix notation is
\ just moving the  operator to the end. The order is the same as traditional arithmetics
500 300 - . cr  \ same as 500 - 30
20 4 / . cr \ same as 20/4

\ Note to the reader: These operators  are INTERGER OPERATORS. So we can only use integers and we
\ can only get integer results. 
cr 10.00 2.25 + . cr \ I don't even know how it got 225 from this 🤔
21 4 / . cr  \ and this gets 5, the decimal is truncated as expected
\ for now no numbers larger than 2147483647 or lower than -2147483648 (single-length numbers)
\ when reviewing stack effects the 'n' represents specifically single length numbers. Later
\ I'll see 'd' for double-length'

\ So just like other forth logic it makes sense. I give forth the operator so it knows what its doing
\ for example / division. Then the next number on the stack tells 4th that its going to divide into 
\ that many parts, as in 4, and then the next number ont he stack is what will be divided into 4 parts.
\ So this falls rigth in line wwith understanding more complex expressions like 4 + (17 * 12)
17 12 * 4 + . cr 
17 20 + 132 + 3 + 9 + . cr
3 9 + 4 6 + * . cr


\ Definitions with math
\ since I know 1 yard = 36 in and 1 foot = 12 in, I can do the following
: yards>in ( n 36 -- n*36 ) 36 * ;
: ft>n ( n 12 -- n*12 ) 12 * ;

cr 10 yards>in . cr
2 ft>n . cr

\ or if we are looking for only inches we could create words that reflect the same. meaning in our
\ defs we only convert what needs to be converted, but we are consistent with the naming, even if
\ nothing is happening
: yards  ( yards -- inches ) 36 * ;
: feet  ( feet -- inches ) 12 * ;
: inches  ( inches -- inches )  ; \ note that we didnt' do anything cuz the expectation is that they are already inches
cr 10 yards 2 feet + 9 inches + . cr

\ we can get fancy and add the following more specific to the dictionary to be grammatically correct
: yard   yards ;
: foot   feet ;
: inch   ; 

\ now plural and singular work as expected
cr 1 yard 2 feet + 1 inch + . cr
2 yards 1 foot + . cr

\ we can also do multiple operations in multiple ways and get the same result. Whatever makes sense
cr 17 20 + 132 + 3 + 9 + . cr
17 20 132 3 9 + + + + . cr

\ so we could define then
: 5#sum + + + + ;
17 20 132 3 9 5#sum . cr

\ something I'm noting. the definition really depends on the problem and it makes sense in my head.
\ Like a word problem:
\ this probably doesn't make sense, until you know what the problem is : flight-distance   + * ; 🤔

\ If a jet plane flies at an average air speed of 600 mph and if it flies with a tail wind of 25mph, 
\ how far will it travel in five hours? Now it makes sense
: flight-distance   + * ;
cr 5 600 25 flight-distance . cr 

\ DEFINITION STYLE PRACTICE PROBLEMS - this time the letters don't matter cuz the defs are just operator order
\ ORDER MATTERS
: prob#1   ( b a c -- result ) 4 * -  6 / + ;
: prob#2   ( b a -- result ) 8 * / ;
: prob#3   ( a b -- result ) * 2 / 100 / ;
: prob#4   ( a a -- result ) 2 * 3 + * ;
: prob#5   ( a b c -- result ) - / ; \ the book says this is impossible without stack manipulation
\ but it doesn't seem that way. a - b is first a b - and then divide that by c a b - c / 🤔🤔🤔???

\ Now I'll look at division and mod for the remainder
cr 22 4 / . cr \ we just get the quotient not the remainder here
\ Note: there are times when we'll want just the quotient, or just the remainder or both
\ so we have /, mod, and /mod
\ /mod  ( n1 n2 -- rem quot ) divides; returns remainder and quotient (in that order. When you pop them off
\                            they'll be in the expected order of quot rem)
\ mod  ( n1 n2 -- rem )  divides; returns remainder only to stack
22 4 /mod . . cr \ with that we can define a word to resolve the following word problem
\ "how many dollar bills can I get in exchange for 22 quarters?"
: quarters   4 /mod . ." ones and " . ." quarters " ;
cr 22 quarters cr

\ or if we just want the remainder
22 4  mod . cr

\ STACK MANEUVERS
\ first we'll look at swap, then figure out why the book says that prob#5 couldn't be done above🤔
cr
1 2 . . cr
1 2 swap . . cr
10 4 - 2 / . cr \ it works fine. There must be some error somewhere in editing the book
2 10 4 - swap / . cr \ I guess its saying if the numbers were on the like c a b instead of a b c
\ then we would need swap, but that's not how the problem was presented. 

cr
\ here are some stack manip words:
\ swap  ( n1 n2 -- n2 n1 )  reverses the top two stack items
1 2 .s swap .s drop drop
\ dup  ( n -- n n ) duplicates the top stack item
1 .s dup .s drop drop
\ over ( n1 n2 -- n1 n2 n1 ) copies second item on stack to the top
1 2 .s over .s drop drop drop
\ rot ( n1 n2 n3 -- n2 n3 n1 ) rotates the third item to the top
1 2 3 .s rot .s drop drop drop
\ drop ( n -- ) discards the top stack item
1 .s drop .s 

\ A HANDY HINT: A NON-DESTRUCTIVE STACK PRINT
\ A lot of times I'll want to see whats on the stack, with all those dots and flushing it out
\ for this we have .s which prints out the stack 'non-destructively'
cr 
.s
1 2 3 .s
rot .s drop drop drop

cr
\ Stack Manipulation and Math Definitions
\ 1. write a phrase that flips three items on the stack, leaving the middle number in the middle:
: flip  ( n1 n2 n3 -- n3 n2 n1 ) swap rot ;
1 2 3 .s flip .s drop drop drop cr

\ 2. write a phrase that does what over does without using over
: no-over  ( n1 n2 -- n1 n2 n1 ) swap dup rot rot ;
1 2 .s no-over .s drop drop drop cr

\ 3. write a definition called -rot which rotates the top 3 stacks in the opposite
\ direction. There is already one of these, so I guess I'll just figure out how it works
1 2 3 .s -rot .s drop drop drop
1 2 3 rot rot .s drop drop drop cr \ just rotating twice does the same thing.

: -myrot  ( n1 n2 n3 -- n3 n1 n2 ) rot rot ;
1 2 3 .s -myrot .s drop drop drop cr

\ PLAYING DOUBLES
\ so the next 4 manipulation words are familiar but they work in 2s o sea the double the targets consumed
\ by th previous words
\ 2swap   ( d1 d2 -- d2 d1 )  -  reverses the top two paris of numbers
1 2 3 4 2swap .s drop drop drop drop

\ 2dup  ( d d -- d d d d )  - Duplicates the top pair of numbers
1 2 3 4 2dup .s drop drop drop drop drop drop

\ 2over  (d1 d2 d3 d4 -- d1 d2 d3 d4 d1 d2 ) - duplicates the second pair of numbers to the top of the stack
1 2 3 4 2over .s drop drop drop drop drop drop

\ 2drop  (d1 d2 d3 d4 -- d1 d2 ) - discards the top pair of numbers
1 2 3 4 2drop .s 2drop

\ so the prefix '2' indicates that these stack manipulation operators handle  numbers in pairs
\ The letter 'd' in the stack effects column stands for 'double'. 'dobule' has a special significance
\ that I'll learn a bit later when I get to 'n' and 'u'

\ The '2' manipulators listed above are so straightforward I'm not going to go into examples 
\ more to come


\ SUMMARY:
\ Review of Terms:
\ Double-length numbers - integers which encompass a range of over:
\ -18446744073709551615 to +18446744073709551615 (I'll officially see these in chapter 7)

\ Single-length numbers - fall within the range of -2 billion to +2 billion: The only numbers
\ which are valid as the arguments or results of any of th e operators I've seen so far.


\ PROBLEMS CHAPTER 2
\ 1. What's the difference between dup dup and dup 2? 
\   Dup dup always works on the first item on the stack, 2dup works on the top two items on stack
1 2 3 4 5 dup dup .s \ dups 5 twice, never gets to the 2nd item (4)
4drop 3drop
1 2 3 4 5 2dup .s \ dups the 2st and  2nd item which is the 4 and the 5
4drop 3drop .s cr

\ 2. Write a phrase which will reverse the order of the top four items on the stack
\    ( 1 2 3 4 -- 4 3 2 1 ) 
: rev4    swap 2swap swap ;
1 2 3 4 rev4 .s
4drop cr

\ 3. Write a definition '3dup' which will duplicate the top three numbers on the stack
\    (1 2 3 -- 1 2 3 1 2 3 )
: my-3dup   dup 2over rot ;
1 2 3 my-3dup .s
4drop 2drop cr cr

.( Problem #4a )
: prob4a  ( c a b -- res )
   \ when the formula is a**2+ab+c
   swap dup dup * -rot * + + ;

cr
4 5 6 prob4a .
4 5 6 .s
swap .s
dup dup .s 
* .s 
-rot .s 
* .s 
+ .s cr
+ . cr cr

.( Problem 4b:) cr
: prob4b ( a b -- res ) 
   \ when the formula is (a-b)/(a=b)
   2dup - -rot + / ;

10 5 prob4b .
10 5 .s
2dup .s 
- .s 
-rot .s 
+ .s 
/ cr
. cr cr

.( Problem #5:) cr
: convicted-of ( -- 0 ) 0 ;
: homocide ( n -- n+20) 20 + ;
: arson ( n -- n+10) 10 + ;
: bookmaking ( n -- n+2) 2 + ;
: tax-evasion ( n -- n+5) 5 + ;
: will-serve ( n -- ) ." He or she will serve " . ." years." ;

convicted-of arson tax-evasion will-serve cr 
convicted-of .s
arson .s 
tax-evasion .s cr
will-serve cr cr

.( Problem #6:) cr
: egg-cartons  ( n -- ) 
   \ if given a number of eggs I need to print the number of cartons filled
   \ and the remainder as well if any
   12 /mod ." We can fill " . ." cartons, with " . ." eggs left over." ;

56 egg-cartons cr
56 .s 
cr egg-cartons .s
cr








bye
