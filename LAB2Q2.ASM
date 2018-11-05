ORG C0
DB "EUPHORIA" ;put word into VDU
DB 1 ;stopper
ORG 0 ;go to code
MOV BL, C0 ;put reader into bl
MOV CL, 5A ;z into cl

Loopy:
CMP AL, 1 ;if at end go to end
JZ Endy

MOV AL, [BL] ;put the char in bl in al

CMP AL, 41 ;compare char to vowel "a"
JZ Swapy
CMP AL, 45 ;compare char to vowel "e"
JZ Swapy
CMP AL, 49 ;compare char to vowel "i"
JZ Swapy
CMP AL, 4F ;compare char to vowel "o"
JZ Swapy
CMP AL, 55 ;compare char to vowel "u"
JZ Swapy
INC BL
JNZ Loopy

Swapy:
MOV [BL], CL ;swap bl char to "z"
INC BL ;go next char
JMP Loopy

Endy:
END