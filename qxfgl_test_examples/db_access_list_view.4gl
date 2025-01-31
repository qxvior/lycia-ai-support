IMPORT FGL db_access_widget_control

PUBLIC TYPE ListView RECORD    # The type RAD that executes a query, shows data and returns the selected row data as a result
    query            STRING,   # Query that will be executed and shown result
    selected_data    HashMap,  # Will keep selected row data
    selected_row_id  INT,      # Will keep selected row id
    window_title     STRING,   # Title of new window
    fields           DYNAMIC ARRAY OF RECORD name STRING, type STRING END RECORD, # List of form fields controlled by the dialog
    actions          HashMap   # Custom actions
END RECORD

CONSTANT SCREEN_RECORD = "sr"

################################################################
#
#  Method EXECUTE of RAD object
#  Shows table with data from defined query
#  process DISPLAY ARRAY and fill RESULT with selected row data
#
################################################################
PUBLIC FUNCTION (lv ListView) Execute() RETURNS BOOL
    DEFINE event STRING                           # Current event name
    DEFINE dlg UI.DIALOG                          # Dynamic DIALOG
    DEFINE sh base.SqlHandle                      # SQL handler for query    
    DEFINE i, row, index, ofs, len INT
    DEFINE ret, fRes BOOL
    DEFINE fm FORM
    DEFINE execFunc FUNCTION(lv ListView INOUT) RETURNS BOOL
    
    LET fm = ui.Window.GetCurrent().CreateForm("f")
    
    LET  ret = FALSE
    LET  lv.selected_row_id = 0                  # Reset previous selected row id
    CALL lv.selected_data.Clear()                # Clear previous result
    CALL lv.fields.Clear()                       # Crear previous list of form fields
    
    LET  sh = base.SqlHandle.Create()            # Instantiate SqlHandle object
    CALL sh.Prepare(lv.query)                    # Prepare query
    CALL sh.OpenScrollCursor()                   # Open cursor

    # Fill array with result column's names and types
    FOR i = 1 TO sh.GetResultCount()
        LET lv.fields[i].name = sh.GetResultName(i)  # Define name of column
        LET lv.fields[i].type = sh.GetResultType(i)  # Define type of column
    END FOR

    CALL lv.InitTable()                          # Initialize form with TABLE widget

    LET  dlg = ui.Dialog.CreateDisplayArrayTo(lv.fields, SCREEN_RECORD) # Create dynamic DIALOG with DISPLAY ARRAY
    CALL dlg.addTrigger("ON ACTION accept")      # Add custom ACCEPT action
    CALL dlg.addTrigger("ON ACTION cancel")      # Add custom CANCEL action
	CALL dlg.addTrigger("ON FILL BUFFER")        # Add custom ON FILL BUFFER action

    FOR i = 1 TO lv.actions.getSize()
       CALL dlg.addTrigger(lv.actions.GetKey(i)) # Add custom action
    END FOR
    
    WHILE (event := dlg.NextEvent()) IS NOT NULL # Process dialog and wait for the next event
		CASE event
			WHEN "ON FILL BUFFER"
				LET ofs = FGL_DIALOG_GETBUFFERSTART()
				LET len = FGL_DIALOG_GETBUFFERLENGTH()		
				FOR row = 1 TO len
				    LET index = ofs + row - 1
				    CALL sh.FetchAbsolute(index)  # Fetch new row from DB
					IF sqlca.sqlcode == NOTFOUND OR status <> 0 THEN
					   CALL dlg.SetArrayLength(SCREEN_RECORD, index - 1) # Set length of DISPLAY ARRAY.
					   EXIT FOR
					END IF
					FOR i = 1 TO sh.GetResultCount() # Set value in each field in the row
			            CALL dlg.SetFieldValue(sh.GetResultName(i), sh.GetResultValue(i), index)
			        END FOR
				END FOR
		   
		 	WHEN "ON ACTION accept"
                LET lv.selected_row_id = dlg.GetCurrentRow(SCREEN_RECORD)
				FOR i = 1 TO sh.GetResultCount()  # Fill RESULT with selected row data
				    LET lv.selected_data[sh.GetResultName(i) CLIPPED] = dlg.GetFieldValue(sh.GetResultName(i)) CLIPPED
				END FOR
				
				LET fRes = FALSE
				IF lv.actions.KeyExists(event) THEN  # Check for custom function of action "ON ACTION accept" 
				    LET execFunc = lv.actions[event]
				    IF execFunc IS NOT NULL THEN
						LET fRes = execFunc(lv) # Execute custom function of action "ON ACTION accept"
					END IF
				END IF				
				
				IF NOT fRes THEN
					CALL dlg.Accept()   # Accept dialog
	                LET ret = TRUE      # Return TRUE, that means it is accepted by customer
					EXIT WHILE          # Stop processing events
				END IF
		       
		 	WHEN "ON ACTION cancel"     # Dialog is finished.
				LET ret = TRUE
				EXIT WHILE              # Stop processing events
            
            OTHERWISE	
				IF lv.actions.KeyExists(event) THEN   # Check for custom function for current event      
	                LET lv.selected_row_id = dlg.GetCurrentRow(SCREEN_RECORD)
					FOR i = 1 TO sh.GetResultCount()  # Fill RESULT with selected row data
					    LET lv.selected_data[sh.GetResultName(i) CLIPPED] = dlg.GetFieldValue(sh.GetResultName(i)) CLIPPED
					END FOR
				    LET execFunc = lv.actions[event]
				    IF execFunc IS NOT NULL THEN
						CALL execFunc(lv) # Execute custom function for current event 
					END IF
				END IF
		END CASE
	END WHILE
    
    CALL dlg.Close()  # Close and release dynamic dialog
    CALL sh.Close()   # Close sql handler
    CALL fm.Close()
    RETURN ret
END FUNCTION


################################################################
#
#  Method EXECUTE of RAD object
#  Fill table from template form with columns that defined in 'fields' array
#
################################################################
PRIVATE FUNCTION (lv ListView) InitTable()
    DEFINE column_ident, field_ident STRING                  # Identifier storages
    DEFINE c_arr DYNAMIC ARRAY OF ui.TableColumn             # List of table columns for inserting to table
    DEFINE e_arr DYNAMIC ARRAY OF ui.AbstractUiElement
    DEFINE sr_arr DYNAMIC ARRAY OF STRING                    # List of field names for creating screen record
    DEFINE i INT
    DEFINE cp ui.CoordPanel
    DEFINE t ui.Table
    DEFINE c ui.TableColumn
    DEFINE size ui.Size
    
    CALL ui.Window.GetCurrent().SetText(lv.window_title)
    
    LET size.width = "100qch"
    LET size.height = "20qch"
    
    LET cp = ui.Window.GetCurrent().GetContent()             # Get content element of the Window, that is used to position form's root container
    IF cp IS NULL THEN                                       # Check if root container exists
        DISPLAY "ERROR: Root CoordPanel was not found"
        RETURN                                               # Root container was not created
    END IF
    CALL cp.SetPreferredSize(size)
    
    LET t = ui.Table.Create(SCREEN_RECORD)                   # Create Tabel
    IF t IS NULL THEN                                        # Check if table exists
        DISPLAY "ERROR: Table is not created"
        RETURN                                               # Table was not created
    END IF
    CALL t.SetPreferredSize(size)                            # Set preferred size of created Table
    CALL cp.SetItems([t])                                    # Add created Table to CoordPanel
    
    FOR i = 1 TO lv.fields.GetSize()
        LET field_ident = lv.fields[i].name CLIPPED          # Define text field identifier
        LET column_ident = "c_" || field_ident               # Define table column identifier
        LET c = ui.TableColumn.Create(column_ident, SCREEN_RECORD)  # Create TABLE COLUMN into the table
        CALL c.SetText(field_ident)                          # Set header of column
        CALL CreateWidget(column_ident, field_ident, lv.fields[i].type)        
        CALL c.Complete()                                    # Complete table column (internal)
        LET c_arr[i] = c                                     # Collect it in columns array               
        LET sr_arr[i] = field_ident                          # Collect field names for creating screen record
    END FOR
    
    CALL t.SetTableColumns(c_arr)                            # Insert table columns into the table
    CALL t.Complete()                                        # Complete table (internal)
    CALL form_set_screenrecord(SCREEN_RECORD, sr_arr)        # Insert screen record
END FUNCTION