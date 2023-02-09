.text
.extern printf
.global _start

_start:
.global midpoint
LDR x0, =string
LDR x20, =a
LDR d20, [x20]
LDR x21, =b
LDR d21, [x21]
LDR x22, =n
LDR d22, [x22]
LDR x12, =fourth
LDR d12, [x12]
LDR x13, =second
LDR d13, [x13]
LDR x14, =x
LDR d14, [x14]
LDR x15, =nx
LDR d15, [x15]
BL midpoint
FMOV d0, d24
BL printf
B Exit

.func midpoint
midpoint: 
# sets width of rectangles and finds first midpoint of first rectangle
FSUB d19, d21, d20
FDIV d23, d19, d22
FSUB d24, d24, d24
LDR x19, =divide
LDR d19, [x19]
FDIV d25, d23, d19
FADD d26, d25, d20
Loop: FCMP d26, d21
B.GT End
# calculates the values of the specific rectangle
FMUL d16, d26, d26
FMUL d16, d16, d26
FMUL d16, d16, d26
FMUL d16, d16, d12
FMUL d17, d26, d26
FMUL d17, d17, d13
FMUL d18, d14, d26
FADD d16, d16, d17
FADD d16, d16, d18
FADD d16, d16, d15
FMUL d16, d16, d23
# increases for next iteration
FADD d24, d24, d16
FADD d26, d26, d23
B Loop
End: BR LR
.endfunc
Exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
string: .ascii "The integral of the function is %lf\n"
a: .double -1
b: .double 1
n: .double 4
fourth: .double 8.32
second: .double -6.53
x: .double 9.34
nx: .double 12.32
divide: .double 2.0
.bss
result: .skip 8
.end
