#	DEFINE fComboBoxStaticInt1,fComboBoxStaticInt2,fComboBoxStaticInt1Value,fComboBoxStaticInt2Value, fComboBox3 SMALLINT
	DEFINE fComboBoxStaticInt3, fComboBoxDynamicInt3 SMALLINT
	DEFINE fComboBoxStaticStr3, fComboBoxDynamicStr3 STRING
	
	DEFINE myRecStatic 
		RECORD
			fComboBoxStaticInt1, fComboBoxStaticInt2 SMALLINT, --tabPage1
			fComboBoxStaticStr1, fComboBoxStaticStr2 STRING --tabPage1
		END RECORD


	DEFINE myRecDynamic
		RECORD
			fComboBoxDynamicInt1, fComboBoxDynamicInt2 SMALLINT, --tabPage2
			fComboBoxDynamicStr1, fComboBoxDynamicStr2 STRING --tabPage2
		END RECORD		
		

##################################################################################
# MAIN
#
#
##################################################################################
MAIN		
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL ui_init()
		
	OPEN WINDOW myWin WITH FORM "form/wig_comboBox_editable"
	CALL ui.Interface.setText("CB-Editable")
	
	#Tab1	
	LET myRecStatic.fComboBoxStaticInt1 = 1
	LET myRecStatic.fComboBoxStaticInt2 = 1
	LET myRecStatic.fComboBoxStaticStr1 = "Yes"
	LET myRecStatic.fComboBoxStaticStr2 = "Y"
	
	#Tab2
	LET myRecDynamic.fComboBoxDynamicInt1 = 1	
	LET myRecDynamic.fComboBoxDynamicInt2 = 1
	LET myRecDynamic.fComboBoxDynamicStr1 = "John"	
	LET myRecDynamic.fComboBoxDynamicStr2 = "Y"

	CALL populateDynamicCombo()	
	CALL displayData()		
	
	DIALOG ATTRIBUTE (UNBUFFERED)
	
		#TabPage1
		INPUT BY NAME myRecStatic.* WITHOUT DEFAULTS
			ON CHANGE fComboBoxStaticInt1,fComboBoxStaticInt2,fComboBoxStaticStr1,fComboBoxStaticStr2
						
				DISPLAY myRecStatic.fComboBoxStaticInt1 TO fComboBoxStaticInt1Value
				DISPLAY myRecStatic.fComboBoxStaticInt2 TO fComboBoxStaticInt2Value
				DISPLAY myRecStatic.fComboBoxStaticStr1 TO fComboBoxStaticStr1Value
				DISPLAY myRecStatic.fComboBoxStaticStr2 TO fComboBoxStaticStr2Value
				CALL ui.interface.refresh()					

				CALL displayData()
				CALL ui.interface.refresh()	
						
			ON ACTION "Swap Values"
				LET fComboBoxStaticInt3 = myRecStatic.fComboBoxStaticInt1
				LET myRecStatic.fComboBoxStaticInt1 = myRecStatic.fComboBoxStaticInt2
				LET myRecStatic.fComboBoxStaticInt2 = fComboBoxStaticInt3

				LET fComboBoxStaticStr3 = myRecStatic.fComboBoxStaticStr1
				LET myRecStatic.fComboBoxStaticStr1 = myRecStatic.fComboBoxStaticStr2
				LET myRecStatic.fComboBoxStaticStr2 = fComboBoxStaticStr3
		
				DISPLAY BY NAME myRecStatic.fComboBoxStaticInt1, myRecStatic.fComboBoxStaticInt2 , myRecStatic.fComboBoxStaticStr1, myRecStatic.fComboBoxStaticStr2
				DISPLAY myRecStatic.fComboBoxStaticInt1 TO fComboBoxStaticInt1Value
				DISPLAY myRecStatic.fComboBoxStaticInt2 TO fComboBoxStaticInt2Value						
				DISPLAY myRecStatic.fComboBoxStaticStr1 TO fComboBoxStaticStr1Value
				DISPLAY myRecStatic.fComboBoxStaticStr2 TO fComboBoxStaticStr2Value						

				CALL ui.interface.refresh()

			ON ACTION "Increment"
				IF myRecStatic.fComboBoxStaticInt1 < 2 THEN
					LET myRecStatic.fComboBoxStaticInt1 = myRecStatic.fComboBoxStaticInt1 + 1
				ELSE
					LET myRecStatic.fComboBoxStaticInt1 = 0
				END IF
		
				IF myRecStatic.fComboBoxStaticInt2 < 2 THEN
					LET myRecStatic.fComboBoxStaticInt2 = myRecStatic.fComboBoxStaticInt2 + 1
				ELSE
					LET myRecStatic.fComboBoxStaticInt2 = 0
				END IF


				DISPLAY BY NAME myRecStatic.fComboBoxStaticInt1, myRecStatic.fComboBoxStaticInt2 
				DISPLAY myRecStatic.fComboBoxStaticInt1 TO fComboBoxStaticInt1Value
				DISPLAY myRecStatic.fComboBoxStaticInt2 TO fComboBoxStaticInt2Value				
				DISPLAY myRecStatic.fComboBoxStaticStr1 TO fComboBoxStaticStr1Value
				DISPLAY myRecStatic.fComboBoxStaticStr2 TO fComboBoxStaticStr2Value		
				CALL ui.interface.refresh()			
			
			AFTER INPUT 
				CALL displayData()		
							
		END INPUT

		#TabPage2
		INPUT BY NAME myRecDynamic.* WITHOUT DEFAULTS

			ON CHANGE fComboBoxDynamicInt1,fComboBoxDynamicInt2,fComboBoxDynamicStr1,fComboBoxDynamicStr2
				DISPLAY myRecDynamic.fComboBoxDynamicInt1 TO fComboBoxDynamicInt1Value
				DISPLAY myRecDynamic.fComboBoxDynamicInt2 TO fComboBoxDynamicInt2Value
				DISPLAY myRecDynamic.fComboBoxDynamicStr1 TO fComboBoxDynamicStr1Value
				DISPLAY myRecDynamic.fComboBoxDynamicStr2 TO fComboBoxDynamicStr2Value
				CALL ui.interface.refresh()					

			AFTER INPUT 
				CALL displayData()		
					
		END INPUT

		ON ACTION "REFRESH"
			CALL displayData()

	    ON ACTION "HELP"
	    	CALL onlineHelp("Combobox",NULL)
	    						
		ON ACTION "CANCEL"
			EXIT DIALOG		

	END DIALOG

END MAIN	


##################################################################################
# FUNCTION displayData()
#
#
##################################################################################
FUNCTION displayData()
	#tab1
	DISPLAY BY NAME myRecStatic.* 

	DISPLAY myRecStatic.fComboBoxStaticInt1 TO fComboBoxStaticInt1Value
	DISPLAY myRecStatic.fComboBoxStaticInt2 TO fComboBoxStaticInt2Value	

	DISPLAY myRecStatic.fComboBoxStaticStr1 TO fComboBoxStaticStr1Value
	DISPLAY myRecStatic.fComboBoxStaticStr2 TO fComboBoxStaticStr2Value	

	#tab2
	DISPLAY BY NAME myRecDynamic.* 

	DISPLAY myRecDynamic.fComboBoxDynamicInt1 TO fComboBoxDynamicInt1Value
	DISPLAY myRecDynamic.fComboBoxDynamicInt2 TO fComboBoxDynamicInt2Value	

	DISPLAY myRecDynamic.fComboBoxDynamicStr1 TO fComboBoxDynamicStr1Value
	DISPLAY myRecDynamic.fComboBoxDynamicStr2 TO fComboBoxDynamicStr2Value	

	CALL ui.interface.refresh()
				
END FUNCTION


##################################################################################
# FUNCTION populateDynamicCombo()
#
#
##################################################################################
FUNCTION populateDynamicCombo()
	CALL initComboBoxInt1("fComboBoxDynamicInt1")
	CALL initComboBoxInt2("fComboBoxDynamicInt2")
	CALL initComboBoxStr1("fComboBoxDynamicStr1")
	CALL initComboBoxStr2("fComboBoxDynamicStr2")
	CALL ui.interface.refresh()
END FUNCTION
	
	
###############################################################
# FUNCTION initCombo_projName(p_comboFieldName)
# Argument: p_comboFieldName  - the field name of the comboList Field
# Return: Void
# Populates a comboBox with supplier names and codes
# Shown is the Supplier Code
###############################################################
FUNCTION initComboBoxInt1(p_comboFieldName)
	DEFINE p_comboFieldName STRING
	DEFINE l_comboValue_arr DYNAMIC ARRAY OF SMALLINT
	DEFINE l_rowCount SMALLINT
	
	#If you would do it driven by  a database			
	#DEFINE l_rowCount SMALLINT
  #    	
	#DECLARE projName_q CURSOR FOR
  # SELECT DISTINCT  tb_proj_id
  #    FROM qxt_toolbar
  #    #WHERE cursupp.supp_code MATCHES srch_string
  #    ORDER BY tb_proj_id
  #
  #LET l_rowCount = 1
	#
	#
  #FOREACH projName_q INTO l_progName_arr[l_rowCount]
  #  #CALL fgl_list_set(p_comboFieldName,l_rowCount, l_suppCode_arr[l_rowCount].supp_code)
  #  CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_progName_arr[l_rowCount],l_progName_arr[l_rowCount])
  #  LET l_rowCount = l_rowCount + 1
  #END FOREACH
	#

	LET l_comboValue_arr[1] = 1
	LET l_comboValue_arr[2] = 2
	LET l_comboValue_arr[3] = 3
	LET l_comboValue_arr[4] = 4
	
	FOR l_rowCount = 1 TO 	l_comboValue_arr.getSize()
		CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_comboValue_arr[l_rowCount],l_comboValue_arr[l_rowCount])
	END FOR
					
	RETURN l_rowCount -1

END FUNCTION


###############################################################
# FUNCTION initCombo_projName(p_comboFieldName)
# Argument: p_comboFieldName  - the field name of the comboList Field
# Return: Void
# Populates a comboBox with supplier names and codes
# Shown is the Supplier Code
###############################################################
FUNCTION initComboBoxStr1(p_comboFieldName)
	DEFINE p_comboFieldName STRING
	DEFINE l_comboValue_arr DYNAMIC ARRAY OF STRING
	DEFINE l_rowCount SMALLINT
	
	#If you would do it driven by  a database			
	#DEFINE l_rowCount SMALLINT
  #    	
	#DECLARE projName_q CURSOR FOR
  # SELECT DISTINCT  tb_proj_id
  #    FROM qxt_toolbar
  #    #WHERE cursupp.supp_code MATCHES srch_string
  #    ORDER BY tb_proj_id
  #
  #LET l_rowCount = 1
	#
	#
  #FOREACH projName_q INTO l_progName_arr[l_rowCount]
  #  #CALL fgl_list_set(p_comboFieldName,l_rowCount, l_suppCode_arr[l_rowCount].supp_code)
  #  CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_progName_arr[l_rowCount],l_progName_arr[l_rowCount])
  #  LET l_rowCount = l_rowCount + 1
  #END FOREACH
	#

	LET l_comboValue_arr[1] = "Mike"
	LET l_comboValue_arr[2] = "John"
	LET l_comboValue_arr[3] = "Angela"
	LET l_comboValue_arr[4] = "Chrisi"
	
	FOR l_rowCount = 1 TO 	l_comboValue_arr.getSize()
		CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_comboValue_arr[l_rowCount],l_comboValue_arr[l_rowCount])
	END FOR
					
	RETURN l_rowCount -1

END FUNCTION



###############################################################
# FUNCTION initCombo_projName(p_comboFieldName)
# Argument: p_comboFieldName  - the field name of the comboList Field
# Return: Void
# Populates a comboBox with supplier names and codes
# Shown is the Supplier Code
###############################################################
FUNCTION initComboBoxInt2(p_comboFieldName)
	DEFINE p_comboFieldName STRING
	DEFINE l_comboValue_arr DYNAMIC ARRAY OF 
		RECORD
		 displayValue STRING,
		 variableValue SMALLINT
		END RECORD
	DEFINE l_rowCount SMALLINT
	
	#If you would do it driven by  a database			
	#DEFINE l_rowCount SMALLINT
  #    	
	#DECLARE projName_q CURSOR FOR
  # SELECT DISTINCT  tb_proj_id
  #    FROM qxt_toolbar
  #    #WHERE cursupp.supp_code MATCHES srch_string
  #    ORDER BY tb_proj_id
  #
  #LET l_rowCount = 1
	#
	#
  #FOREACH projName_q INTO l_progName_arr[l_rowCount]
  #  #CALL fgl_list_set(p_comboFieldName,l_rowCount, l_suppCode_arr[l_rowCount].supp_code)
  #  CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_progName_arr[l_rowCount],l_progName_arr[l_rowCount])
  #  LET l_rowCount = l_rowCount + 1
  #END FOREACH
	#

	LET l_comboValue_arr[1].* = "Top",1
	LET l_comboValue_arr[2].* = "Medium",2
	LET l_comboValue_arr[3].* = "Low",3
	LET l_comboValue_arr[4].* = "N/A",4
	
	FOR l_rowCount = 1 TO 	l_comboValue_arr.getSize()
		CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_comboValue_arr[l_rowCount].variableValue,l_comboValue_arr[l_rowCount].displayValue)
	END FOR
					
	RETURN l_rowCount -1

END FUNCTION


###############################################################
# FUNCTION initCombo_projName(p_comboFieldName)
# Argument: p_comboFieldName  - the field name of the comboList Field
# Return: Void
# Populates a comboBox with supplier names and codes
# Shown is the Supplier Code
###############################################################
FUNCTION initComboBoxStr2(p_comboFieldName)
	DEFINE p_comboFieldName STRING
	DEFINE l_comboValue_arr DYNAMIC ARRAY OF 
		RECORD
		 displayValue STRING,
		 variableValue CHAR
		END RECORD
	DEFINE l_rowCount SMALLINT
	
	#If you would do it driven by  a database			
	#DEFINE l_rowCount SMALLINT
  #    	
	#DECLARE projName_q CURSOR FOR
  # SELECT DISTINCT  tb_proj_id
  #    FROM qxt_toolbar
  #    #WHERE cursupp.supp_code MATCHES srch_string
  #    ORDER BY tb_proj_id
  #
  #LET l_rowCount = 1
	#
	#
  #FOREACH projName_q INTO l_progName_arr[l_rowCount]
  #  #CALL fgl_list_set(p_comboFieldName,l_rowCount, l_suppCode_arr[l_rowCount].supp_code)
  #  CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_progName_arr[l_rowCount],l_progName_arr[l_rowCount])
  #  LET l_rowCount = l_rowCount + 1
  #END FOREACH
	#

	LET l_comboValue_arr[1].* = "Yes","Y"
	LET l_comboValue_arr[2].* = "No","N"
	LET l_comboValue_arr[3].* = "Other","O"
	LET l_comboValue_arr[4].* = "Cancel","C"
	
	FOR l_rowCount = 1 TO 	l_comboValue_arr.getSize()
		CALL ui.ComboBox.ForName(p_comboFieldName).addItem(l_comboValue_arr[l_rowCount].variableValue,l_comboValue_arr[l_rowCount].displayValue)
	END FOR
					
	RETURN l_rowCount -1

END FUNCTION
