\ the syntax of 4th is extremely straightforward. 4th code is interpreted as a series of 
\ space delimited words. almost all non-whitespace characters are valid in words. When the 
\ 4th interpreter reads a word, it checks to see if a definition exists in an interal 
\ structure known as the dictionary. If it is found, that definition is executed. otherwise
\ the word is assumed to be a number, and it is pushed onto the stack. If the word cannot be 
\ converted to a number, an error occurs.

\ foo ( this gives me an error - Undefined word )

( we create our own definition for a word using : and ; to start and end the definition )
( : is or way of telling 4th that we want to create a def. The first word after the : becomes )
( the definitions name, the rest of the words until the ; make up the body of the definition )
( It's convention to include 2 spaces between the name and the 'sed' - stack effect diagram )
( if there is no sed then its 3 spaces. )
: foo 100 + ;
1000 foo .s
foo foo foo cr .s

\ a common mistake is to forget the space before the ;. 

bye

