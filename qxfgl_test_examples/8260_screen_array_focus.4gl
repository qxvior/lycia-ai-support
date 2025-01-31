MAIN
DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2,f3 STRING END RECORD
DEFINE f1 STRING
LET tarr[1].f1 = "str1"
LET tarr[1].f2 = "str1"
LET tarr[1].f3 = "str1"

LET tarr[2].f1 = "str2"
LET tarr[2].f2 = "str2"
LET tarr[2].f3 = "str2"

LET tarr[3].f1 = "str3"
LET tarr[3].f2 = "str3"
LET tarr[3].f3 = "str3"

OPEN WINDOW w WITH FORM "8260/8260_screen_array_focus" 

DISPLAY ARRAY tarr to tax_rate.*
    ON ACTION "SubInput"
         INPUT BY NAME f1
END DISPLAY
END MAIN
