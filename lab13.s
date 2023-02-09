.text
.global _start
.extern printf

_start:
LDR x20, =N
LDR x20, [x20]
LDR x21, =x
LDR x22, =y
MOV x0, #0
MOV x1, #1000
MOV x2, #8
FMOV d9, x0 // (max)^2 num
SCVTF d10, x1 // (min)^2 num 
FMOV d11, x0 // x value of outer loop
FMOV d12, x0 // y value of outer loop
FMOV d13, x0 // x value of inner loop
FMOV d14, x0 // y value of inner loop
MOV x23, #0 // index num
MOV x24, #0 // indexing for inner loop
MOV x25, #0 // indexing for max outer
MOV x18, #0 // indexing for max inner
MOV x26, #0 // indexing for min outer
MOV x19, #0 // indexing for min inner
Outerloop: 
MUL x27, x23, x2
ADD x27, x21, x27
LDR d11, [x27]
MUL x27, x23, x2
ADD x27, x22, x27
LDR d12, [x27]
MOV x24, #0
Innerloop:
CMP x23, x24
B.EQ SameIndex
MUL x27, x24, x2
ADD x27, x21, x27
LDR d13, [x27]
MUL x27, x24, x2
ADD x27, x22, x27
LDR d14, [x27]
FSUB d13, d13, d11
FSUB d14, d14, d12
FMUL d15, d13, d13
FMUL d16, d14, d14
FADD d15, d15, d16
FCMP d15, d9
B.LT Test2
FMOV d9, d15
MOV x25, x23
MOV x18, x24
Test2: 
FCMP d15, d10
B.GT SameIndex
FMOV d10, d15
MOV x26, x23
MOV x19, x24
SameIndex: 
ADD x24, x24, #1
CMP x24, x20
B.EQ Backout
B Innerloop
Backout:
ADD x23, x23, #1
CMP x23, x20
B.EQ print
B Outerloop
print:
MOV x1, x25
MOV x2, x18
MOV x3, x26
MOV x4, x19
LDR x0, =string1
BL printf
Exit:
MOV w0, #0
MOV w8, #93
SVC #0
.data
N:
	.dword 8
x:
	.double 0.0, 0.4140, 1.4949, 5.0014, 6.5163, 3.9303, 8.4813, 2.6505
y: 	
	.double 0.0, 3.9862, 6.1488, 1.047, 4.6102, 1.4057, 5.0371, 4.1196
string1:
    .ascii "The largest distance is between the points at indexes %d and %d\nThe shortest distance is between the points at indexes %d and %d\n"
.end
