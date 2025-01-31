GLOBALS
    DEFINE GAR_ELEMENTS DYNAMIC ARRAY OF STRING
    DEFINE GAR_DATA DYNAMIC ARRAY OF DYNAMIC ARRAY OF STRING
        DEFINE ltb_table ui.Table
    DEFINE ltbc_column ui.TableColumn
    DEFINE lar_columns DYNAMIC ARRAY OF ui.TableColumn
END GLOBALS
MAIN 
	DEFINE tmp_tbl_col ui.TableColumn
	DEFINE l_gridLength ui.GridLength
	DEFINE trec DYNAMIC ARRAY OF RECORD name,lname,age,email,gender,status,password CHAR(10) END RECORD

    OPEN WINDOW w_tableDynamic WITH FORM "6436/6436_dynamic_table" ATTRIBUTES(BORDER)
    CALL fn_generateTable()
	LET trec[1].name="col1"
    LET trec[1].lname="col2"
    LET trec[1].age="col3"
    LET trec[1].email="col4"
    LET trec[1].gender="col5"
    LET trec[1].status="col6"
    LET trec[1].password="col7"
    DISPLAY ARRAY trec TO tb_dynamic.* WITHOUT SCROLL

    MENU
	    COMMAND "delete"
	    	LET lar_columns = ltb_table.GetTableColumns()
	        CALL lar_columns.deleteelement(3)
	        CALL ltb_table.SetTableColumns(lar_columns)
	        CALL ltb_table.SetEnable(TRUE)
	        COMMAND "EXIT"
	            EXIT MENU
	    COMMAND "add"        
	    	LET lar_columns = ltb_table.GetTableColumns()
			LET tmp_tbl_col = ui.TableColumn.Create("last_col")
			CALL tmp_tbl_col.SetControl(ui.Textfield.Create("tfff"))
			--LET l_gridLength.GridLengthValue="100%"
            --CALL tmp_tbl_col.SetColumnLength(l_gridLength)
			CALL tmp_tbl_col.SetText("last_column")
	        CALL lar_columns.append(tmp_tbl_col)
	        CALL ltb_table.SetTableColumns(lar_columns)
	        CALL ltb_table.SetEnable(TRUE)
    END MENU
END MAIN



FUNCTION fn_init_array()
    
    CALL GAR_ELEMENTS.Clear()
    LET GAR_ELEMENTS[1] = "name"
    LET GAR_ELEMENTS[2] = "lname"
    LET GAR_ELEMENTS[3] = "age"
    LET GAR_ELEMENTS[4] = "email"
    LET GAR_ELEMENTS[5] = "gender"
    LET GAR_ELEMENTS[6] = "status"
    LET GAR_ELEMENTS[7] = "password"
END FUNCTION
FUNCTION fn_generateTable()
    DEFINE l_gridLength ui.GridLength
    DEFINE lde_percent DECIMAL(18,8)
    DEFINE li_index INTEGER
    DEFINE lv_columnText STRING
    DEFINE lv_columnId STRING
    DEFINE textField ui.TextField
    
    
    LET ltb_table = ui.Table.ForName("tb_dynamic")
    CALL fn_init_array()
    LET lde_percent = 100/GAR_ELEMENTS.GetLength()
    
    CALL form_set_screenrecord("tb_dynamic", GAR_ELEMENTS)
    FOR li_index = 1 TO GAR_ELEMENTS.GetLength()
#########################################
--Create text field for each column
        LET textField = ui.Textfield.Create(GAR_ELEMENTS[li_index])
#########################################       
        LET lv_columnId = "tbc",li_index
        LET ltbc_column = ui.TableColumn.Create(trim(li_index))
        CALL ltbc_column.SetText(GAR_ELEMENTS[li_index])
    
        --LET l_gridLength.GridLengthValue=lde_percent CLIPPED, "%"
    
        --CALL ltbc_column.SetColumnLength(l_gridLength)
#########################################
--Add text field to each table column
CALL ltbc_column.SetControl(textField)
#########################################   
        CALL lar_columns.append(ltbc_column)
    END FOR
    CALL ltb_table.SetTableColumns(lar_columns)
    CALL ltb_table.SetEnable(TRUE)
END FUNCTION
