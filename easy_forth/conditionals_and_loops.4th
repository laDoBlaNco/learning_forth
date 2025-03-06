\ conditionals_and_loops.4th

\ Now for the fun stuff, por fin! 4th like most other languages, has conditionals and loops for 
\ controlling the flow of my program. To understand how they work, however, I first need to understand
\ bools in 4th.

\ Booleans
\ There's actually no boolean type in 4th. The number 0 is treated as false and any other number
\ is true, although the canonical true value is -1 (all boolean operators return 0 or -1)
3 4 = . cr 
5 5 = . cr \ notice we use = and not == in 4th

\ I can use < and > for less than and greater than. The work pretty much as expected, but just 
\ like - its kinda backwards from a stack perspective, but in the end makes sense visually
\ < and > just like - and / treats the 2nd from the top of the stack as the first number in the
\ left to right normal math equation. So 3 4 < gives us what we would expect from 3 < 4
cr
3 4 < . cr
3 4 > . cr \ remembering that 0 is false and -1 is true

\ the normal bool operations 'and', 'or', and 'not' are actually 'and', 'or', and 'invert' 
cr 
3 4 < 20 30 < and . cr \ looks complicated but again in rpn its natural. true -1 true -1 then true -1
3 4 < 20 30 > or . cr \ true -1 false 0 then true -1
3 4 < invert . cr \ true -1 then invert to false 0
\ NOTE: these are all  bitwise operators. They give correct results for 0 and -1 but anything else
\ they will not.

cr
\ if then
\ Now we can finally get into conditionals. Conditionals in 4th CAN ONLY BE USED INSIDE DEFINITIONS
\ The simplest conditional statement in 4th is if then, which is equivalent to a standard if statement
\ in most languages. Below we are also using modulus 'mod' which gives the remainder.
\ If the top stack number 
\ : buzz? 5 mod 0 = if ." Buzz" then ;
\ 3 buzz? cr \ nothing
\ 4 buzz? cr \ nothing
\ 5 buzz? cr \ Buzz
\ its very strange but important to note that the 'then' word marks the end of the if statement in 4th.
\ much like fi in bash or end in lua. Also, if consumes the top value on the stack when it checks
\ to see if its true or false. This is why I don't need to pop anything as its popping the number
\ from the stack when checking. If I want it to remain I would need to use 'dup'

cr
\ if else then
\ if else then is equivalent to an if/else statement in most languages. 
: is-it-zero? 0 = if ." Yes!" else ." No!" then ;
0 is-it-zero? cr
1 is-it-zero? cr
2 is-it-zero? cr

\ do loop
\ in 4th most closely resembles a for loop in most c-based languages. In the body of the do loop
\ the special word i pushes the current loop index onto the stack
\ So i pushes an index onto the stack and then the do loop pops it off to compare so it knows where its
\ at 🤯🤯🤯
: loop-test   10 0 do i . loop ;  \ note it looks backwards but top of the stack is 0 it gets popped 
\ and compared to 2nd and if hasn't reached then i pushes a next index onto the stack to compare??? I think
cr loop-test cr \ so what's the . for here. Maybe thats where it pops it off. No magic here. i pushes and
\ . pops for the comparison.
\ The above is roughly the same as for (int i=0;i<10;i++) {print(i)} 

\ Fizz Buzz
\ I can now write the classic Fizz Buzz algorithm using the do loop. Let's see if I can understand it.
: fizz?   3 mod 0 = dup if ." Fizz" then ; \ 
: buzz?   5 mod 0 = dup if ." Buzz" then ; \
: fizz-buzz?   dup fizz? swap buzz? or invert ;
: do-fizz-buzz 26 1 do cr i fizz-buzz? if i . then loop ;
do-fizz-buzz cr

\ fizz? checks to see if the top of the stack is divisible by 3. It then uses dup to duplicate
\ the result. The top copy of teh value is consumed by the if. The second copy is left on the stack
\ and acts as the return value of fizz? This works cuz its left in the stack and then popped off 
\ in our do loop 🤯🤯🤯
\ if the number on top of the stack is divislbe by 3 the string Fizz will be output, otherwise 
\ no output. 

\ buzz? does the same thing but with 5 and outputs the string 'Buzz'

\ fizz-buzz? calls dup to duplicate the valueo on top of the stack, then calls fizz? converting
\ the top copy into a boolean. After this th top of the stack consists of the original value
\ and the boolean returned by fizz?. That's why we use swap to swap them out so the original top-of-stack
\ value is back on top, and the boolean is underneath. Next we call buzz? which replaces the top-of-stack
\ value with a boolean flag. Now the top two values on the stack are booleans representing whether
\ the number was divisible by 3 or 5. After this we call 'or' to see if either of these is true,
\ and invert to negate this value. Logically, the body o fizz-buzz? is equal to !(x%3==0 || x%5==0)

\ so fizz-buzz? returns a bool indicating if the argument is not divisible by 3 or 5 and thus should
\ be printed. Finally do-fizz-buzz loops from 1 to 25, calling fizz_buzz? on i and outputting i
\ if fizz-buzz? returns true

\ here I can see step by step whats happening in fizz-buzz?
cr
4 .s cr
dup .s cr
fizz? .s cr  \ nothing is printed here
swap .s cr
buzz? .s cr \ nothing is printed here
or .s cr
invert .s cr clearstack \ since this is -1 true the number is printed

\ remember the final value on the stack is the return value of the fizz-buzz? word. In this 
\ case, it's true, because the number was not divisble by 3 or 5 and so SHOULD be printed. 
\ In the case above -1 is the return result and consumed by 'if i . then' so since -1 is true
\ i pushes the current index back on the stack and then . pops it off to return. If i didn't
\ do that would we need to dup it somehow???

\ now let's see it with a matching number 5
cr
5 .s cr
dup .s cr
fizz? .s cr \ nothing printed here
swap .s cr
buzz? .s cr \ buzz is printed out here
or .s cr
invert .s cr  \ since its 0 false the number isn't printed out.





bye