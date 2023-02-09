.text
.extern scanf
.extern printf
.global _start

_start:
LDR x0, =input
LDR x1, =query
BL scanf
LDR x18, =query
LDR x18, [x18,#0]
LDR x19, =array
MOV x21, #0
LDR x22, =length
LDR x22, [x22]
BL Search
LSL x26, x21, #3
ADD x26, x26, x19
LDR x26, [x26]
CMP x26,x18
B.EQ Print
LSL x26, x22, #3
ADD x26, x26, x19
LDR x26, [x26]
CMP x26, x18
B.EQ Print1
LDR x0, =string
MOV x1, #-1
BL printf
B Exit
Print: LDR x0, =string
MOV x1,x21 
BL printf
B Exit
Print1: LDR x0, =string
MOV x1, x22
BL printf
B Exit


Search: MOV x26, x22
CMP x26, x21
B.LE Jump
ADD x23, x21,x22
LSR x23, x23, #1
LSL x24, x23, #3
ADD x24, x24, x19
LDR x25,[x24,#0]
CMP x25, x18
B.LT High
MOV x22, x23
B Search
High: ADD x23, x23, #1
MOV x21, x23
B Search
Jump: BR LR
Exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
input: .string "%ld"
query: .dword 0
array: .dword 1,2,4,5,7,8,9,10,13,15,17,18
length: .dword 12
string: .ascii "The value is in the index %d\n"


.end
