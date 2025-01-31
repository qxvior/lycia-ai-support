DATABASE stores

MAIN
CALL fgl_putenv("DBDATE=DMY4/")
WHENEVER ERROR CONTINUE
DROP TABLE bridge
CREATE TABLE bridge(
ckz CHAR(10),
porc SMALLINT,
d_uvol DATE,
stav CHAR(1)
)
WHENEVER ERROR STOP

 LOAD FROM "1525/1525_fgl_dialog_getBufferStart.unl" INSERT INTO bridge
 CALL input_func ("1525/1525_fgl_dialog_getBufferStart")
 CALL input_func ("1525/1525_scr_arr")
END MAIN

FUNCTION input_func(form_name)
  DEFINE form_name STRING
  DEFINE arr DYNAMIC ARRAY OF RECORD
		ckz CHAR(10),
		porc SMALLINT,
		d_uvol DATE,
		stav CHAR(1)
        END RECORD 
  DEFINE cnt, ofs, len, row, i INTEGER

  OPEN WINDOW ordbaccessders WITH FORM form_name attribute(border,TEXT="Unknown")
  DECLARE c1 SCROLL CURSOR FOR
         SELECT ckz, porc, d_uvol, stav FROM bridge 
  OPEN c1
  
  DISPLAY ARRAY arr TO sa.* ATTRIBUTES(COUNT=-1)
  	BEFORE ROW
  		display "Before row arr_curr()=", trim(arr_curr()), ", ofs=", trim(ofs), " ,arr_curr()-ofs+1=", trim(arr_curr()-ofs+1)
    
    ON FILL BUFFER
       LET ofs = fgl_dialog_getBufferStart()
       LET len = fgl_dialog_getBufferLength()
       LET row = ofs 
       FOR i=1 TO len 
          FETCH ABSOLUTE row c1 INTO arr[i].*
          IF SQLCA.SQLCODE!=0 THEN
            CALL DIALOG.setArrayLength("sa",row-1)
            EXIT FOR
          END IF
          LET row = row + 1
       END FOR
  END DISPLAY
  DISPLAY "OK"
  CALL fgl_getkey()
  CLOSE WINDOW ordbaccessders	
END FUNCTION