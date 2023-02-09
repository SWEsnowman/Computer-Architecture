.text 
.global _start


_start:
MOV x22, #10
MOV x21, #0
LDR x20, =address
MOV x23, #-1
Loop: 
MOV X0, #0 
MOV X1, x20
MOV X2, #1
MOV X8, #63 
SVC #0
LDR x26, [X1]
CMP x26, '\n'
B.EQ gotowrite
SUB x26, x26, #48
MUL x21, x21, x22
ADD x21, x21, x26
B Loop
gotowrite:
MUL x21, x21, x21
MOV x19, x21
Digits: CMP x19, #0
B.EQ Writeloop
UDIV x19, x19, x22
ADD x23, x23, #1
B Digits
Writeloop:
MOV x19, #0
MOV x24, #1
Inner: 
CMP x19, x23
B.GE Branch
MUL x24, x24, x22
ADD x19, x19, #1
B Inner
Branch:
UDIV x25, x21, x24
MUL x24, x24, x25
ADD x25, x25, #48
STR x25, [x20]
SUB x21, x21, x24
CMP x23, #0
B.LT Exit
MOV X0, #1 
MOV X1, x20
MOV X2, #1
MOV X8, #64 
SVC #0
SUB x23, x23, #1
B Writeloop
Exit:
MOV X0, 0
MOV X8, 93
SVC 0


.data
address: .dword 0
.end
