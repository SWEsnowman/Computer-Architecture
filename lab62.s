.text
.global _start
.extern printf

_start:
LDR x2, =i
LDR x2, [x2]
MOV x1, #0
LDR x0, =String
Loop: 
CMP x2, #11
B.GE Next
ADD x1, x1, x2
ADD x2, x2, #1
B Loop
Next:
BL printf
Exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
String: .ascii "The sum is: %d\n"
i: .dword 1
.end
