REM !! ZXMAS 2024 !!
REM FZX by Andrew S. Owen
REM and Einar Saukas.
REM 
REM Page noise by Hikaru.
REM 
REM Based on an idea by
REM Matt Round
REM and data from            ukchristmastv.weebly.com
REM 
REM flatduckrecords
REM 
LET freeram = 60000 - USR 7962
LET score=0
LET played=0
LET quests=24
LET lmax=16
LET z$ = CHR$ 22 + CHR$ 0 + CHR$ 0
DIM q(quests)
LET q(1)=@q82
LET q(2)=@q01
LET q(3)=@q46
LET q(4)=@q97
LET q(5)=@q36
LET q(6)=@q49
LET q(7)=@q53
LET q(8)=@q81
LET q(9)=@q55
LET q(10)=@q95
LET q(11)=@q60
LET q(12)=@q66
LET q(13)=@q73
LET q(14)=@q20
LET q(15)=@q77
LET q(16)=@q80
LET q(17)=@q83
LET q(18)=@q69
LET q(19)=@q14
LET q(20)=@q88
LET q(21)=@q98
LET q(22)=@q05
LET q(23)=@q17
LET q(24)=@q23
gosub @prompt
@restart:
LET question=1
OVER 0:PAPER 0:BORDER 0:INK 7:BRIGHT 1:CLS
PRINT #4; AT 0,0;"Welcome to the Radio Times Christmas Day"
PRINT #4; "UK TV schedules quiz!"
PRINT #4
PRINT #4; "I will show you BBC One listings for"
PRINT #4; "Christmas Days of the past; you must"
PRINT #4; "tell me the year (1936 to 2023)."
PRINT #4
PRINT #4; "There are ";STR$(quests);" questions."
IF played=1 THEN PRINT #4; "Last score was: ";score
PRINT AT 21,0;"""Feel the heft of telly heaven!"""
PRINT #0;INK 1;"     Press the any key..."
LET score=0
gosub @prompt
@newquestion:
RESTORE q(question)
GOSUB @rescroll
READ year
LET decade=10*INT(year/10)
GOSUB @cuecard
CLS
LET L=0
@readloop:
LET L=L+1
READ t$
IF t$="END" THEN GOTO @answer
READ d$
PRINT #4;(z$ AND L=1);t$;" ";d$
IF L=lmax THEN GOSUB @prompt:GOSUB @rescroll
GOTO @readloop
@answer:
INPUT "Which year? (YYYY) ";A
IF 0=A THEN GOTO @nextquestion
CLS
PRINT (CHR$ 16 + CHR$ 4 + "C O R R E C T !" AND A=year)
PRINT (CHR$ 16 + CHR$ 2 + "W R O N G !" AND year<>A)
PRINT
PRINT "That was Christmas Day ";INVERSE 1;year''
IF A=year THEN FOR B=1 TO 7 STEP 3:BEEP 0.01,B:NEXT B
IF A<>year THEN FOR B=7 TO 1 STEP -3:BEEP 0.01,B:NEXT B
LET score=score+(5 AND A=year)
IF A=year-1 OR A=year+1 THEN LET score=score+2:PRINT BRIGHT 0;"Just one year out! (+2 points)"
IF (A<=year-2 OR A>=year+2) AND decade = 10*INT(A/10) THEN LET score=score+1:PRINT BRIGHT 0;"Correct decade (+1 point)"
PRINT : PRINT "Score: ";score
GOSUB @prompt
@nextquestion:
LET question = question + 1
IF question > quests THEN GOTO @end
GOTO @newquestion
@end:
LET played=1
INK 7: CLS: PRINT "The END!"
PRINT
PRINT "Your score: ";FLASH 1;score;FLASH 0
PRINT
PRINT "Thank you for playing!"
PRINT #0;"MERRY ZXMAS!"
PRINT #0;"    xxx"
FOR i=23232 TO 23244 STEP 2: POKE i,2:POKE (i+1),4:NEXT i
PAUSE 0
GOTO @restart
@rescroll:
CLS:LET L=0
RETURN
@prompt:
PRINT #0;AT 1,31;BRIGHT 1;FLASH 1;">"
PAUSE 0
RANDOMIZE USR 65500
RETURN
@cuecard:
PRINT TAB 10;FLASH 1;INK 2;PAPER 4;"\'.";
PRINT FLASH 0;INK 9;PAPER 8;" Question ";
PRINT question;" ";FLASH 1;INK 2;PAPER 4;"\.'"
PAUSE 75
RETURN
