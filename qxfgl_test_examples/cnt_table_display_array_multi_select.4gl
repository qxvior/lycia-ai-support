######################################################################
# MAIN
#
#
######################################################################
MAIN
	DEFINE  i SMALLINT
	DEFINE arr_left DYNAMIC ARRAY OF 
		RECORD 
			f1,f2 STRING
		END RECORD

	CALL ui_init()
	CALL init_data(arr_left) RETURNING arr_left

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW w1 WITH FORM "form/cnt_table_display_array_multi_select"
	CALL ui.Interface.setText("Multi-Select")
	DISPLAY "Table Container DISPLAY ARRAY with Multi Row/Line Select" TO lbTitle
		

	
	DISPLAY ARRAY arr_left TO sr_left.*
		ON ACTION ("ACCEPT")
			DISPLAY "arr_curr() Current Row = ", trim(arr_curr())
			DISPLAY "Try selecting multiple rows and select the TEST button"
			
		ON ACTION ("Test")  --test what rows are selected
			DISPLAY "arr_count() Array Size = ", trim(arr_count())
			DISPLAY "arr_curr() Current Row = ", trim(arr_curr())
			FOR i = 1 TO arr_count()
				IF dialog.isRowSelected("sr_left",i) THEN
					DISPLAY "Row ", trim(i), " is selected"
				END IF
			END FOR
			
		ON ACTION "ADD"
			CALL dataSource(arr_left.getLength(),+10)	RETURNING arr_left

		ON ACTION "DELETE"
			CALL dataSource(arr_left.getLength(),-10)	RETURNING arr_left
     			
    ON ACTION "HELP"
  		CALL onlineHelp("TableAll",NULL)				
     		
     END DISPLAY
     
 END MAIN
 
 
FUNCTION dataSource(p_arrSize,p_changeSize)
	DEFINE p_arrSize SMALLINT
	DEFINE p_changeSize SMALLINT
	DEFINE l_arr_left DYNAMIC ARRAY OF 
		RECORD 
			f1,f2 STRING
		END RECORD	
	DEFINE i SMALLINT

	LET p_arrSize = p_arrSize + p_changeSize
	
	IF p_arrSize > 1 THEN
		FOR i = 1 TO p_arrSize
			LET l_arr_left[i].f1 = "left " || i
			LET l_arr_left[i].f2 = "right " || i
		END FOR
	ELSE
		LET l_arr_left = NULL
	END IF
	
	RETURN l_arr_left
END FUNCTION


FUNCTION init_data(p_arr_left)
	DEFINE p_arr_left DYNAMIC ARRAY OF 
		RECORD 
			f1,f2 STRING
		END RECORD
	DEFINE i SMALLINT
	FOR i = 1 TO 10
		LET p_arr_left[i].f1 = "left " || i
		LET p_arr_left[i].f2 = "right " || i
	END FOR
	RETURN p_arr_left
END FUNCTION