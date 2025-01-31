DEFINE dt_rec_with_array TYPE AS RECORD
fName STRING,
transaction DYNAMIC ARRAY OF MONEY
END RECORD

MAIN
DEFINE myRec dt_rec_with_array

LET myRec.fname = "Name1"
LET myRec.transaction[1] = 123.45 
LET myRec.transaction[2] = 678.9

CALL myFunc(myRec.*)
END MAIN

FUNCTION myFunc(p_rec)
DEFINE p_rec dt_rec_with_array

DISPLAY p_rec.*
END FUNCTION 