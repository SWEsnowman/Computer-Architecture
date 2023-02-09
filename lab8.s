.text
.global _start
.extern printf

_start:
LDR x2, =P
LDR x3, [x2, #8]
LDR x2, [x2]
LDR x4, =C
LDR x5, [x4, #8]
MOV x1, x5
LDR x4, [x4]
LDR x6, =Radius
LDR x6, [x6]
MUL x6, x6, x6
SUB x2, x2, x4
SUB x3, x3, x5
MUL x2, x2, x2
MUL x3, x3, x3
ADD x1, x2, x3
CMP x1, x6
B.GE Out
LDR x0, =yes
BL printf
B Exit
Out: 
LDR x0, =no
BL printf
Exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
P: .quad 1, 0
C: .quad 2, 3
Radius: .quad 3
yes: .string "P is inside the circle. \n"
no: .string "P is outside the circle. \n"
.end
