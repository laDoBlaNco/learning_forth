\ generating_output.4th
\ The following are examples of words that output to the console.
: cs   clearstack ;

\ . ( n -- ) (period)
\ The simplest output word in 4th is '.'. I can use . to output the top of the stack in the 
\ output of the current line. 
1 . 2 . 3 . 4 5 6 . . . cr cs \ note that 4 5 6 prints 6 5 4 as its LIFO

\ emit ( c -- )
\ can be used to output numbers as ascii chars. Just like . outputs the number at the top
\ of the stack, meaning that it pops the number and then displays as an ascii char.
\ no spaces are added
33 119 111 87 emit emit emit emit cr cs

87 emit 111 emit 119 emit 33 emit cr cs \ this also works, but note the order since we are 
\ emitting realtime

\ cr ( -- ) 
\ this is short for carriage return and it simply outputs a newline. I've used in all these examples
cr 100 . cr 200 . cr 300 . cr cs

\ ." ( -- )
\ Finally I have ." which is a special word for outputting strings. The ." word works differently 
\ inside definitions to interactive mode. ." marks the beginning of a string to output, and the
\ end of the string is marked by ". The closing " isn't a word, and so it doesn't need to have a 
\ space before it.
: say-hello ." Hello there!" ;
say-hello cr cs 

\ Now that I understand this next example, I see its interpolation in 4th, using a combination of 
\ ." . cr and emit to build up (concatenate or interpolate) a string
: print-stack-top   cr dup ." The top of the stack is " .
  cr ." which looks like '" dup emit ." ' in ascii " ;
\ here we have a cr then we duplicate the top of the stack and use the next . to pop it for use
\ but leave a copy on the stack. Then we cr another string and through another dup but with
\ emit so we can pop off the top and output it as its ascii char, again leaving a copy on the
\ stack. 
65 print-stack-top cr .s cs \ note the 65 is still on the stack.




bye