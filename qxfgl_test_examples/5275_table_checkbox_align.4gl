MAIN
DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2,f3 INT END RECORD
LET tarr[1].f1=1
LET tarr[1].f1=2
LET tarr[1].f1=3


OPEN WINDOW w WITH FORM "5275/5275_table_checkbox_align"
DISPLAY ARRAY tarr TO tarr.*
INPUT ARRAY tarr FROM tarr.*
END MAIN