ORG C0
DB "EUPAHORIA" ;put word into VDU
DB 1 ;stopper
ORG 0 ;go to code
MOV BL, C0 ;put reader into bl
MOV CL, 5A ;z into cl

Loopy:
CMP AL, 1 ;if at end go to end
JZ Endy

MOV AL, [BL] ;put the char in bl in al

CMP AL, 41
JZ Swapy
INC BL
JNZ Loopy

Swapy:
MOV [BL], CL ;swap bl char to "z"
INC BL ;go next char
JMP Loopy

Endy:
END