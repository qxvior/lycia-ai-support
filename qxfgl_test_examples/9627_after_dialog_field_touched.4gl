MAIN
DEFINE f1 STRING 
    OPEN WINDOW w WITH FORM "9627/9627_after_dialog_field_touched"
    DIALOG 
        INPUT BY NAME f1
        END INPUT 
        ON ACTION EXIT
            ACCEPT DIALOG
        AFTER DIALOG
            DISPLAY "after dialog"
            IF FIELD_TOUCHED(*) THEN
                DISPLAY "touched"
            END IF 
    END DIALOG 
END MAIN
