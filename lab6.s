.text
.global _start
.extern printf

_start:
LDR x3, =i
LDR x3, [x3]
LDR x2, =g
LDR x2, [x2]
LDR x0, =String
MOV x1, #4
CMP x1, x3
B.NE Next
ADD x1, x2, #12
BL printf
b exit

Next:
SUB x1, x2, #24
BL printf

exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
String: .ascii "Value of f is: %d\n"
i: .dword 5
f: .dword 0
g: .dword 28 
.end
