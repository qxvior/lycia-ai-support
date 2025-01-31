MAIN
DEFINE field0,field1,field2 string
OPTIONS FIELD ORDER UNCONSTRAINED

OPEN WINDOW w WITH FORM "4386/4386_unconstrained_field_disable" ATTRIBUTE(BORDER)
    INPUT field0,field1,field2 FROM f0,f1,f2
        BEFORE field f1
          CALL DIALOG.SetFieldActive("f1", FALSE)
    END INPUT
END MAIN