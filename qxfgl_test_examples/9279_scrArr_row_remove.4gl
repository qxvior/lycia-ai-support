MAIN
  DEFINE arr DYNAMIC ARRAY OF STRING
  LET arr[1] = "first"
  LET arr[2] = "second"
  OPEN WINDOW w WITH FORM "9279/9279_scrArr_row_remove"
  DISPLAY ARRAY arr TO rec.*
    ON ACTION "Del 1"
      CALL arr.deleteElement(1)
    ON ACTION "Del all"
      CALL arr.clear()
    ON ACTION "Check"
      DISPLAY arr.getsize()
  END DISPLAY

  LET arr[1] = "first"
  LET arr[2] = "second"
  INPUT ARRAY arr FROM rec.* ATTRIBUTE(without defaults)
    ON ACTION "Del 1"
      CALL arr.deleteElement(1)
    ON ACTION "Del all"
      CALL arr.clear()
    ON ACTION "Check"
      DISPLAY arr.getsize()
  END INPUT

END MAIN