MAIN
   DEFINE
      prg_arr_1 ARRAY[3] OF RECORD
                             field1 CHAR(10),
                             field2 CHAR(10),
                             field3 CHAR(10)
                          END RECORD,
      cnt   INTEGER      

   DEFER INTERRUPT      

   OPEN WINDOW w1 AT 2,2 WITH FORM "0672/0672_pageup_pagedown_input_array" ATTRIBUTE (FORM LINE FIRST,BORDER)
   DISPLAY "Press PageDown, PageUp" AT 7,1

   FOR cnt = 1 TO 3
      LET prg_arr_1[cnt].field1 = cnt
      LET prg_arr_1[cnt].field2 = cnt
      LET prg_arr_1[cnt].field3 = cnt
   END FOR
   LET cnt = cnt - 1
   CALL SET_COUNT(cnt)

   INPUT ARRAY prg_arr_1 WITHOUT DEFAULTS FROM scr_arr.*

END MAIN
