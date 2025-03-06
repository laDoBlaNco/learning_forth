\ Adding some numbers

\ The thing that separates forth from most other languages is its use of the stack. In forth
\ everything revolves around the stack. Any time I type a number, it gets pushed onto the 
\ stack. If I want to add two numbers together, typing + takes the top two numbers off the 
\ stack, adds them, and puts the result back on the stack


1
2
3
.s cr 
( now if we type + we get the top items off the stack which are the last 2 added)
( and that result is pushed back on the stack)
+
.s cr

\ if we type + again we now take the top 2 again which are now 1 5 and get the result 6
\ put on the stack
+
. cr \ here we . pop  instead of .s displaying the stack

\ this will give us a stack underflow (rather than overflow) meaning we are trying to
\ off the stack when we don't have anything.
\ +

\ we can also put everything on one line delimited with spaces
123 456 + . cr

\ This is referred to as reverse polish notation (rpn) and is actually more natural than 
\ what we learn in school. Evaluation is determined by the order, so we are basically 
\ evaluating real-time and the computer has the data before knowing what to do rather than
\ the other way around as we do normally. 1 + 1 vs 1 1 +
\ 10 * (5 + 2) would be this:;
5 2 + 10 * . cr
\ or
10 5 2 + * . cr

\ Stack Effects - are basically the comment notation of what a stack word will do to the stack
\ Some words take values off the stack, some leave new values on the stack, and some do a mixture
\ of both. These 'stack effects' are commonly represented using comments in the form ( before -- after )
\ For example, + is ( n1 n2 -- sum ) or ( n n -- n+n ) 

bye