\ stack_manip.4th

\ Now I'll look at some 4th predefined words. 

\ dup ( n -- n n )
\ duplicate - duplicates teh top element of the stack
1 2 3 dup cr .s

\ drop ( n -- )
\ simply drops the top element of the stack
drop drop cr .s 

\ swap ( n1 n2 -- n2 n1 )
\ swaps the top two elements of the stack
3 4 swap cr .s 

\ 2swap ( n1  n2 n3 n4 -- n3 n4 n1 n2 )
\ I'm testing this based on some other site I saw, it swaps first 2 elements with the 2nd 2 elements 
\ Instead of writing this definition for each 2test I'm assuming 2words do similar actions
2swap cr .s clearstack

\ over ( n1 n2 -- n1 n2 n1 )
\ it takes the second element from the top of the stack and duplicates it ot the top of the
\ stack
1 2 3 over cr .s clearstack
1 2 3 4 2over cr .s clearstack

\ rot ( n1 n2 n3 -- n2 n3 n1 )
\ -rot ( n1 n2 n3 -- n3 n1 n2 )
\ 2rot ( n1 n2 n3 n4 n5 n6 -- n3 n4 n5 n6 n1 n2)
\ rotates the top 3 elements of the stack. The third element from the top of the stack gets moved
\ to the top of the stack pushing the other two elements down. The -rot does the opposite, moving
\ the top item on the stack to the 3rd position pusing the  2nd and 3rd up.
\ assuming 2rot does as expected
1 2 3 rot cr .s clearstack
1 2 3 -rot cr .s clearstack
1 2 3 4 5 6 2rot cr .s clearstack

\ nip ( n1 n2 n3 -- n1 n3 )
\ 2nip ( n1 n2 n3 n4 n5 n6 -- n1 n2 n5 n6 )
1 2 3 nip cr .s clearstack
1 2 3 4 5 6 2nip cr .s clearstack \ wow very predictable 🤯





bye