IMPORT FGL db_access_list_view
IMPORT FGL db_access_row_view

MAIN
    DEFINE lv ListView                               # Instantiate RAD object

    CONNECT TO "stores"

    LET  lv.window_title = "List of tables"          # Define window title
    LET  lv.query = "SELECT tabname FROM systables WHERE statlevel = 'A'"  # Define query that will be shown
    CALL lv.actions.insert("ON ACTION accept", FUNCTION table_view)  # Add custom action
    CALL lv.Execute() # Execute
END MAIN

################################################################
#
#  Custom function that will be executed on ACCEPT action
#
################################################################
FUNCTION table_view(lv ListView INOUT) RETURNS BOOL
    DEFINE lv_table ListView                         # Instantiate RAD object
    DEFINE ret BOOL
    DEFINE tabname STRING
    
    IF NOT lv.selected_data.KeyExists("tabname") THEN
        RETURN FALSE
    END IF

    LET tabname = lv.selected_data["tabname"]
    LET lv_table.window_title = "View of table " || tabname   # Set window title
    CALL lv_table.actions.insert("ON ACTION accept", FUNCTION row_edit) # Define custom function, that is executed on ACCEPT action

    OPEN WINDOW w1 AT 1,1 WITH 24 ROWS, 80 COLUMNS
    LET lv_table.query = "SELECT * FROM " || tabname # Define query that will be shown
    LET ret = lv_table.Execute() # Execute

    CLOSE WINDOW w1
    RETURN ret
END FUNCTION

################################################################
#
#  Custom function that will be executed on ACCEPT action
#
################################################################
FUNCTION row_edit(lv ListView INOUT) RETURNS BOOL
    DEFINE rv RowView                         # Instantiate RAD object
    
    IF lv.selected_row_id < 1 THEN
        RETURN TRUE
    END IF
                             
    LET rv.window_title = "Edit row data"   # Set window title
    OPEN WINDOW w2 AT 1,1 WITH 24 ROWS, 80 COLUMNS
    
    IF rv.Execute(lv.selected_data) THEN
        DISPLAY lv.selected_data           # Just display edited row data. We can update DB table here as well
    END IF

    CLOSE WINDOW w2
    RETURN TRUE
END FUNCTION