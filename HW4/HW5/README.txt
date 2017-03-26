

Author : Raleigh Foster



I wrote this compiler without any teammates.


I wanted teammates, but nobody would work with me :/



My compiler fully implements all of the fundamental features of Quack.
I made it to the end, and didn't get stuck on anything.

In doing this, however, I skipped various things which I thought were not essential.


For instance, I do not implement an Equals method which works on all types.

I do not have every single case filled out when I do code generation.
For instance, I did not fully implement elifs (I do up to code gen, then give up on it). This was not because they were hard, but because I ran out of time.

I never failed to implement something because I was fundamentally not set up to do it,
and the test examples are not particularly designed around any shortcomings in the implementation (except for not having ==, and I also didn't include True and False literals)

For instance, I have heard of people having trouble with their abstract syntax tree and not being able to typecheck nested expressions and control flow.

I have not had this problem, and my code generation and typechecking (such that it is) both appear to be robust to simply adding complexity to the code.


Similarly, there were a lot of cases that I did not implement in the typechecker.

Because I typecheck first, and then run the program, and don't want to cause the program to crash due to issues with the typechecker, I mostly (but not entirely) turned off typechecking for this assignment.



I also have a lot of dead code that was for features that are mostly implemented, usually in the typechecker, but then just never made it into the final version.



I improved and expanded type inference in the final version, but otherwise error reporting has not been further developed since the last assignment.

Please take a look at the previous homework for my error reporting functionality.

I can detect violations of covariance and contravariance,
variables not initialized in all paths, etc.





Please let me know if you have any questions.

My code is an Escher infinite train wreck, and I wouldn't be surprised if there are bugs,
but actually, the compiler has worked a lot better than I would have expected for something produced by this process (not a high bar perhaps).

Usually the first time I tested features they worked perfectly as I added them, with any level of complexity.

In no case did I find an issue with the compiler and then conveniently not include that test case.
Every test case I considered worked, although this didn't include ones that would fail for known reasons of missing features like the ones listed above.


