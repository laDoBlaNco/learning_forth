\ ARRAYS
\ 4th doesn't exatly support arrays, but it does allow me to allocate a zone of contigous
\ memory a lot like arrays in C would work. To allocate this memory I use 'allot'

variable numbers \ get a random memory location
3 cells allot \ I guess I'm pushing 3 on the stack to tell 'cells' how many blocks of memory to allocate
\ cells = memory cells the 3 cells allot gives us 4 cells, 1 original plus 3 extra from 'cells'. cells 
\ just multiplies by the cell width, much like pointer arithmetic in C
10 numbers 0 cells + !
20 numbers 1 cells + !
30 numbers 2 cells + !
40 numbers 3 cells + ! \ we push 40 on the stack then 'numbers 3 cells +' gives me the 4th cell in the array
\ with ! we store our 40 on that cell of the array

.s cr \ there is nothing on the stack at this point becasue its all in that memory allocated

\ typically I would create words to simplify the array access specific to my arrays
variable numbers2
3 cells allot
: number  ( offset -- addr ) cells numbers2 + ;
10 0 number !
20 1 number !
30 2 number !
40 3 number !
cr
2 number ? cr \ 2 number gets me that address and ? gives me the value in that address or index

\ number taks an offset into numbers2 and returns the memory address at that offset (index). 30 2
\ number ! stores 30 at offset (index) 2 in numbers2, and 2 number ? prints the value at offset (index)
\ 2 in numbers2



bye