.text
.extern printf
.global _start

_start:
.global max
max:

LDR x2, =array
LDR x1, [x2]
LDR x4, =length
LDR x4, [x4]
LDR x0, =string
BL Func
BL printf
B Exit

.func Func
Func:
SUB SP,SP,#16
STR LR, [SP,#8]
STR x3, [SP,#0]
CMP x4, #1
B.GE Next
B End
Next:
SUB x4, x4, #1
LSL x5, x4, #3
ADD x3, x5, x2
LDR x3, [x3]
BL Func
CMP x3, x1
B.LT End 
MOV x1, x3
End:
LDR x3, [SP,#0]
LDR LR, [SP,#8]
ADD SP, SP, #16
BR LR
.endfunc
Exit:
MOV w0, #0
MOV w8, #93
SVC #0

.data
string:
.ascii "Max: %d\n"
array: 
.dword 1,3,4,2,6,10,11,3,7,9
length: 
.dword 10
.end
