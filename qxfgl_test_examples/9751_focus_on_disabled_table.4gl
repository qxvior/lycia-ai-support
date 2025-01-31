MAIN
  DEFINE arr1 DYNAMIC ARRAY OF RECORD f11, f12 STRING END RECORD
 
  OPEN WINDOW w WITH FORM "9751/9751_focus_on_disabled_table"
  
  LET arr1[1].f11 = "arr1_f11_1"
  LET arr1[1].f12 = "arr1_f12_1"
  LET arr1[2].f11 = "arr1_f11_2"
  LET arr1[2].f12 = "arr1_f12_2"
  
  DIALOG
    DISPLAY ARRAY arr1 TO scr2.*
      ON ACTION "arr2"
        DISPLAY "arr2"
    END DISPLAY
    DISPLAY ARRAY arr1 TO scr1.*
      ON ACTION "arr1"
        DISPLAY "arr1"
    END DISPLAY
    ON ACTION exit
      EXIT DIALOG
  END DIALOG
END MAIN