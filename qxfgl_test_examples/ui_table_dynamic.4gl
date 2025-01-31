################################################################################
# Module Scope Variables
################################################################################
	DEFINE mc_arrTableColumnHeaderText DYNAMIC ARRAY OF STRING	--Table Column Name (identifier) or Header ???
	
	DEFINE mc_arrAllData dynamic array of record f1,f2,f3,f4,f5,f6,f7 CHAR(20) END RECORD
	DEFINE mc_arr1ColumnData dynamic array of record f1 CHAR(20) END RECORD
	DEFINE mc_arr2ColumnData dynamic array of record f1,f2 CHAR(20) END RECORD
	DEFINE mc_arr3ColumnData dynamic array of record f1,f2,f3 CHAR(20) END RECORD
	DEFINE mc_arr4ColumnData dynamic array of record f1,f2,f3,f4 CHAR(20) END RECORD
	DEFINE mc_arr5ColumnData dynamic array of record f1,f2,f3,f4,f5 CHAR(20) END RECORD
	DEFINE mc_arr6ColumnData dynamic array of record f1,f2,f3,f4,f5,f6 CHAR(20) END RECORD
	DEFINE mc_arr7ColumnData dynamic array of record f1,f2,f3,f4,f5,f6,f7 CHAR(20) END RECORD

################################################################################
# MAIN
#
#
################################################################################		
MAIN
	DEFINE tableColumnCount SMALLINT  --number of columns which will be created dynamically 
	DEFINE formTable ui.Table	--Table

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	CALL ui_init()

	CALL init_data(100)
	
	FOR tableColumnCount = 1 TO 7  #prepare dummy demo data
		CALL morphRecordArray(tableColumnCount)
	END FOR
		
	OPEN WINDOW w_tableDynamic WITH FORM "form/ui_table_dynamic"
  CALL fgl_settitle("Dynamic Table Columns")
	CALL ui.Interface.setText("UI-API Table")    
    
  INPUT BY NAME tableColumnCount WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)
  	ON ACTION "doubleClick"
  		LET formTable = ui.Table.ForName("tb_dynamic")	--Reference form table tb_dynamic
  		CALL fn_generateTable(formTable, tableColumnCount)    	
  		CALL tableDisplayArray(tableColumnCount)
  		#CALL formTable.free()
  END INPUT
    

END MAIN
################################################################################
# END MAIN
################################################################################		


################################################################################
# FUNCTION tableDisplayArray(ptableColumnCount)
#
#
################################################################################
FUNCTION tableDisplayArray(ptableColumnCount)
	DEFINE ptableColumnCount SMALLINT
	
    CASE ptableColumnCount
    	WHEN 1
    		DISPLAY ARRAY mc_arr1ColumnData TO tb_dynamic.*
    	WHEN 2
    		DISPLAY ARRAY mc_arr2ColumnData TO tb_dynamic.*
    	WHEN 3
    		DISPLAY ARRAY mc_arr3ColumnData TO tb_dynamic.*
    	WHEN 4
    		DISPLAY ARRAY mc_arr4ColumnData TO tb_dynamic.*
    	WHEN 5
    		DISPLAY ARRAY mc_arr5ColumnData TO tb_dynamic.*
    	WHEN 6
    		DISPLAY ARRAY mc_arr6ColumnData TO tb_dynamic.*
    	WHEN 7
    		DISPLAY ARRAY mc_arr7ColumnData TO tb_dynamic.*
    END CASE
END FUNCTION
################################################################################
# END FUNCTION tableDisplayArray(ptableColumnCount)
################################################################################


#############################################################################
# FUNCTION initTableColumnHeaderTextArray(ptableColumnCount)
#
# Set ColumnName (Identifier too ?)
#############################################################################
FUNCTION initTableColumnHeaderTextArray(ptableColumnCount)
	DEFINE ptableColumnCount SMALLINT
	    
    CALL mc_arrTableColumnHeaderText.Clear()	--Clear existing array data of table column names
     
    LET mc_arrTableColumnHeaderText[1] = "name"
    IF ptableColumnCount > 1 THEN  LET mc_arrTableColumnHeaderText[2] = "lname" END IF
    IF ptableColumnCount > 2 THEN  LET mc_arrTableColumnHeaderText[3] = "age" END IF
    IF ptableColumnCount > 3 THEN  LET mc_arrTableColumnHeaderText[4] = "email" END IF
    IF ptableColumnCount > 4 THEN  LET mc_arrTableColumnHeaderText[5] = "gender" END IF
    IF ptableColumnCount > 5 THEN  LET mc_arrTableColumnHeaderText[6] = "status" END IF
    IF ptableColumnCount > 6 THEN  LET mc_arrTableColumnHeaderText[7] = "password" END IF

END FUNCTION
#############################################################################
# END FUNCTION initTableColumnHeaderTextArray(ptableColumnCount)
#############################################################################


################################################################################
# FUNCTION fn_generateTable(pFormTable,pTableColumnCount)
#
#
################################################################################
FUNCTION fn_generateTable(pFormTable,pTableColumnCount)
	DEFINE pTableColumnCount SMALLINT
    DEFINE lde_percent DECIMAL(18,8)
    DEFINE l_tableColumnIndex INTEGER
    DEFINE lv_columnText STRING
    DEFINE lv_columnId STRING

    DEFINE pFormTable ui.Table	--Table
    DEFINE arrFormTableColumn DYNAMIC ARRAY OF ui.TableColumn --array of table columns
    DEFINE formTableColumn ui.TableColumn	--table column
    DEFINE l_gridLength ui.GridLength
    DEFINE textField ui.TextField	--tableColumn field
    
    #LET formTable = ui.Table.ForName("tb_dynamic")	--Reference form table tb_dynamic
    CALL initTableColumnHeaderTextArray(ptableColumnCount)
    LET lde_percent = 100/mc_arrTableColumnHeaderText.GetLength()	--Set Size in % / Equal column size
    --create screenrecord
    CALL form_set_screenrecord("tb_dynamic", mc_arrTableColumnHeaderText)	--NOT DOCUMENTED (create screen record dynamically)
    
		#for each tableColumn
    FOR l_tableColumnIndex = 1 TO pTableColumnCount  --mc_arrTableColumnHeaderText.GetLength()
				--Create pseudo text field for each table column
        LET textField = ui.Textfield.Create(mc_arrTableColumnHeaderText[l_tableColumnIndex]) --Create tableColumn field instance
        LET lv_columnId = "tbc",l_tableColumnIndex
        LET formTableColumn = ui.TableColumn.Create(trim(l_tableColumnIndex))	--create table column
        CALL formTableColumn.SetText(mc_arrTableColumnHeaderText[l_tableColumnIndex])	--Add table column header label
    
        LET l_gridLength.GridLengthValue=lde_percent CLIPPED, "%"
    
        CALL formTableColumn.SetColumnLength(l_gridLength)	--set the table column length


				CALL formTableColumn.SetControl(textField) --Add (pseudo) text field to each table column
   
        CALL arrFormTableColumn.append(formTableColumn)	--append(add) table column
    END FOR
    
    CALL pFormTable.SetTableColumns(arrFormTableColumn)--Create the table columns	
    CALL pFormTable.SetEnable(TRUE)	--enable formTable

END FUNCTION
################################################################################
# END FUNCTION fn_generateTable(pFormTable,pTableColumnCount)
################################################################################

################################################################################
# FUNCTION init_data(pRowCount)
#
#
################################################################################
FUNCTION init_data(pRowCount)
DEFINE pRowCount, i SMALLINT
	FOR i = 1 TO pRowCount
		LET mc_arrAllData[i].f1 = i USING "&&&&", " F1 Data"	
		LET mc_arrAllData[i].f2 = i USING "&&&&", " F2 Data"	
		LET mc_arrAllData[i].f3 = i USING "&&&&", " F3 Data"	
		LET mc_arrAllData[i].f4 = i USING "&&&&", " F4 Data"	
		LET mc_arrAllData[i].f5 = i USING "&&&&", " F5 Data"	
		LET mc_arrAllData[i].f6 = i USING "&&&&", " F6 Data"	
		LET mc_arrAllData[i].f7 = i USING "&&&&", " F7 Data"	
	END FOR

END FUNCTION
################################################################################
# END FUNCTION init_data(pRowCount)
################################################################################


############################################################################
# FUNCTION morphRecordArray(ptableColumnCount)
#
#
############################################################################
FUNCTION morphRecordArray(ptableColumnCount)
	DEFINE ptableColumnCount SMALLINT
	DEFINE i SMALLINT
	
	FOR i = 1 TO mc_arrAllData.GetLength()
		CASE ptableColumnCount
			WHEN 1
				LET mc_arr1ColumnData[i].f1 = mc_arrAllData[i].f1
			WHEN 2
				LET mc_arr2ColumnData[i].f1 = mc_arrAllData[i].f1
				LET mc_arr2ColumnData[i].f2 = mc_arrAllData[i].f2
			WHEN 3
				LET mc_arr3ColumnData[i].f1 = mc_arrAllData[i].f1
				LET mc_arr3ColumnData[i].f2 = mc_arrAllData[i].f2
				LET mc_arr3ColumnData[i].f3 = mc_arrAllData[i].f3
			WHEN 4
				LET mc_arr4ColumnData[i].f1 = mc_arrAllData[i].f1
				LET mc_arr4ColumnData[i].f2 = mc_arrAllData[i].f2
				LET mc_arr4ColumnData[i].f3 = mc_arrAllData[i].f3
				LET mc_arr4ColumnData[i].f4 = mc_arrAllData[i].f4
			WHEN 5
				LET mc_arr5ColumnData[i].f1 = mc_arrAllData[i].f1
				LET mc_arr5ColumnData[i].f2 = mc_arrAllData[i].f2
				LET mc_arr5ColumnData[i].f3 = mc_arrAllData[i].f3
				LET mc_arr5ColumnData[i].f4 = mc_arrAllData[i].f4
				LET mc_arr5ColumnData[i].f5 = mc_arrAllData[i].f5
			WHEN 6
				LET mc_arr6ColumnData[i].f1 = mc_arrAllData[i].f1
				LET mc_arr6ColumnData[i].f2 = mc_arrAllData[i].f2
				LET mc_arr6ColumnData[i].f3 = mc_arrAllData[i].f3
				LET mc_arr6ColumnData[i].f4 = mc_arrAllData[i].f4
				LET mc_arr6ColumnData[i].f5 = mc_arrAllData[i].f5				
				LET mc_arr6ColumnData[i].f6 = mc_arrAllData[i].f6				
			WHEN 7
				LET mc_arr7ColumnData[i].f1 = mc_arrAllData[i].f1
				LET mc_arr7ColumnData[i].f2 = mc_arrAllData[i].f2
				LET mc_arr7ColumnData[i].f3 = mc_arrAllData[i].f3
				LET mc_arr7ColumnData[i].f4 = mc_arrAllData[i].f4
				LET mc_arr7ColumnData[i].f5 = mc_arrAllData[i].f5				
				LET mc_arr7ColumnData[i].f6 = mc_arrAllData[i].f6				

		END CASE
	END FOR	
END FUNCTION	
############################################################################
# END FUNCTION morphRecordArray(ptableColumnCount)
############################################################################