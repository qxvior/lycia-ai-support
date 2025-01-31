IMPORT FGL db_access_widget_control
IMPORT FGL db_access_list_view

PUBLIC TYPE RowView RECORD  # The type RAD that executes a query, shows data and returns the selected row data as a result 
    fields       DYNAMIC ARRAY OF RECORD name STRING, type STRING END RECORD,
    window_title STRING
END RECORD

################################################################
#
#  Method EXECUTE of RAD object
#  Shows row data (HASHMAP)
#  process INPUT and keep RESULT with selected row data
#
################################################################
PUBLIC FUNCTION (rv RowView) Execute(data HashMap) RETURNS BOOL
    DEFINE event STRING                           # Current event name
    DEFINE dlg UI.DIALOG                          # Dynamic DIALOG
    DEFINE i INT
    DEFINE ret BOOL
    DEFINE fm FORM
    
    LET fm = ui.Window.GetCurrent().CreateForm("f")
    
    LET ret = FALSE
    CALL rv.fields.clear()
    
    # Fill array with result column's names and types
    FOR i = 1 TO data.GetSize()
        LET rv.fields[i].name = data.GetKey(i)    # Define name of column
        LET rv.fields[i].type = data.GetValue(i).GetTypeFullName()  # Define type of column
    END FOR

    CALL rv.InitForm()                            # Initialize form with TABLE widget   

    LET  dlg = ui.Dialog.CreateInputByName(rv.fields) # Create dynamic DIALOG with DISPLAY ARRAY
    CALL dlg.addTrigger("ON ACTION accept")       # Add custom ACCEPT action
    CALL dlg.addTrigger("ON ACTION cancel")       # Add custom CANCEL action
    CALL dlg.setDialogAttribute("WITHOUT DEFAULTS", TRUE)
    CALL dlg.setDialogAttribute("UNBUFFERED", TRUE)
       
    WHILE (event := dlg.NextEvent()) IS NOT NULL  # Process dialog and wait for next event
		CASE event
		    WHEN "BEFORE INPUT"
		    	FOR i = 1 TO data.GetSize()       # Set value in each field in the row
		            CALL dlg.SetFieldValue(data.GetKey(i), data.GetValue(i))
		        END FOR
		        
		 	WHEN "ON ACTION accept"               # Dialog is finished.
				FOR i = 1 TO data.GetSize()       # Fill RESULT
				    LET data[data.GetKey(i)] = dlg.GetFieldValue(data.GetKey(i)) CLIPPED
				END FOR
				
				CALL dlg.Accept()                 # Accept dialog
                LET ret = TRUE                    # Return TRUE, that means it is accepted by customer
				EXIT WHILE                        # Stop processing events
		       
		 	WHEN "ON ACTION cancel"               # Dialog is finished.
				EXIT WHILE                        # Stop processing events
		END CASE
	END WHILE
    
    CALL dlg.Close()                              # Close and release dynamic dialog
    CALL fm.Close()
    RETURN ret
END FUNCTION


################################################################
#
#  Method EXECUTE of RAD object
#  Fill table from template form with columns that defined in 'fields' array
#
################################################################
PRIVATE FUNCTION (rv RowView) InitForm()
    DEFINE i INT
    DEFINE cp ui.CoordPanel
    DEFINE lbl ui.Label
    DEFINE wdg ui.AbstractUiElement
    DEFINE size ui.Size
    DEFINE location ui.Location
    
    CALL ui.Window.GetCurrent().SetText(rv.window_title)
    
    LET size.width = "100qch"
    LET size.height = "20qch"
    
    LET cp = ui.Window.GetCurrent().GetContent()             # Get root container in the form
    IF cp IS NULL THEN                                       # Check if root container exists
        RETURN                                               # Root container was not created
    END IF
    CALL cp.SetIdentifier("RootContainer")
    CALL cp.SetPreferredSize(size)
    
    FOR i = 1 TO rv.fields.GetSize()
        LET lbl = ui.Label.Create(rv.fields[i].name || "_lbl", "RootContainer")
        CALL lbl.SetText(rv.fields[i].name)
		LET location.XCoord = "2qch"
		LET location.YCoord = (i * 2) || "qch"
        CALL lbl.SetLocation(location)
        
        LET wdg = CreateWidget("RootContainer", rv.fields[i].name, rv.fields[i].type)
		LET location.XCoord = "20qch"
        CALL wdg.SetLocation(location)
    END FOR
END FUNCTION