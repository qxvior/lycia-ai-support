
##############################################
# Module Scope Variables
##############################################

	DEFINE m_myRec
		RECORD
			fComboBox1, fComboBox2,fComboBox3, fComboBox4 STRING
		END RECORD

##############################################
# MAIN
##############################################
MAIN

	define cmb ui.ComboBox
	define i, n integer
	define var1 string

	open window w with form "form/wig_comboBox_with_NULL_value" 

	CALL init()
	CALL info_update()

	INPUT BY NAME m_myRec.* WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
# @Bogdan, do you know how I can get ON CHANGE to work with comboBoxes ?
# It should be triggered whenever I select a different value
		ON CHANGE (m_myRecord.*)
			CALL info_update()
		
		ON ACTION "Info Display"
			CALL info_update()			

	END INPUT	

END MAIN

##############################################
# FUNCTION info_update()
##############################################
FUNCTION info_update()

	DISPLAY m_myRec.fComboBox1 TO fComboBox1Var
	DISPLAY m_myRec.fComboBox2 TO fComboBox2Var
	DISPLAY m_myRec.fComboBox3 TO fComboBox3Var
	DISPLAY m_myRec.fComboBox4 TO fComboBox4Var
		

END FUNCTION

##############################################
# FUNCTION init()
##############################################
FUNCTION init()

	LET m_myRec.fComboBox1 = NULL
	LET m_myRec.fComboBox2 = "A"
	LET m_myRec.fComboBox3 = "B"
	LET m_myRec.fComboBox4 = "C"
	

	CALL init_combo("fComboBox1")
	CALL init_combo("fComboBox2")
	CALL init_combo("fComboBox3")
	CALL init_combo("fComboBox4")
		
END FUNCTION

##############################################
# FUNCTION init_combo(p_comboIdentifier)
##############################################
FUNCTION init_combo(p_comboIdentifier)
	DEFINE 	p_comboIdentifier STRING
	
	CALL ui.ComboBox.forName(p_comboIdentifier).cmb.addItem(NULL, "NULL-Value" )
	CALL ui.ComboBox.forName(p_comboIdentifier).cmb.addItem("A", "A-Value" )
	CALL ui.ComboBox.forName(p_comboIdentifier).cmb.addItem("B", "B-Value" )
	CALL ui.ComboBox.forName(p_comboIdentifier).cmb.addItem("C", "C-Value" )

END FUNCTION