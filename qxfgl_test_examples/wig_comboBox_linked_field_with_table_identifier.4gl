#MAIN
#	DEFINE f1,f2,f3,f4,f5,f6 STRING
#	CALL ui.interface.frontcall("html5","scriptImport",["qx://application/combo_linked_field.js","nowait"],[])
#	call apply_theme("wig_comboBox_linked_field")
#
#	OPEN WINDOW w1 WITH FORM 'wig_comboBox_linked_field' 
#
#
#	WHILE TRUE 
#		INPUT BY NAME f1,f2,f3,f4,f5,f6
#--		DISPLAY f1 TO lb1
#	END WHILE
#
#END MAIN
	DEFINE comboRecord
		RECORD
			fComboBox1,fComboBox2, fComboBox3,fComboBox4,fComboBox5,fComboBox6,fComboBox7,fComboBox8 CHAR(4)
		END RECORD
	
	DEFINE arr_rec_comboData,arr_rec_comboData_view DYNAMIC ARRAY OF
		RECORD
			value CHAR(4),
			listLabel CHAR(30)
		END RECORD

	DEFINE varIndex ARRAY[8] OF INTEGER

	DEFINE tmpStr STRING
##################################################################################
# MAIN
#
#
##################################################################################
MAIN

				
	CALL ui.interface.frontcall("html5","scriptImport",["qx://application/js/combo_linked_field.js","nowait"],[])
	CALL ui_init()
			
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW myWin WITH FORM "form/wig_comboBox_linked_field_with_table_identifier"
	CALL ui.Interface.setText("ComboBox Theme/Jscript")

	CALL init_data1()
	CALL populateDynamicCombo()


	
	MENU
		ON ACTION "Display"
			DISPLAY BY NAME comboRecord.*
			CALL show_combo_data_text_value()		
			
		ON ACTION "INPUT"
			INPUT BY NAME comboRecord.*  WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
				BEFORE INPUT
					CALL show_combo_data_text_value()	

				ON ACTION "INIT 1"
					CALL init_data1()

				ON ACTION "Combo Init 1"
					CALL init_combo_dynamically1()

				ON ACTION "INIT 2"
					CALL init_data2()

				ON ACTION "Combo Init 2"
					CALL init_combo_dynamically2()
				
				
				ON CHANGE fComboBox1,fComboBox2,fComboBox3,fComboBox4,fComboBox5,fComboBox6,fComboBox7,fComboBox8
					CALL show_combo_data_text_value()
					CALL ui.interface.refresh()				


				AFTER FIELD fComboBox1
					CALL get_data(comboRecord.fComboBox1) RETURNING arr_rec_comboData[1].value, arr_rec_comboData[1].listLabel
					DISPLAY arr_rec_comboData[1].value TO fComboBox1Value
					DISPLAY arr_rec_comboData[1].listLabel TO fComboBox1Text
				AFTER FIELD fComboBox2					
					CALL get_data(comboRecord.fComboBox2) RETURNING arr_rec_comboData[2].value, arr_rec_comboData[2].listLabel
					DISPLAY arr_rec_comboData[2].value TO fComboBox2Value
					DISPLAY arr_rec_comboData[2].listLabel TO fComboBox2Text
				AFTER FIELD fComboBox3
					CALL get_data(comboRecord.fComboBox3) RETURNING arr_rec_comboData[3].value, arr_rec_comboData[3].listLabel
					DISPLAY arr_rec_comboData[3].value TO fComboBox3Value
					DISPLAY arr_rec_comboData[3].listLabel TO fComboBox3Text
				AFTER FIELD fComboBox4
					CALL get_data(comboRecord.fComboBox4) RETURNING arr_rec_comboData[4].value, arr_rec_comboData[4].listLabel
					DISPLAY arr_rec_comboData[4].value TO fComboBox4Value
					DISPLAY arr_rec_comboData[4].listLabel TO fComboBox4Text
				AFTER FIELD fComboBox15
					CALL get_data(comboRecord.fComboBox5) RETURNING arr_rec_comboData[5].value, arr_rec_comboData[5].listLabel
					DISPLAY arr_rec_comboData[5].value TO fComboBox5Value
					DISPLAY arr_rec_comboData[5].listLabel TO fComboBox5Text
				AFTER FIELD fComboBox6
					CALL get_data(comboRecord.fComboBox6) RETURNING arr_rec_comboData[6].value, arr_rec_comboData[6].listLabel
					DISPLAY arr_rec_comboData[6].value TO fComboBox6Value
					DISPLAY arr_rec_comboData[6].listLabel TO fComboBox6Text
				AFTER FIELD fComboBox7
					CALL get_data(comboRecord.fComboBox7) RETURNING arr_rec_comboData[7].value, arr_rec_comboData[7].listLabel
					DISPLAY arr_rec_comboData[7].value TO fComboBox7Value
					DISPLAY arr_rec_comboData[7].listLabel TO fComboBox7Text
				AFTER FIELD fComboBox8
					CALL get_data(comboRecord.fComboBox8) RETURNING arr_rec_comboData[8].value, arr_rec_comboData[8].listLabel
					DISPLAY arr_rec_comboData[8].value TO fComboBox8Value
					DISPLAY arr_rec_comboData[8].listLabel TO fComboBox8Text
					
						
				AFTER INPUT 
					CALL show_combo_data_text_value()
					CALL ui.interface.refresh()	
			END INPUT

		ON ACTION "Swap Choices"
			LET tmpStr = comboRecord.fComboBox1 
			LET comboRecord.fComboBox1 = comboRecord.fComboBox2
			LET comboRecord.fComboBox2 = comboRecord.fComboBox3
			LET comboRecord.fComboBox3 = comboRecord.fComboBox4
			LET comboRecord.fComboBox4 = comboRecord.fComboBox5
			LET comboRecord.fComboBox5 = comboRecord.fComboBox6
			LET comboRecord.fComboBox6 = comboRecord.fComboBox7
			LET comboRecord.fComboBox7 = comboRecord.fComboBox8
			LET comboRecord.fComboBox8 = tmpStr
			DISPLAY BY NAME comboRecord.*
			CALL show_combo_data_text_value()	
						
			CALL ui.interface.refresh()			
		

	    ON ACTION "HELP"
	    	CALL onlineHelp("Combobox",NULL)
	    	
		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU
	
END MAIN	

FUNCTION init_combo_dynamically1()
	DEFINE i SMALLINT
	
	CALL arr_rec_comboData.clear()

	LET i = 1
	LET arr_rec_comboData[i].value = "1001"
	LET arr_rec_comboData[i].listLabel = "Stock"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1002"
	LET arr_rec_comboData[i].listLabel = "Work in Progress"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1200"
	LET arr_rec_comboData[i].listLabel = "Bank Current Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1210"
	LET arr_rec_comboData[i].listLabel = "Bank Deposit Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1220"
	LET arr_rec_comboData[i].listLabel = "Building Society Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1230"
	LET arr_rec_comboData[i].listLabel = "Petty Cash"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1235"
	LET arr_rec_comboData[i].listLabel = "Cash Register"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1240"
	LET arr_rec_comboData[i].listLabel = "Company Credit Card"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1250"
	LET arr_rec_comboData[i].listLabel = "Credit Card Receipts"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1260"
	LET arr_rec_comboData[i].listLabel = "Clearing Account"
	LET i = i+1
	LET arr_rec_comboData[i].value = "4000"
	LET arr_rec_comboData[i].listLabel = "Sales Type"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "5000"
	LET arr_rec_comboData[i].listLabel = "Material Purchased"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "6000"
	LET arr_rec_comboData[i].listLabel = "Productive Labour"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "7000"
	LET arr_rec_comboData[i].listLabel = "Gross Wages"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "8000"
	LET arr_rec_comboData[i].listLabel = "Depreciation"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "9001"
	LET arr_rec_comboData[i].listLabel = "Taxation"
	

 	CALL populateDynamicCombo()

END FUNCTION

FUNCTION init_data1()
	DEFINE i SMALLINT

	CALL init_combo_dynamically1()  #init comboBox List
	
	LET arr_rec_comboData_view = arr_rec_comboData	
	LET varIndex[1] = 1
	LET varIndex[2] = 3
	LET varIndex[3] = 5
	LET varIndex[4] = 7
	LET varIndex[5] = 9
	LET varIndex[6] = 11
	LET varIndex[7] = 13
	LET varIndex[8] = 15
	
	LET comboRecord.fComboBox1 = arr_rec_comboData[varIndex[1]].value
	LET comboRecord.fComboBox2 = arr_rec_comboData[varIndex[2]].value
	LET comboRecord.fComboBox3 = arr_rec_comboData[varIndex[3]].value
	LET comboRecord.fComboBox4 = arr_rec_comboData[varIndex[4]].value
	LET comboRecord.fComboBox5 = arr_rec_comboData[varIndex[5]].value
	LET comboRecord.fComboBox6 = arr_rec_comboData[varIndex[6]].value
	LET comboRecord.fComboBox7 = arr_rec_comboData[varIndex[7]].value
	LET comboRecord.fComboBox8 = arr_rec_comboData[varIndex[8]].value
	
	DISPLAY arr_rec_comboData.getSize() TO list_count
	DISPLAY BY NAME comboRecord.*

END FUNCTION



FUNCTION init_combo_dynamically2()
	DEFINE i SMALLINT
	
	CALL arr_rec_comboData.clear()

	
	LET i = 0
	LET i = i + 1
	LET arr_rec_comboData[i].value = "0010"
	LET arr_rec_comboData[i].listLabel = "Freehold Property"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "0011"
	LET arr_rec_comboData[i].listLabel = "Leasehold Property"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1001"
	LET arr_rec_comboData[i].listLabel = "Stock"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1002"
	LET arr_rec_comboData[i].listLabel = "Work in Progress"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1100"
	LET arr_rec_comboData[i].listLabel = "Debtors Control Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1101"
	LET arr_rec_comboData[i].listLabel = "Sundry Debtors"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1200"
	LET arr_rec_comboData[i].listLabel = "Bank Current Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1210"
	LET arr_rec_comboData[i].listLabel = "Bank Deposit Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1220"
	LET arr_rec_comboData[i].listLabel = "Building Society Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1230"
	LET arr_rec_comboData[i].listLabel = "Petty Cash"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1235"
	LET arr_rec_comboData[i].listLabel = "Cash Register"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1240"
	LET arr_rec_comboData[i].listLabel = "Company Credit Card"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1250"
	LET arr_rec_comboData[i].listLabel = "Credit Card Receipts"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "1260"
	LET arr_rec_comboData[i].listLabel = "Clearing Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "2100"
	LET arr_rec_comboData[i].listLabel = "Creditors Control Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "2101"
	LET arr_rec_comboData[i].listLabel = "Sundry Creditors"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "3000"
	LET arr_rec_comboData[i].listLabel = "Ordinary Shares"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "3010"
	LET arr_rec_comboData[i].listLabel = "Preference Shares"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "4000"
	LET arr_rec_comboData[i].listLabel = "Sales Type"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "4100"
	LET arr_rec_comboData[i].listLabel = "Sales Type D"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "4101"
	LET arr_rec_comboData[i].listLabel = "Sales Type E"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "5000"
	LET arr_rec_comboData[i].listLabel = "Material Purchased"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "5001"
	LET arr_rec_comboData[i].listLabel = "Materials Imported"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "5002"
	LET arr_rec_comboData[i].listLabel = "Miscellaneous Purchases"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "6000"
	LET arr_rec_comboData[i].listLabel = "Productive Labour"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "6001"
	LET arr_rec_comboData[i].listLabel = "Cost of Sales Labour"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "6002"
	LET arr_rec_comboData[i].listLabel = "Sub-Contractors"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "7000"
	LET arr_rec_comboData[i].listLabel = "Gross Wages"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "7001"
	LET arr_rec_comboData[i].listLabel = "Directors Salaries"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "7002"
	LET arr_rec_comboData[i].listLabel = "Directors Remuneration"	
	LET i = i + 1
	LET arr_rec_comboData[i].value = "8000"
	LET arr_rec_comboData[i].listLabel = "Depreciation"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "8001"
	LET arr_rec_comboData[i].listLabel = "Plant/Machinery Depreciation"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "8002"
	LET arr_rec_comboData[i].listLabel = "Furniture/Fitting Depreciation"	
	LET i = i + 1
	LET arr_rec_comboData[i].value = "9001"
	LET arr_rec_comboData[i].listLabel = "Taxation"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "9998"
	LET arr_rec_comboData[i].listLabel = "Suspense Account"
	LET i = i + 1
	LET arr_rec_comboData[i].value = "9999"
	LET arr_rec_comboData[i].listLabel = "Mispostings Account"

 	CALL populateDynamicCombo()


END FUNCTION

FUNCTION init_data2()
	DEFINE i SMALLINT
	
	CALL init_combo_dynamically2()  #init comboBox List			
	LET arr_rec_comboData_view = arr_rec_comboData


	LET varIndex[1] = 1
	LET varIndex[2] = 4
	LET varIndex[3] = 8
	LET varIndex[4] = 12
	LET varIndex[5] = 16
	LET varIndex[6] = 20
	LET varIndex[7] = 24
	LET varIndex[8] = 28
	
	LET comboRecord.fComboBox1 = arr_rec_comboData[varIndex[1]].value
	LET comboRecord.fComboBox2 = arr_rec_comboData[varIndex[2]].value
	LET comboRecord.fComboBox3 = arr_rec_comboData[varIndex[3]].value
	LET comboRecord.fComboBox4 = arr_rec_comboData[varIndex[4]].value
	LET comboRecord.fComboBox5 = arr_rec_comboData[varIndex[5]].value
	LET comboRecord.fComboBox6 = arr_rec_comboData[varIndex[6]].value
	LET comboRecord.fComboBox7 = arr_rec_comboData[varIndex[7]].value
	LET comboRecord.fComboBox8 = arr_rec_comboData[varIndex[8]].value
	

	DISPLAY arr_rec_comboData.getSize() TO list_count	
	DISPLAY BY NAME comboRecord.*

END FUNCTION


FUNCTION populateDynamicCombo()
	CALL initComboBox("fComboBox1")
	CALL initComboBox("fComboBox2")
	CALL initComboBox("fComboBox3")
	CALL initComboBox("fComboBox4")
	CALL initComboBox("fComboBox5")
	CALL initComboBox("fComboBox6")
	CALL initComboBox("fComboBox7")
	CALL initComboBox("fComboBox8")
	
	CALL ui.interface.refresh()
END FUNCTION
	
###############################################################
# FUNCTION initCombo_projName(p_comboFieldName)
# Argument: p_comboFieldName  - the field name of the comboList Field
# Return: Void
# Populates a comboBox with supplier names and codes
# Shown is the Supplier Code
###############################################################
FUNCTION initComboBox(p_comboFieldName)
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
	CALL ui.ComboBox.ForName(p_comboFieldName).clear()
	
	FOR l_rowCount = 1 TO arr_rec_comboData.getLength()
		CALL ui.ComboBox.ForName(p_comboFieldName).addItem(arr_rec_comboData[l_rowCount].value,arr_rec_comboData[l_rowCount].listLabel)
	END FOR

END FUNCTION



FUNCTION show_combo_data_text_value()

					CALL get_data(comboRecord.fComboBox1) RETURNING arr_rec_comboData[1].value, arr_rec_comboData[1].listLabel
					DISPLAY arr_rec_comboData[1].value TO fComboBox1Value
					DISPLAY arr_rec_comboData[1].listLabel TO fComboBox1Text
					
					CALL get_data(comboRecord.fComboBox2) RETURNING arr_rec_comboData[2].value, arr_rec_comboData[2].listLabel
					DISPLAY arr_rec_comboData[2].value TO fComboBox2Value
					DISPLAY arr_rec_comboData[2].listLabel TO fComboBox2Text

					CALL get_data(comboRecord.fComboBox3) RETURNING arr_rec_comboData[3].value, arr_rec_comboData[3].listLabel
					DISPLAY arr_rec_comboData[3].value TO fComboBox3Value
					DISPLAY arr_rec_comboData[3].listLabel TO fComboBox3Text

					CALL get_data(comboRecord.fComboBox4) RETURNING arr_rec_comboData[4].value, arr_rec_comboData[4].listLabel
					DISPLAY arr_rec_comboData[4].value TO fComboBox4Value
					DISPLAY arr_rec_comboData[4].listLabel TO fComboBox4Text

					CALL get_data(comboRecord.fComboBox5) RETURNING arr_rec_comboData[5].value, arr_rec_comboData[5].listLabel
					DISPLAY arr_rec_comboData[5].value TO fComboBox5Value
					DISPLAY arr_rec_comboData[5].listLabel TO fComboBox5Text

					CALL get_data(comboRecord.fComboBox6) RETURNING arr_rec_comboData[6].value, arr_rec_comboData[6].listLabel
					DISPLAY arr_rec_comboData[6].value TO fComboBox6Value
					DISPLAY arr_rec_comboData[6].listLabel TO fComboBox6Text

					CALL get_data(comboRecord.fComboBox7) RETURNING arr_rec_comboData[7].value, arr_rec_comboData[7].listLabel
					DISPLAY arr_rec_comboData[7].value TO fComboBox7Value
					DISPLAY arr_rec_comboData[7].listLabel TO fComboBox7Text

					CALL get_data(comboRecord.fComboBox8) RETURNING arr_rec_comboData[8].value, arr_rec_comboData[8].listLabel
					DISPLAY arr_rec_comboData[8].value TO fComboBox8Value
					DISPLAY arr_rec_comboData[8].listLabel TO fComboBox8Text

END FUNCTION


FUNCTION get_data(p_value)
	DEFINE p_value CHAR(4)
	DEFINE i SMALLINT
	
	FOR i = 1 TO arr_rec_comboData.getLength()
		IF trim(arr_rec_comboData[i].value) = trim(p_value) THEN
			RETURN arr_rec_comboData_view[i].value, arr_rec_comboData_view[i].listLabel 
		END IF 
	END FOR
{
	CASE p_value
		WHEN "1001"
			RETURN arr_rec_comboData_view[1].value, arr_rec_comboData_view[1].listLabel 
		WHEN "1002"
			RETURN arr_rec_comboData_view[2].value, arr_rec_comboData_view[2].listLabel		
		WHEN "4000"
			RETURN arr_rec_comboData_view[3].value, arr_rec_comboData_view[3].listLabel		
		WHEN "5000"
			RETURN arr_rec_comboData_view[4].value, arr_rec_comboData_view[4].listLabel		
		WHEN "6000"
			RETURN arr_rec_comboData_view[5].value, arr_rec_comboData_view[5].listLabel	
		WHEN "7000"
			RETURN arr_rec_comboData_view[6].value, arr_rec_comboData_view[6].listLabel	
		WHEN "8000"
			RETURN arr_rec_comboData_view[7].value, arr_rec_comboData_view[7].listLabel	
		WHEN "9000"
			RETURN arr_rec_comboData_view[8].value, arr_rec_comboData_view[8].listLabel	
											
		
	END CASE
}
END FUNCTION