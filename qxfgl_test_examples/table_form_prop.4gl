MAIN
DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2 INTEGER END RECORD
OPEN WINDOW w WITH FORM "form/table_form_prop" ATTRIBUTE(BORDER)
INPUT ARRAY tarr FROM rootContainer.*
END MAIN