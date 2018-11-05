ORG C0
DB "EUPHORIA" ;put word into VDU
DB 1 ;stopper
ORG 0 ;go to code
MOV BL, C0 ;put reader into bl

Loopy:
CMP AL, 1 ;if at end go to end
JZ Endy

MOV AL, [BL] ;put the char in bl in al

CMP AL, 41 ;compare char to vowel "a"
JZ Pushy
CMP AL, 45 ;compare char to vowel "e"
JZ Pushy
CMP AL, 49 ;compare char to vowel "i"
JZ Pushy
CMP AL, 4F ;compare char to vowel "o"
JZ Pushy
CMP AL, 55 ;compare char to vowel "u"
JZ Pushy
INC BL
JNZ Loopy

Pushy:
MOV CL, [BL] ;move bl char to cl
push CL
INC BL ;go next char
JMP Loopy

Endy:
END