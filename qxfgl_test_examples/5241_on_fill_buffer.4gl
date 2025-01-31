DATABASE stores_demo

MAIN
DEFINE select_statement2 STRING
DEFINE column_values DYNAMIC ARRAY OF STRING
DEFINE pocetr INT
DEFINE cnt, ofs, len, row, i INTEGER
DEFINE arr DYNAMIC ARRAY OF RECORD
  	col1	char(30),
  	col2	char(30),
  	col3	char(30),
  	col4	char(30),
  	col5	char(30),
  	col6	char(30),
  	col7	char(30),
  	col8	char(30),
  	col9	char(30),
  	col10	char(30),
  	col11	char(30),
  	col12	char(30),
  	col13	char(30),
  	col14	char(30),
  	col15	char(30),
  	col16	char(30),
  	col17	char(30),
  	col18	char(30),
  	col19	char(30),
  	col20	char(30)
END RECORD
DEFINE tableColumns DYNAMIC ARRAY OF ui.TableColumn
DEFINE l_table ui.Table
DEFINE f1,f2,f3,f4 CHAR(40)
DEFINE l_gridLength ui.GridLength

 

WHENEVER ERROR CONTINUE
drop table DB_prac
CREATE TABLE DB_prac(
f1 CHAR(40),
f2 CHAR(40),
f3 CHAR(40),
f4 CHAR(40)
)
WHENEVER ERROR STOP
LET pocetr = 50
FOR i=1 TO pocetr
	LET f1 =  "column 1 row",i
	LET f2 =  "column 2 row",i
	LET f3 =  "column 3 row",i
	LET f4 =  "column 4 row",i
	INSERT INTO DB_prac VALUES(f1,f2,f3,f4)
END FOR

		LET select_statement2 = "select * from DB_prac"
		PREPARE pripr FROM select_statement2
		DECLARE surikat SCROLL CURSOR FOR pripr
		OPEN surikat


OPEN WINDOW brows WITH FORM "5241/5241_on_fill_buffer" ATTRIBUTE(BORDER)

DISPLAY ARRAY arr TO sform.* ATTRIBUTES(COUNT=pocetr)
  BEFORE DISPLAY
  	LET tableColumns = ui.Table.Forname("sform").GetTableColumns()
  	FOR i=1 TO 20
  		IF i<=4 THEN
			CALL tableColumns[i].SetVisible(TRUE)
			LET l_gridLength.GridLengthValue="200rem"
			CALL tableColumns[i].SetColumnLength(l_gridLength)
  		ELSE
			CALL tableColumns[i].SetVisible(FALSE)
  		END IF
  	END FOR
 

  ON FILL BUFFER
 		CALL arr.clear()
		LET ofs = fgl_dialog_getBufferStart()
		LET len = fgl_dialog_getBufferLength()
		LET row = ofs 
  		DISPLAY "ON_FILL_BUFFER", ofs
		FOR i=1 TO len 
          FETCH ABSOLUTE row surikat INTO arr[i].*
          IF SQLCA.SQLCODE!=0 THEN
            CALL DIALOG.setArrayLength("sform",row-1)
            EXIT FOR
          END IF
          LET row = row + 1
		END FOR

  ON ACTION "set_16"
		CALL fgl_dialog_setcurrline(16,16)
END DISPLAY

END MAIN

