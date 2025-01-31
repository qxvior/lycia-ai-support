MAIN
DEFINE field0,field1,field2 string
OPTIONS FIELD ORDER UNCONSTRAINED

OPEN WINDOW w WITH FORM "4387/4387_unconstrained_cursor_in_disabled_field" ATTRIBUTE(BORDER)
    INPUT field0,field1,field2 FROM f0,f1,f2
        BEFORE INPUT
          CALL DIALOG.SetFieldActive("f1", FALSE)
    END INPUT
END MAIN