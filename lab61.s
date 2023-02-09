.text
.global _start
.extern printf

_start:
LDR x3, =a
LDR x3, [x3]
LDR x2, =b1
LDR x2, [x2]
LDR x0, =String
ADD x1, x2, x3
CMP x1, #4
B.NE Next
MOV x1, #13
BL printf
B Exit
Next:
MOV x1, #-12
BL printf
Exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
String: .ascii "Value of c is: %d\n"
a: .dword 4
b1: .dword 0
c: .dword 28 
.end
