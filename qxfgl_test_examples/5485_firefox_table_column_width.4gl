MAIN
DEFINE column_headers DYNAMIC ARRAY OF STRING
DEFINE i SMALLINT
DEFINE tableColumns DYNAMIC ARRAY OF ui.TableColumn
DEFINE l_gridLength ui.GridLength
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

LET column_headers[1] = "Contract No"
LET column_headers[2] = "Item No"
LET column_headers[3] = "Realse date"
LET column_headers[4] = "State"
OPEN WINDOW brows AT 4,28 WITH FORM "5485/5485_firefox_table_column_width" ATTRIBUTE(BORDER)

DISPLAY ARRAY arr TO sform.* 
  BEFORE DISPLAY
  	LET tableColumns = ui.Table.Forname("sform").GetTableColumns()
  	FOR i=1 TO 20
  		IF i<=column_headers.GetLength() THEN
			CALL tableColumns[i].SetVisible(TRUE)
			CALL tableColumns[i].setText(column_headers[i])
			LET l_gridLength.GridLengthValue="100rem"
			CALL tableColumns[i].SetColumnLength(l_gridLength)
			
  		ELSE
			CALL tableColumns[i].SetVisible(FALSE)
  		END IF
  	END FOR
END DISPLAY
END MAIN

