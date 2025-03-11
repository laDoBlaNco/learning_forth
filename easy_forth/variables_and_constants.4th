\ variables_and_constants.4th

\ 4th also allows me to save values in vars and consts. Vars all me to keep track of changing
\ values without having to store them on the stack. Constants give me a simple way to refer
\ to a value that won't change

\ VARIBALES
\ Because the role of local vars is generally played by the stack vars in 4th are used more
\ to store state that may be needed across multiple words. 
\ defining a var is as simple as ' variable balance ' 🤔

\ Basically I'm associating a particular memory address location with the name balance. balance 
\ is now a word, and all it does is push its memory location onto the stack. 
\ So the key is the word 'variable', that's the magic function
variable balance
balance . cr \ I see what I believe is a memory address which depends on the forth impelmentation
\ with gforth it looks like it's random
\ I then use '!' to store a value at that specific memory address
123 balance !
\ I pushed 123 on the stack and then pushed the memory address on the stack with balance. Then with !
\ I popped the top two items, putting the 2 item into the first (memory location). 
.s cr
\ now nothing is on the stack
balance @ .s cr
\ But with @ I get the value from that memory location pushing it back onto the stack
\ so now I have that value on my stack top

\ As I thought this is basically the 4th version of pointers with 'variable', '!', and '@' being
\ the words to reference and dereference my 4th pointers

\ '?' is defined as '@ .' so it'll dereference and pop the value of a variable. The world +!
\ is used to increase the value of a var bye a certain amount (maybe a counter of sorts) like += in C
clearstack

123 balance !
balance ?  \ push my address back on the stack and get the current value with ?
\ the above is pushing the memory location and popping off the value from the var just to show it to me
\ but the value remains in that memory location
cr balance ? cr

50 balance +! \ then I push a value on the stack and then the memory location and with +! I do a +=
\ to that value in the memory location
balance ? cr \ 🤯 I'm seeing how this is like assembly
clearstack


\ CONSTANTS
\ If I have a value that doesn't change I can store it as a constant. Constant are defined in
\ one line:  42 constant answer (with 'constant' being the word, as variable was before)

42 constant answer
2 answer * .s cr

\ can I think the constant answer??? 🤔
69 constant answer
2 answer * .s cr
\ it does allow it, but with a warning. that works.


bye