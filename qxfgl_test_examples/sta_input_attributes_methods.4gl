################################################################################
# Module Scope
################################################################################
DEFINE myRec, myRecMain 
	RECORD
		invAddress1, invAddress2,invAddress3,invPostCode,invCity,invState STRING,
		delAddress1, delAddress2,delAddress3,delPostCode,delCity,delState STRING,
		notes STRING,
		f_1_1,f_1_2,f_1_3,f_1_4,f_1_5,
		f_2_1,f_2_2,f_2_3,f_2_4,f_2_5,
		f_3_1,f_3_2,f_3_3,f_3_4,f_3_5,
		f_4_1,f_4_2,f_4_3,f_4_4,f_4_5,
		f_5_1,f_5_2,f_5_3,f_5_4,f_5_5 STRING
	END RECORD

	DEFINE mod_monitor STRING
	DEFINE mod_monitor_count SMALLINT
	
################################################################################
# MAIN
#
# Demo Example to show various options/ways to manipuate 
# the field validation and navigation order (mouse & keys)
################################################################################
MAIN
	DEFER INTERRUPT
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit	
	
	CALL ui_init()
	CALL initData()
	
	OPEN WINDOW mywin WITH FORM "form/sta_input_attributes_methods" 
	CALL ui.Interface.setText("Field Order Form")
	
	CALL initData()
	
	MENU
		BEFORE MENU
			CALL fgl_dialog_setkeylabel("INPUT-ORDER","Default Input","{CONTEXT}/public/querix/icon/svg/24/ic_mode_edit_24px.svg",11,FALSE,"INPUT WITHOUT DEFAULT with default field order defined by the order of the program variables")
			CALL fgl_dialog_setkeylabel("INPUT-WITH-DEFAULT","WITH DEFAULT","{CONTEXT}/public/querix/icon/svg/24/ic_mode_edit_24px.svg",12,FALSE,"INPUT (with default) with default field order defined by the order of the program variables- Show REQUIRED")
			CALL fgl_dialog_setkeylabel("INPUT-ORDER-FIELDORDER-FALSE","Inp fieldorder()","{CONTEXT}/public/querix/icon/svg/24/ic_mode_edit_24px.svg",13,FALSE,"INPUT with default field order defined by the order of the program variables and BEBORE/AFTER Field reduction")
			CALL fgl_dialog_setkeylabel("ORDER-UNCONSTRAINT","Order Unconstraint","{CONTEXT}/public/querix/icon/svg/24/ic_mode_edit_24px.svg",14,FALSE,"INPUT with default field order BUT field navigation keys are unconstraint")
			CALL fgl_dialog_setkeylabel("FORM-ORDER","Form Field Order","{CONTEXT}/public/querix/icon/svg/24/ic_mode_edit_24px.svg",15,FALSE,"INPUT Field order defind within the form using TABINDEX")
		
		ON ACTION "DISPLAY"
			DISPLAY BY NAME myRecMain.*

	# With fgl_dialog_fieldorder(TRUE) NOTE: This is the default and does not need to be specified/set ----------------------------------------------------

		#Normal/Default INPUT WITHOUT DEFAULT - INPUT variable field order logic			
		ON ACTION "INPUT-ORDER"
			DISPLAY "Normal INPUT WITHOUT DEFAULTS - Field order is defined by input variable order" TO lbTitle
			DISPLAY "INPUT BY NAME myRec.*" TO lbInfo1
			DISPLAY "Form field property <required=true> is supported (but we recommend NOT to manage field validation on a form/presenation layer" TO lbInfo2
			CALL edit_with_input_field_order()
			DISPLAY BY NAME myRecMain.*
			CALL default_title_text()

		#Normal/Default INPUT WITH DEFAULT - INPUT variable field order logic	
		ON ACTION "INPUT-WITH-DEFAULT" #demonstrate form field property REQUIRED
			DISPLAY "Normal INPUT (WITH DEFAULTS) - Field order is defined by input variable order" TO lbTitle
			DISPLAY "INPUT BY NAME myRec.* WITHOUT DEFAULT" TO lbInfo1
			DISPLAY "Fields are initialized by the variable data Form field property <required=true> is ignored / NOT used" TO lbInfo2			
			CALL edit_with_input_field_order_with_defaults()
			DISPLAY BY NAME myRecMain.*
			CALL default_title_text()

		# With fgl_dialog_fieldorder(FALSE) 
		ON ACTION "INPUT-ORDER-FIELDORDER-FALSE"
			DISPLAY "INPUT WITH DEFAULTS BUT BEFORE INPUT - CALL fgl_dialog_fieldorder(FALSE)" TO lbTitle
			DISPLAY "BEFORE INPUT CALL fgl_dialog_fieldorder(FALSE)" TO lbInfo1
			DISPLAY "Only the current AFTER FIELD and target BEFORE FIELD is processed <Existing 4gl may requires adopting>" TO lbInfo2			
			CALL edit_with_input_field_order_fieldorder_false()
			DISPLAY BY NAME myRecMain.*
			CALL default_title_text()

		#Normal/Default INPUT order logic	with OPTIONS FIELD ORDER UNCONSTRAINT	
		ON ACTION "ORDER-UNCONSTRAINT"
			DISPLAY "INPUT WITH DEFAULTS BUT WITH OPTIONS FIELD ORDER UNCONSTRAINED" TO lbTitle
			DISPLAY "OPTIONS FIELD ORDER UNCONSTRAINED" TO lbInfo1
			DISPLAY "Free cursor navigation and only the current AFTER/BEFORE FIELD is processed <Existing 4gl may requires adopting>" TO lbInfo2			
			CALL edit_with_input_field_order_unconstrained()
			DISPLAY BY NAME myRecMain.* 
			CALL default_title_text()
 
		# ATTRIBUTE(FIELD ORDER FORM)
		ON ACTION "FORM-ORDER"
			DISPLAY "INPUT WITH DEFAULTS BUT using ATTRIBUTE(FIELD ORDER FORM) and form TABINDEX" TO lbTitle
			DISPLAY "ATTRIBUTE(FIELD ORDER FORM) and form field property TABINDEX" TO lbInfo1
			DISPLAY "Field Order is defined on the form level using TABINDEX <Existing 4gl may requires adopting>" TO lbInfo2	
			CALL edit_with_form_tabindex_field_order()
			DISPLAY BY NAME myRecMain.*
			CALL default_title_text()

		ON ACTION "CLEAR FORM"
			CLEAR FORM	

		ON ACTION "RESET"
			CALL initData()
			DISPLAY BY NAME myRecMain.*
					
		ON ACTION "CANCEL"
			EXIT MENU

    ON ACTION "HELP"
    	CALL onlineHelp("INPUT",NULL)			
	END MENU

END MAIN	
################################################################################
# END MAIN
################################################################################

################################################################################
# FUNCTION edit_with_input_field_order()
#
# INPUT - Field order is defined/used by the order of the INPUT field 
# In this case the order of the record elements myRec.*
# PS: WITHOUT DEFAULTS - field variables will be initialized with the corresponding input variable values
################################################################################
FUNCTION edit_with_input_field_order()
	CALL outMonitor_clear()		
	LET myRec.* = myRecMain.*

	CALL outMonitor("INPUT BY NAME myRec.*")	
	INPUT BY NAME myRec.* WITHOUT DEFAULTS #Note: Without Defaults = variable values WITH DEFAULTS = initialize fields with variable data
		BEFORE INPUT
			CALL outMonitor("BEFORE INPUT <empty>")
			
    ON ACTION "HELP"
    	CALL onlineHelp("Input",NULL)
    					
		ON ACTION "CANCEL"
			EXIT INPUT				

		BEFORE FIELD invAddress1
			CALL outMonitor("BEFORE FIELD invAddress1")
		AFTER FIELD invAddress1
			CALL outMonitor("AFTER FIELD invAddress1")
			IF field_touched(invAddress1) THEN
				CALL outMonitor("***Modified FIELD invAddress1")							
				CALL DIALOG.SetFieldTouched("invAddress1", FALSE)
			END IF
			
		BEFORE FIELD invAddress2
			CALL outMonitor("BEFORE FIELD invAddress2")
		AFTER FIELD invAddress2
			CALL outMonitor("AFTER FIELD invAddress2")
			IF field_touched(invAddress2) THEN
				CALL outMonitor("***Modified FIELD invAddress2")							
				CALL DIALOG.SetFieldTouched("invAddress2", FALSE)
			END IF

		BEFORE FIELD invAddress3
			CALL outMonitor("BEFORE FIELD invAddress3")
		AFTER FIELD invAddress3
			CALL outMonitor("AFTER FIELD invAddress3")
			IF field_touched(invAddress3) THEN
				CALL outMonitor("***Modified FIELD invAddress3")							
				CALL DIALOG.SetFieldTouched("invAddress3", FALSE)
			END IF
			
		BEFORE FIELD invPostCode
			CALL outMonitor("BEFORE FIELD invPostCode")
		AFTER FIELD invPostCode
			CALL outMonitor("AFTER FIELD invPostCode")
			IF field_touched(invPostCode) THEN
				CALL outMonitor("***Modified FIELD invPostCode")							
				CALL DIALOG.SetFieldTouched("invPostCode", FALSE)
			END IF
						
		BEFORE FIELD invCity
			CALL outMonitor("BEFORE FIELD invCity")
		AFTER FIELD invCity
			CALL outMonitor("AFTER FIELD invCity")
			IF field_touched(invCity) THEN
				CALL outMonitor("***Modified FIELD invCity")							
				CALL DIALOG.SetFieldTouched("invCity", FALSE)
			END IF
						
		BEFORE FIELD invState
			CALL outMonitor("BEFORE FIELD invState")
		AFTER FIELD invState
			CALL outMonitor("AFTER FIELD invState")
			IF field_touched(invState) THEN
				CALL outMonitor("***Modified FIELD invState")							
				CALL DIALOG.SetFieldTouched("invState", FALSE)
			END IF
									
		BEFORE FIELD delAddress1
			CALL outMonitor("BEFORE FIELD delAddress1")
		AFTER FIELD delAddress1
			CALL outMonitor("AFTER FIELD delAddress1")
			IF field_touched(delAddress1) THEN
				CALL outMonitor("***Modified FIELD delAddress1")							
				CALL DIALOG.SetFieldTouched("delAddress1", FALSE)
			END IF
						
		BEFORE FIELD delAddress2
			CALL outMonitor("BEFORE FIELD delAddress2")
		AFTER FIELD delAddress2
			CALL outMonitor("AFTER FIELD delAddress2")
			IF field_touched(delAddress2) THEN
				CALL outMonitor("***Modified FIELD delAddress2")							
				CALL DIALOG.SetFieldTouched("delAddress2", FALSE)
			END IF
						
		BEFORE FIELD delAddress3
			CALL outMonitor("BEFORE FIELD delAddress3")
		AFTER FIELD delAddress3
			CALL outMonitor("AFTER FIELD delAddress3")
			IF field_touched(delAddress3) THEN
				CALL outMonitor("***Modified FIELD delAddress3")							
				CALL DIALOG.SetFieldTouched("delAddress3", FALSE)
			END IF
						
		BEFORE FIELD delPostCode
			CALL outMonitor("BEFORE FIELD delPostCode")
		AFTER FIELD delPostCode
			CALL outMonitor("AFTER FIELD delPostCode")
			IF field_touched(delPostCode) THEN
				CALL outMonitor("***Modified FIELD delPostCode")							
				CALL DIALOG.SetFieldTouched("delPostCode", FALSE)
			END IF
						
		BEFORE FIELD delCity
			CALL outMonitor("BEFORE FIELD delCity")
		AFTER FIELD delCity
			CALL outMonitor("AFTER FIELD delCity")
			IF field_touched(delCity) THEN
				CALL outMonitor("***Modified FIELD delCity")							
				CALL DIALOG.SetFieldTouched("delCity", FALSE)
			END IF
						
		BEFORE FIELD delState
			CALL outMonitor("BEFORE FIELD delState")
		AFTER FIELD delState
			CALL outMonitor("AFTER FIELD delState")
			IF field_touched(delState) THEN
				CALL outMonitor("***Modified FIELD delState")							
				CALL DIALOG.SetFieldTouched("delState", FALSE)
			END IF
						
		BEFORE FIELD notes
			CALL outMonitor("BEFORE FIELD notes")
		AFTER FIELD notes
			CALL outMonitor("AFTER FIELD notes")
		BEFORE FIELD f_1_1
			CALL outMonitor("BEFORE FIELD f_1_1")
		AFTER FIELD f_1_1
			CALL outMonitor("AFTER FIELD f_1_1")
		BEFORE FIELD f_1_2
			CALL outMonitor("BEFORE FIELD f_1_2")
		AFTER FIELD f_1_2
			CALL outMonitor("AFTER FIELD f_1_2")
		BEFORE FIELD f_1_3
			CALL outMonitor("BEFORE FIELD f_1_3")
		AFTER FIELD f_1_3
			CALL outMonitor("AFTER FIELD f_1_3")
		BEFORE FIELD f_1_4
			CALL outMonitor("BEFORE FIELD f_1_4")
		AFTER FIELD f_1_4
			CALL outMonitor("AFTER FIELD f_1_4")
		BEFORE FIELD f_1_5
			CALL outMonitor("BEFORE FIELD f_1_5")
		AFTER FIELD f_1_5
			CALL outMonitor("AFTER FIELD f_1_5")
		BEFORE FIELD f_2_1
			CALL outMonitor("BEFORE FIELD f_2_1")
		AFTER FIELD f_2_1
			CALL outMonitor("AFTER FIELD f_2_1")
		BEFORE FIELD f_2_2
			CALL outMonitor("BEFORE FIELD f_2_2")
		AFTER FIELD f_2_2
			CALL outMonitor("AFTER FIELD f_2_2")
		BEFORE FIELD f_2_3
			CALL outMonitor("BEFORE FIELD f_2_3")
		AFTER FIELD f_2_3
			CALL outMonitor("AFTER FIELD f_2_3")
		BEFORE FIELD f_2_4
			CALL outMonitor("BEFORE FIELD f_2_4")
		AFTER FIELD f_2_4
			CALL outMonitor("AFTER FIELD f_2_4")
		BEFORE FIELD f_2_5
			CALL outMonitor("BEFORE FIELD f_2_5")
		AFTER FIELD f_2_5
			CALL outMonitor("AFTER FIELD f_2_5")
		BEFORE FIELD f_3_1
			CALL outMonitor("BEFORE FIELD f_3_1")
		AFTER FIELD f_3_1
			CALL outMonitor("AFTER FIELD f_3_1")
		BEFORE FIELD f_3_2
			CALL outMonitor("BEFORE FIELD f_3_2")
		AFTER FIELD f_3_2
			CALL outMonitor("AFTER FIELD f_3_2")
		BEFORE FIELD f_3_3
			CALL outMonitor("BEFORE FIELD f_3_3")
		AFTER FIELD f_3_3
			CALL outMonitor("AFTER FIELD f_3_3")
		BEFORE FIELD f_3_4
			CALL outMonitor("BEFORE FIELD f_3_4")
		AFTER FIELD f_3_4
			CALL outMonitor("AFTER FIELD f_3_4")
		BEFORE FIELD f_3_5
			CALL outMonitor("BEFORE FIELD f_3_5")
		AFTER FIELD f_3_5
			CALL outMonitor("AFTER FIELD f_3_5")
		BEFORE FIELD f_4_1
			CALL outMonitor("BEFORE FIELD f_4_1")
		AFTER FIELD f_4_1
			CALL outMonitor("AFTER FIELD f_4_1")
		BEFORE FIELD f_4_2
			CALL outMonitor("BEFORE FIELD f_4_2")
		AFTER FIELD f_4_2
			CALL outMonitor("AFTER FIELD f_4_2")
		BEFORE FIELD f_4_3
			CALL outMonitor("BEFORE FIELD f_4_3")
		AFTER FIELD f_4_3
			CALL outMonitor("AFTER FIELD f_4_3")
		BEFORE FIELD f_4_4
			CALL outMonitor("BEFORE FIELD f_4_4")
		AFTER FIELD f_4_4
			CALL outMonitor("AFTER FIELD f_4_4")
		BEFORE FIELD f_4_5
			CALL outMonitor("BEFORE FIELD f_4_5")
		AFTER FIELD f_4_5
			CALL outMonitor("AFTER FIELD f_4_5")
		BEFORE FIELD f_5_1
			CALL outMonitor("BEFORE FIELD f_5_1")
		AFTER FIELD f_5_1
			CALL outMonitor("AFTER FIELD f_5_1")
		BEFORE FIELD f_5_2
			CALL outMonitor("BEFORE FIELD f_5_2")
		AFTER FIELD f_5_2
			CALL outMonitor("AFTER FIELD f_5_2")
		BEFORE FIELD f_5_3
			CALL outMonitor("BEFORE FIELD f_5_3")
		AFTER FIELD f_5_3
			CALL outMonitor("AFTER FIELD f_5_3")
		BEFORE FIELD f_5_4
			CALL outMonitor("BEFORE FIELD f_5_4")
		AFTER FIELD f_5_4
			CALL outMonitor("AFTER FIELD f_5_4")
		BEFORE FIELD f_5_5
			CALL outMonitor("BEFORE FIELD f_5_5")
		AFTER FIELD f_5_5
			CALL outMonitor("AFTER FIELD f_5_5")

		AFTER INPUT
			CALL outMonitor("AFTER INPUT")
			CALL outMonitor("Final/Main Validation - if wrong, continue input")					
			CALL validateInput()
									
	END INPUT
	
	CALL outMonitor("END INPUT")
		
	IF int_flag THEN
		LET int_flag = FALSE
		ERROR "User aborted data input"
		CALL outMonitor("int_flag = TRUE -> User pressed Cancel")			
	ELSE
		#At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE"
		CALL outMonitor("At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE")
		MESSAGE "Record Data Saved"
		LET myRecMain.* = myRec.*
		CALL outMonitor("int_flag = FALSE -> User pressed OK")
		CALL outMonitor("Save Data (SQL INSERT/UPDATE)")			
			
	END IF	


END FUNCTION
################################################################################
# END FUNCTION edit_with_input_field_order()
################################################################################



################################################################################
# FUNCTION edit_with_input_field_order()
#
# INPUT - Field order is defined/used by the order of the INPUT field 
# In this case the order of the record elements myRec.*
# PS: WITHOUT DEFAULTS - field variables will be initialized with the corresponding input variable values
################################################################################
FUNCTION edit_with_input_field_order_with_defaults()
	CALL outMonitor_clear()		
	LET myRec.* = myRecMain.*

	CALL outMonitor("INPUT BY NAME myRec.* WITHOUT DEFAULTS")
		
	INPUT BY NAME myRec.* #WITHOUT DEFAULTS
		BEFORE INPUT
			CALL outMonitor("BEFORE INPUT <empty>")	
				
    ON ACTION "HELP"
    	CALL onlineHelp("input-without-defaults",NULL)
    					
		ON ACTION "CANCEL"
			EXIT INPUT				

		BEFORE FIELD invAddress1
			CALL outMonitor("BEFORE FIELD invAddress1")
		AFTER FIELD invAddress1
			CALL outMonitor("AFTER FIELD invAddress1")
			IF field_touched(invAddress1) THEN
				CALL outMonitor("***Modified FIELD invAddress1")							
				CALL DIALOG.SetFieldTouched("invAddress1", FALSE)
			END IF
			
		BEFORE FIELD invAddress2
			CALL outMonitor("BEFORE FIELD invAddress2")
		AFTER FIELD invAddress2
			CALL outMonitor("AFTER FIELD invAddress2")
			IF field_touched(invAddress2) THEN
				CALL outMonitor("***Modified FIELD invAddress2")							
				CALL DIALOG.SetFieldTouched("invAddress2", FALSE)
			END IF

		BEFORE FIELD invAddress3
			CALL outMonitor("BEFORE FIELD invAddress3")
		AFTER FIELD invAddress3
			CALL outMonitor("AFTER FIELD invAddress3")
			IF field_touched(invAddress3) THEN
				CALL outMonitor("***Modified FIELD invAddress3")							
				CALL DIALOG.SetFieldTouched("invAddress3", FALSE)
			END IF
			
		BEFORE FIELD invPostCode
			CALL outMonitor("BEFORE FIELD invPostCode")
		AFTER FIELD invPostCode
			CALL outMonitor("AFTER FIELD invPostCode")
			IF field_touched(invPostCode) THEN
				CALL outMonitor("***Modified FIELD invPostCode")							
				CALL DIALOG.SetFieldTouched("invPostCode", FALSE)
			END IF
						
		BEFORE FIELD invCity
			CALL outMonitor("BEFORE FIELD invCity")
		AFTER FIELD invCity
			CALL outMonitor("AFTER FIELD invCity")
			IF field_touched(invCity) THEN
				CALL outMonitor("***Modified FIELD invCity")							
				CALL DIALOG.SetFieldTouched("invCity", FALSE)
			END IF
						
		BEFORE FIELD invState
			CALL outMonitor("BEFORE FIELD invState")
		AFTER FIELD invState
			CALL outMonitor("AFTER FIELD invState")
			IF field_touched(invState) THEN
				CALL outMonitor("***Modified FIELD invState")							
				CALL DIALOG.SetFieldTouched("invState", FALSE)
			END IF
									
		BEFORE FIELD delAddress1
			CALL outMonitor("BEFORE FIELD delAddress1")
		AFTER FIELD delAddress1
			CALL outMonitor("AFTER FIELD delAddress1")
			IF field_touched(delAddress1) THEN
				CALL outMonitor("***Modified FIELD delAddress1")							
				CALL DIALOG.SetFieldTouched("delAddress1", FALSE)
			END IF
						
		BEFORE FIELD delAddress2
			CALL outMonitor("BEFORE FIELD delAddress2")
		AFTER FIELD delAddress2
			CALL outMonitor("AFTER FIELD delAddress2")
			IF field_touched(delAddress2) THEN
				CALL outMonitor("***Modified FIELD delAddress2")							
				CALL DIALOG.SetFieldTouched("delAddress2", FALSE)
			END IF
						
		BEFORE FIELD delAddress3
			CALL outMonitor("BEFORE FIELD delAddress3")
		AFTER FIELD delAddress3
			CALL outMonitor("AFTER FIELD delAddress3")
			IF field_touched(delAddress3) THEN
				CALL outMonitor("***Modified FIELD delAddress3")							
				CALL DIALOG.SetFieldTouched("delAddress3", FALSE)
			END IF
						
		BEFORE FIELD delPostCode
			CALL outMonitor("BEFORE FIELD delPostCode")
		AFTER FIELD delPostCode
			CALL outMonitor("AFTER FIELD delPostCode")
			IF field_touched(delPostCode) THEN
				CALL outMonitor("***Modified FIELD delPostCode")							
				CALL DIALOG.SetFieldTouched("delPostCode", FALSE)
			END IF
						
		BEFORE FIELD delCity
			CALL outMonitor("BEFORE FIELD delCity")
		AFTER FIELD delCity
			CALL outMonitor("AFTER FIELD delCity")
			IF field_touched(delCity) THEN
				CALL outMonitor("***Modified FIELD delCity")							
				CALL DIALOG.SetFieldTouched("delCity", FALSE)
			END IF
						
		BEFORE FIELD delState
			CALL outMonitor("BEFORE FIELD delState")
		AFTER FIELD delState
			CALL outMonitor("AFTER FIELD delState")
			IF field_touched(delState) THEN
				CALL outMonitor("***Modified FIELD delState")							
				CALL DIALOG.SetFieldTouched("delState", FALSE)
			END IF
						
		BEFORE FIELD notes
			CALL outMonitor("BEFORE FIELD notes")
		AFTER FIELD notes
			CALL outMonitor("AFTER FIELD notes")
		BEFORE FIELD f_1_1
			CALL outMonitor("BEFORE FIELD f_1_1")
		AFTER FIELD f_1_1
			CALL outMonitor("AFTER FIELD f_1_1")
		BEFORE FIELD f_1_2
			CALL outMonitor("BEFORE FIELD f_1_2")
		AFTER FIELD f_1_2
			CALL outMonitor("AFTER FIELD f_1_2")
		BEFORE FIELD f_1_3
			CALL outMonitor("BEFORE FIELD f_1_3")
		AFTER FIELD f_1_3
			CALL outMonitor("AFTER FIELD f_1_3")
		BEFORE FIELD f_1_4
			CALL outMonitor("BEFORE FIELD f_1_4")
		AFTER FIELD f_1_4
			CALL outMonitor("AFTER FIELD f_1_4")
		BEFORE FIELD f_1_5
			CALL outMonitor("BEFORE FIELD f_1_5")
		AFTER FIELD f_1_5
			CALL outMonitor("AFTER FIELD f_1_5")
		BEFORE FIELD f_2_1
			CALL outMonitor("BEFORE FIELD f_2_1")
		AFTER FIELD f_2_1
			CALL outMonitor("AFTER FIELD f_2_1")
		BEFORE FIELD f_2_2
			CALL outMonitor("BEFORE FIELD f_2_2")
		AFTER FIELD f_2_2
			CALL outMonitor("AFTER FIELD f_2_2")
		BEFORE FIELD f_2_3
			CALL outMonitor("BEFORE FIELD f_2_3")
		AFTER FIELD f_2_3
			CALL outMonitor("AFTER FIELD f_2_3")
		BEFORE FIELD f_2_4
			CALL outMonitor("BEFORE FIELD f_2_4")
		AFTER FIELD f_2_4
			CALL outMonitor("AFTER FIELD f_2_4")
		BEFORE FIELD f_2_5
			CALL outMonitor("BEFORE FIELD f_2_5")
		AFTER FIELD f_2_5
			CALL outMonitor("AFTER FIELD f_2_5")
		BEFORE FIELD f_3_1
			CALL outMonitor("BEFORE FIELD f_3_1")
		AFTER FIELD f_3_1
			CALL outMonitor("AFTER FIELD f_3_1")
		BEFORE FIELD f_3_2
			CALL outMonitor("BEFORE FIELD f_3_2")
		AFTER FIELD f_3_2
			CALL outMonitor("AFTER FIELD f_3_2")
		BEFORE FIELD f_3_3
			CALL outMonitor("BEFORE FIELD f_3_3")
		AFTER FIELD f_3_3
			CALL outMonitor("AFTER FIELD f_3_3")
		BEFORE FIELD f_3_4
			CALL outMonitor("BEFORE FIELD f_3_4")
		AFTER FIELD f_3_4
			CALL outMonitor("AFTER FIELD f_3_4")
		BEFORE FIELD f_3_5
			CALL outMonitor("BEFORE FIELD f_3_5")
		AFTER FIELD f_3_5
			CALL outMonitor("AFTER FIELD f_3_5")
		BEFORE FIELD f_4_1
			CALL outMonitor("BEFORE FIELD f_4_1")
		AFTER FIELD f_4_1
			CALL outMonitor("AFTER FIELD f_4_1")
		BEFORE FIELD f_4_2
			CALL outMonitor("BEFORE FIELD f_4_2")
		AFTER FIELD f_4_2
			CALL outMonitor("AFTER FIELD f_4_2")
		BEFORE FIELD f_4_3
			CALL outMonitor("BEFORE FIELD f_4_3")
		AFTER FIELD f_4_3
			CALL outMonitor("AFTER FIELD f_4_3")
		BEFORE FIELD f_4_4
			CALL outMonitor("BEFORE FIELD f_4_4")
		AFTER FIELD f_4_4
			CALL outMonitor("AFTER FIELD f_4_4")
		BEFORE FIELD f_4_5
			CALL outMonitor("BEFORE FIELD f_4_5")
		AFTER FIELD f_4_5
			CALL outMonitor("AFTER FIELD f_4_5")
		BEFORE FIELD f_5_1
			CALL outMonitor("BEFORE FIELD f_5_1")
		AFTER FIELD f_5_1
			CALL outMonitor("AFTER FIELD f_5_1")
		BEFORE FIELD f_5_2
			CALL outMonitor("BEFORE FIELD f_5_2")
		AFTER FIELD f_5_2
			CALL outMonitor("AFTER FIELD f_5_2")
		BEFORE FIELD f_5_3
			CALL outMonitor("BEFORE FIELD f_5_3")
		AFTER FIELD f_5_3
			CALL outMonitor("AFTER FIELD f_5_3")
		BEFORE FIELD f_5_4
			CALL outMonitor("BEFORE FIELD f_5_4")
		AFTER FIELD f_5_4
			CALL outMonitor("AFTER FIELD f_5_4")
		BEFORE FIELD f_5_5
			CALL outMonitor("BEFORE FIELD f_5_5")
		AFTER FIELD f_5_5
			CALL outMonitor("AFTER FIELD f_5_5")

		AFTER INPUT
			CALL outMonitor("AFTER INPUT")	
			CALL outMonitor("Final/Main Validation - if wrong, continue input")					
			CALL validateInput()
			
	END INPUT
	
	CALL outMonitor("END INPUT")
			
	IF int_flag THEN
		LET int_flag = FALSE
		ERROR "User aborted data input"
		CALL outMonitor("int_flag = TRUE -> User pressed Cancel")			
	ELSE
		#At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE"
		CALL outMonitor("At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE")
		MESSAGE "Record Data Saved"
		LET myRecMain.* = myRec.*
		CALL outMonitor("int_flag = FALSE -> User pressed OK")		
		CALL outMonitor("Save Data (SQL INSERT/UPDATE)")			
	
	END IF	


END FUNCTION
################################################################################
# END FUNCTION edit_with_input_field_order()
################################################################################


################################################################################
# FUNCTION edit_with_input_field_order_fieldorder_false()
#
# INPUT - Field order is defined/used by the order of the INPUT field
# In this case the order of the record elements myRec.*
#
# CALL fgl_dialog_fieldorder(FALSE)
# BEFORE and AFTER FIELD condition is only triggered for
# - AFTER FIELD for the current/old location field
# - BEFORE FIELD for the target/new location field 
################################################################################
FUNCTION edit_with_input_field_order_fieldorder_false()

	CALL outMonitor_clear()		
	CALL outMonitor("INPUT BY NAME myRec.* WITHOUT DEFAULTS")

	INPUT BY NAME myRec.* WITHOUT DEFAULTS
		BEFORE INPUT
			CALL fgl_dialog_fieldorder(FALSE)
			CALL outMonitor("BEFORE INPUT <CALL fgl_dialog_fieldorder(FALSE)>")
			
    ON ACTION "HELP"
    	CALL onlineHelp("fgl_dialog_fieldorder()",NULL)
    					
		ON ACTION "CANCEL"
			EXIT INPUT				

		BEFORE FIELD invAddress1
			CALL outMonitor("BEFORE FIELD invAddress1")
		AFTER FIELD invAddress1
			CALL outMonitor("AFTER FIELD invAddress1")
			IF field_touched(invAddress1) THEN
				CALL outMonitor("***Modified FIELD invAddress1")							
				CALL DIALOG.SetFieldTouched("invAddress1", FALSE)
			END IF
			
		BEFORE FIELD invAddress2
			CALL outMonitor("BEFORE FIELD invAddress2")
		AFTER FIELD invAddress2
			CALL outMonitor("AFTER FIELD invAddress2")
			IF field_touched(invAddress2) THEN
				CALL outMonitor("***Modified FIELD invAddress2")							
				CALL DIALOG.SetFieldTouched("invAddress2", FALSE)
			END IF

		BEFORE FIELD invAddress3
			CALL outMonitor("BEFORE FIELD invAddress3")
		AFTER FIELD invAddress3
			CALL outMonitor("AFTER FIELD invAddress3")
			IF field_touched(invAddress3) THEN
				CALL outMonitor("***Modified FIELD invAddress3")							
				CALL DIALOG.SetFieldTouched("invAddress3", FALSE)
			END IF
			
		BEFORE FIELD invPostCode
			CALL outMonitor("BEFORE FIELD invPostCode")
		AFTER FIELD invPostCode
			CALL outMonitor("AFTER FIELD invPostCode")
			IF field_touched(invPostCode) THEN
				CALL outMonitor("***Modified FIELD invPostCode")							
				CALL DIALOG.SetFieldTouched("invPostCode", FALSE)
			END IF
						
		BEFORE FIELD invCity
			CALL outMonitor("BEFORE FIELD invCity")
		AFTER FIELD invCity
			CALL outMonitor("AFTER FIELD invCity")
			IF field_touched(invCity) THEN
				CALL outMonitor("***Modified FIELD invCity")							
				CALL DIALOG.SetFieldTouched("invCity", FALSE)
			END IF
						
		BEFORE FIELD invState
			CALL outMonitor("BEFORE FIELD invState")
		AFTER FIELD invState
			CALL outMonitor("AFTER FIELD invState")
			IF field_touched(invState) THEN
				CALL outMonitor("***Modified FIELD invState")							
				CALL DIALOG.SetFieldTouched("invState", FALSE)
			END IF
									
		BEFORE FIELD delAddress1
			CALL outMonitor("BEFORE FIELD delAddress1")
		AFTER FIELD delAddress1
			CALL outMonitor("AFTER FIELD delAddress1")
			IF field_touched(delAddress1) THEN
				CALL outMonitor("***Modified FIELD delAddress1")							
				CALL DIALOG.SetFieldTouched("delAddress1", FALSE)
			END IF
						
		BEFORE FIELD delAddress2
			CALL outMonitor("BEFORE FIELD delAddress2")
		AFTER FIELD delAddress2
			CALL outMonitor("AFTER FIELD delAddress2")
			IF field_touched(delAddress2) THEN
				CALL outMonitor("***Modified FIELD delAddress2")							
				CALL DIALOG.SetFieldTouched("delAddress2", FALSE)
			END IF
						
		BEFORE FIELD delAddress3
			CALL outMonitor("BEFORE FIELD delAddress3")
		AFTER FIELD delAddress3
			CALL outMonitor("AFTER FIELD delAddress3")
			IF field_touched(delAddress3) THEN
				CALL outMonitor("***Modified FIELD delAddress3")							
				CALL DIALOG.SetFieldTouched("delAddress3", FALSE)
			END IF
						
		BEFORE FIELD delPostCode
			CALL outMonitor("BEFORE FIELD delPostCode")
		AFTER FIELD delPostCode
			CALL outMonitor("AFTER FIELD delPostCode")
			IF field_touched(delPostCode) THEN
				CALL outMonitor("***Modified FIELD delPostCode")							
				CALL DIALOG.SetFieldTouched("delPostCode", FALSE)
			END IF
						
		BEFORE FIELD delCity
			CALL outMonitor("BEFORE FIELD delCity")
		AFTER FIELD delCity
			CALL outMonitor("AFTER FIELD delCity")
			IF field_touched(delCity) THEN
				CALL outMonitor("***Modified FIELD delCity")							
				CALL DIALOG.SetFieldTouched("delCity", FALSE)
			END IF
						
		BEFORE FIELD delState
			CALL outMonitor("BEFORE FIELD delState")
		AFTER FIELD delState
			CALL outMonitor("AFTER FIELD delState")
			IF field_touched(delState) THEN
				CALL outMonitor("***Modified FIELD delState")							
				CALL DIALOG.SetFieldTouched("delState", FALSE)
			END IF
						
		BEFORE FIELD notes
			CALL outMonitor("BEFORE FIELD notes")
		AFTER FIELD notes
			CALL outMonitor("AFTER FIELD notes")
		BEFORE FIELD f_1_1
			CALL outMonitor("BEFORE FIELD f_1_1")
		AFTER FIELD f_1_1
			CALL outMonitor("AFTER FIELD f_1_1")
		BEFORE FIELD f_1_2
			CALL outMonitor("BEFORE FIELD f_1_2")
		AFTER FIELD f_1_2
			CALL outMonitor("AFTER FIELD f_1_2")
		BEFORE FIELD f_1_3
			CALL outMonitor("BEFORE FIELD f_1_3")
		AFTER FIELD f_1_3
			CALL outMonitor("AFTER FIELD f_1_3")
		BEFORE FIELD f_1_4
			CALL outMonitor("BEFORE FIELD f_1_4")
		AFTER FIELD f_1_4
			CALL outMonitor("AFTER FIELD f_1_4")
		BEFORE FIELD f_1_5
			CALL outMonitor("BEFORE FIELD f_1_5")
		AFTER FIELD f_1_5
			CALL outMonitor("AFTER FIELD f_1_5")
		BEFORE FIELD f_2_1
			CALL outMonitor("BEFORE FIELD f_2_1")
		AFTER FIELD f_2_1
			CALL outMonitor("AFTER FIELD f_2_1")
		BEFORE FIELD f_2_2
			CALL outMonitor("BEFORE FIELD f_2_2")
		AFTER FIELD f_2_2
			CALL outMonitor("AFTER FIELD f_2_2")
		BEFORE FIELD f_2_3
			CALL outMonitor("BEFORE FIELD f_2_3")
		AFTER FIELD f_2_3
			CALL outMonitor("AFTER FIELD f_2_3")
		BEFORE FIELD f_2_4
			CALL outMonitor("BEFORE FIELD f_2_4")
		AFTER FIELD f_2_4
			CALL outMonitor("AFTER FIELD f_2_4")
		BEFORE FIELD f_2_5
			CALL outMonitor("BEFORE FIELD f_2_5")
		AFTER FIELD f_2_5
			CALL outMonitor("AFTER FIELD f_2_5")
		BEFORE FIELD f_3_1
			CALL outMonitor("BEFORE FIELD f_3_1")
		AFTER FIELD f_3_1
			CALL outMonitor("AFTER FIELD f_3_1")
		BEFORE FIELD f_3_2
			CALL outMonitor("BEFORE FIELD f_3_2")
		AFTER FIELD f_3_2
			CALL outMonitor("AFTER FIELD f_3_2")
		BEFORE FIELD f_3_3
			CALL outMonitor("BEFORE FIELD f_3_3")
		AFTER FIELD f_3_3
			CALL outMonitor("AFTER FIELD f_3_3")
		BEFORE FIELD f_3_4
			CALL outMonitor("BEFORE FIELD f_3_4")
		AFTER FIELD f_3_4
			CALL outMonitor("AFTER FIELD f_3_4")
		BEFORE FIELD f_3_5
			CALL outMonitor("BEFORE FIELD f_3_5")
		AFTER FIELD f_3_5
			CALL outMonitor("AFTER FIELD f_3_5")
		BEFORE FIELD f_4_1
			CALL outMonitor("BEFORE FIELD f_4_1")
		AFTER FIELD f_4_1
			CALL outMonitor("AFTER FIELD f_4_1")
		BEFORE FIELD f_4_2
			CALL outMonitor("BEFORE FIELD f_4_2")
		AFTER FIELD f_4_2
			CALL outMonitor("AFTER FIELD f_4_2")
		BEFORE FIELD f_4_3
			CALL outMonitor("BEFORE FIELD f_4_3")
		AFTER FIELD f_4_3
			CALL outMonitor("AFTER FIELD f_4_3")
		BEFORE FIELD f_4_4
			CALL outMonitor("BEFORE FIELD f_4_4")
		AFTER FIELD f_4_4
			CALL outMonitor("AFTER FIELD f_4_4")
		BEFORE FIELD f_4_5
			CALL outMonitor("BEFORE FIELD f_4_5")
		AFTER FIELD f_4_5
			CALL outMonitor("AFTER FIELD f_4_5")
		BEFORE FIELD f_5_1
			CALL outMonitor("BEFORE FIELD f_5_1")
		AFTER FIELD f_5_1
			CALL outMonitor("AFTER FIELD f_5_1")
		BEFORE FIELD f_5_2
			CALL outMonitor("BEFORE FIELD f_5_2")
		AFTER FIELD f_5_2
			CALL outMonitor("AFTER FIELD f_5_2")
		BEFORE FIELD f_5_3
			CALL outMonitor("BEFORE FIELD f_5_3")
		AFTER FIELD f_5_3
			CALL outMonitor("AFTER FIELD f_5_3")
		BEFORE FIELD f_5_4
			CALL outMonitor("BEFORE FIELD f_5_4")
		AFTER FIELD f_5_4
			CALL outMonitor("AFTER FIELD f_5_4")
		BEFORE FIELD f_5_5
			CALL outMonitor("BEFORE FIELD f_5_5")
		AFTER FIELD f_5_5
			CALL outMonitor("AFTER FIELD f_5_5")

		AFTER INPUT
			CALL outMonitor("AFTER INPUT")	
			CALL outMonitor("Final/Main Validation - if wrong, continue input")
			CALL validateInput()

	END INPUT
	
	CALL outMonitor("END INPUT")
		
	IF int_flag THEN
		LET int_flag = FALSE
		ERROR "User aborted data input"
		CALL outMonitor("int_flag = TRUE -> User pressed Cancel")			
	ELSE
		#At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE"
		CALL outMonitor("At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE")
		MESSAGE "Record Data Saved"
		LET myRecMain.* = myRec.*
		CALL outMonitor("int_flag = FALSE -> User pressed OK")
		CALL outMonitor("Save Data (SQL INSERT/UPDATE)")			
			
	END IF	

END FUNCTION
################################################################################
# END FUNCTION edit_with_input_field_order_fieldorder_false()
################################################################################


################################################################################
# FUNCTION edit_with_input_field_order_unconstrained()
#
# INPUT - Field order is defined/used by the order of the INPUT field 
# In this case the order of the record elements myRec.*
#
# BUT field navigation keys have been set unconstrained
################################################################################
FUNCTION edit_with_input_field_order_unconstrained()
	CALL outMonitor_clear()		

	OPTIONS FIELD ORDER UNCONSTRAINED
	CALL outMonitor("OPTIONS FIELD ORDER UNCONSTRAINED")
	
	LET myRec.* = myRecMain.*

	CALL outMonitor("INPUT BY NAME myRec.* WITHOUT DEFAULTS")	
	INPUT BY NAME myRec.* WITHOUT DEFAULTS
		BEFORE INPUT
			CALL outMonitor("BEFORE INPUT <empty>")
			
    ON ACTION "HELP"
    	CALL onlineHelp("options-field-order",NULL)
    					
		ON ACTION "CANCEL"
			EXIT INPUT				

		BEFORE FIELD invAddress1
			CALL outMonitor("BEFORE FIELD invAddress1")
		AFTER FIELD invAddress1
			CALL outMonitor("AFTER FIELD invAddress1")
			IF field_touched(invAddress1) THEN
				CALL outMonitor("***Modified FIELD invAddress1")							
				CALL DIALOG.SetFieldTouched("invAddress1", FALSE)
			END IF
			
		BEFORE FIELD invAddress2
			CALL outMonitor("BEFORE FIELD invAddress2")
		AFTER FIELD invAddress2
			CALL outMonitor("AFTER FIELD invAddress2")
			IF field_touched(invAddress2) THEN
				CALL outMonitor("***Modified FIELD invAddress2")							
				CALL DIALOG.SetFieldTouched("invAddress2", FALSE)
			END IF

		BEFORE FIELD invAddress3
			CALL outMonitor("BEFORE FIELD invAddress3")
		AFTER FIELD invAddress3
			CALL outMonitor("AFTER FIELD invAddress3")
			IF field_touched(invAddress3) THEN
				CALL outMonitor("***Modified FIELD invAddress3")							
				CALL DIALOG.SetFieldTouched("invAddress3", FALSE)
			END IF
			
		BEFORE FIELD invPostCode
			CALL outMonitor("BEFORE FIELD invPostCode")
		AFTER FIELD invPostCode
			CALL outMonitor("AFTER FIELD invPostCode")
			IF field_touched(invPostCode) THEN
				CALL outMonitor("***Modified FIELD invPostCode")							
				CALL DIALOG.SetFieldTouched("invPostCode", FALSE)
			END IF
						
		BEFORE FIELD invCity
			CALL outMonitor("BEFORE FIELD invCity")
		AFTER FIELD invCity
			CALL outMonitor("AFTER FIELD invCity")
			IF field_touched(invCity) THEN
				CALL outMonitor("***Modified FIELD invCity")							
				CALL DIALOG.SetFieldTouched("invCity", FALSE)
			END IF
						
		BEFORE FIELD invState
			CALL outMonitor("BEFORE FIELD invState")
		AFTER FIELD invState
			CALL outMonitor("AFTER FIELD invState")
			IF field_touched(invState) THEN
				CALL outMonitor("***Modified FIELD invState")							
				CALL DIALOG.SetFieldTouched("invState", FALSE)
			END IF
									
		BEFORE FIELD delAddress1
			CALL outMonitor("BEFORE FIELD delAddress1")
		AFTER FIELD delAddress1
			CALL outMonitor("AFTER FIELD delAddress1")
			IF field_touched(delAddress1) THEN
				CALL outMonitor("***Modified FIELD delAddress1")							
				CALL DIALOG.SetFieldTouched("delAddress1", FALSE)
			END IF
						
		BEFORE FIELD delAddress2
			CALL outMonitor("BEFORE FIELD delAddress2")
		AFTER FIELD delAddress2
			CALL outMonitor("AFTER FIELD delAddress2")
			IF field_touched(delAddress2) THEN
				CALL outMonitor("***Modified FIELD delAddress2")							
				CALL DIALOG.SetFieldTouched("delAddress2", FALSE)
			END IF
						
		BEFORE FIELD delAddress3
			CALL outMonitor("BEFORE FIELD delAddress3")
		AFTER FIELD delAddress3
			CALL outMonitor("AFTER FIELD delAddress3")
			IF field_touched(delAddress3) THEN
				CALL outMonitor("***Modified FIELD delAddress3")							
				CALL DIALOG.SetFieldTouched("delAddress3", FALSE)
			END IF
						
		BEFORE FIELD delPostCode
			CALL outMonitor("BEFORE FIELD delPostCode")
		AFTER FIELD delPostCode
			CALL outMonitor("AFTER FIELD delPostCode")
			IF field_touched(delPostCode) THEN
				CALL outMonitor("***Modified FIELD delPostCode")							
				CALL DIALOG.SetFieldTouched("delPostCode", FALSE)
			END IF
						
		BEFORE FIELD delCity
			CALL outMonitor("BEFORE FIELD delCity")
		AFTER FIELD delCity
			CALL outMonitor("AFTER FIELD delCity")
			IF field_touched(delCity) THEN
				CALL outMonitor("***Modified FIELD delCity")							
				CALL DIALOG.SetFieldTouched("delCity", FALSE)
			END IF
						
		BEFORE FIELD delState
			CALL outMonitor("BEFORE FIELD delState")
		AFTER FIELD delState
			CALL outMonitor("AFTER FIELD delState")
			IF field_touched(delState) THEN
				CALL outMonitor("***Modified FIELD delState")							
				CALL DIALOG.SetFieldTouched("delState", FALSE)
			END IF
						
		BEFORE FIELD notes
			CALL outMonitor("BEFORE FIELD notes")
		AFTER FIELD notes
			CALL outMonitor("AFTER FIELD notes")
		BEFORE FIELD f_1_1
			CALL outMonitor("BEFORE FIELD f_1_1")
		AFTER FIELD f_1_1
			CALL outMonitor("AFTER FIELD f_1_1")
		BEFORE FIELD f_1_2
			CALL outMonitor("BEFORE FIELD f_1_2")
		AFTER FIELD f_1_2
			CALL outMonitor("AFTER FIELD f_1_2")
		BEFORE FIELD f_1_3
			CALL outMonitor("BEFORE FIELD f_1_3")
		AFTER FIELD f_1_3
			CALL outMonitor("AFTER FIELD f_1_3")
		BEFORE FIELD f_1_4
			CALL outMonitor("BEFORE FIELD f_1_4")
		AFTER FIELD f_1_4
			CALL outMonitor("AFTER FIELD f_1_4")
		BEFORE FIELD f_1_5
			CALL outMonitor("BEFORE FIELD f_1_5")
		AFTER FIELD f_1_5
			CALL outMonitor("AFTER FIELD f_1_5")
		BEFORE FIELD f_2_1
			CALL outMonitor("BEFORE FIELD f_2_1")
		AFTER FIELD f_2_1
			CALL outMonitor("AFTER FIELD f_2_1")
		BEFORE FIELD f_2_2
			CALL outMonitor("BEFORE FIELD f_2_2")
		AFTER FIELD f_2_2
			CALL outMonitor("AFTER FIELD f_2_2")
		BEFORE FIELD f_2_3
			CALL outMonitor("BEFORE FIELD f_2_3")
		AFTER FIELD f_2_3
			CALL outMonitor("AFTER FIELD f_2_3")
		BEFORE FIELD f_2_4
			CALL outMonitor("BEFORE FIELD f_2_4")
		AFTER FIELD f_2_4
			CALL outMonitor("AFTER FIELD f_2_4")
		BEFORE FIELD f_2_5
			CALL outMonitor("BEFORE FIELD f_2_5")
		AFTER FIELD f_2_5
			CALL outMonitor("AFTER FIELD f_2_5")
		BEFORE FIELD f_3_1
			CALL outMonitor("BEFORE FIELD f_3_1")
		AFTER FIELD f_3_1
			CALL outMonitor("AFTER FIELD f_3_1")
		BEFORE FIELD f_3_2
			CALL outMonitor("BEFORE FIELD f_3_2")
		AFTER FIELD f_3_2
			CALL outMonitor("AFTER FIELD f_3_2")
		BEFORE FIELD f_3_3
			CALL outMonitor("BEFORE FIELD f_3_3")
		AFTER FIELD f_3_3
			CALL outMonitor("AFTER FIELD f_3_3")
		BEFORE FIELD f_3_4
			CALL outMonitor("BEFORE FIELD f_3_4")
		AFTER FIELD f_3_4
			CALL outMonitor("AFTER FIELD f_3_4")
		BEFORE FIELD f_3_5
			CALL outMonitor("BEFORE FIELD f_3_5")
		AFTER FIELD f_3_5
			CALL outMonitor("AFTER FIELD f_3_5")
		BEFORE FIELD f_4_1
			CALL outMonitor("BEFORE FIELD f_4_1")
		AFTER FIELD f_4_1
			CALL outMonitor("AFTER FIELD f_4_1")
		BEFORE FIELD f_4_2
			CALL outMonitor("BEFORE FIELD f_4_2")
		AFTER FIELD f_4_2
			CALL outMonitor("AFTER FIELD f_4_2")
		BEFORE FIELD f_4_3
			CALL outMonitor("BEFORE FIELD f_4_3")
		AFTER FIELD f_4_3
			CALL outMonitor("AFTER FIELD f_4_3")
		BEFORE FIELD f_4_4
			CALL outMonitor("BEFORE FIELD f_4_4")
		AFTER FIELD f_4_4
			CALL outMonitor("AFTER FIELD f_4_4")
		BEFORE FIELD f_4_5
			CALL outMonitor("BEFORE FIELD f_4_5")
		AFTER FIELD f_4_5
			CALL outMonitor("AFTER FIELD f_4_5")
		BEFORE FIELD f_5_1
			CALL outMonitor("BEFORE FIELD f_5_1")
		AFTER FIELD f_5_1
			CALL outMonitor("AFTER FIELD f_5_1")
		BEFORE FIELD f_5_2
			CALL outMonitor("BEFORE FIELD f_5_2")
		AFTER FIELD f_5_2
			CALL outMonitor("AFTER FIELD f_5_2")
		BEFORE FIELD f_5_3
			CALL outMonitor("BEFORE FIELD f_5_3")
		AFTER FIELD f_5_3
			CALL outMonitor("AFTER FIELD f_5_3")
		BEFORE FIELD f_5_4
			CALL outMonitor("BEFORE FIELD f_5_4")
		AFTER FIELD f_5_4
			CALL outMonitor("AFTER FIELD f_5_4")
		BEFORE FIELD f_5_5
			CALL outMonitor("BEFORE FIELD f_5_5")
		AFTER FIELD f_5_5
			CALL outMonitor("AFTER FIELD f_5_5")

		AFTER INPUT
			CALL outMonitor("AFTER INPUT")		
			CALL outMonitor("Final/Main Validation - if wrong, continue input")			
			CALL validateInput()						
			
	END INPUT
	
	CALL outMonitor("END INPUT")
		
	IF int_flag THEN
		LET int_flag = FALSE
		ERROR "User aborted data input"
		CALL outMonitor("int_flag = TRUE -> User pressed Cancel")			
	ELSE
		#At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE"
		CALL outMonitor("At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE")
		MESSAGE "Record Data Saved"
		LET myRecMain.* = myRec.*
		CALL outMonitor("int_flag = FALSE -> User pressed OK")
		CALL outMonitor("Save Data (SQL INSERT/UPDATE)")			
	END IF	

	OPTIONS FIELD ORDER CONSTRAINED
	CALL outMonitor("OPTIONS FIELD ORDER CONSTRAINED")
END FUNCTION
################################################################################
# END FUNCTION edit_with_input_field_order_unconstrained()
################################################################################


################################################################################
# FUNCTION edit_with_form_tabindex_field_order()
#
# INPUT - Field order is defined/used by the form-field property TABINDEX  
################################################################################
FUNCTION edit_with_form_tabindex_field_order()
	CALL outMonitor_clear()
	
	LET myRec.* = myRecMain.*
	
	CALL outMonitor("INPUT BY NAME myRec.* WITHOUT DEFAULTS ATTRIBUTE(FIELD ORDER FORM)")					
	INPUT BY NAME myRec.* WITHOUT DEFAULTS ATTRIBUTE(FIELD ORDER FORM)
		BEFORE INPUT
			CALL outMonitor("BEFORE INPUT <empty>")
			
    ON ACTION "HELP"
    	CALL onlineHelp("form-tabindex",NULL)
    					
		ON ACTION "CANCEL"
			EXIT INPUT				

		BEFORE FIELD invAddress1
			CALL outMonitor("BEFORE FIELD invAddress1")
		AFTER FIELD invAddress1
			CALL outMonitor("AFTER FIELD invAddress1")
			IF field_touched(invAddress1) THEN
				CALL outMonitor("***Modified FIELD invAddress1")							
				CALL DIALOG.SetFieldTouched("invAddress1", FALSE)
			END IF
			
		BEFORE FIELD invAddress2
			CALL outMonitor("BEFORE FIELD invAddress2")
		AFTER FIELD invAddress2
			CALL outMonitor("AFTER FIELD invAddress2")
			IF field_touched(invAddress2) THEN
				CALL outMonitor("***Modified FIELD invAddress2")							
				CALL DIALOG.SetFieldTouched("invAddress2", FALSE)
			END IF

		BEFORE FIELD invAddress3
			CALL outMonitor("BEFORE FIELD invAddress3")
		AFTER FIELD invAddress3
			CALL outMonitor("AFTER FIELD invAddress3")
			IF field_touched(invAddress3) THEN
				CALL outMonitor("***Modified FIELD invAddress3")							
				CALL DIALOG.SetFieldTouched("invAddress3", FALSE)
			END IF
			
		BEFORE FIELD invPostCode
			CALL outMonitor("BEFORE FIELD invPostCode")
		AFTER FIELD invPostCode
			CALL outMonitor("AFTER FIELD invPostCode")
			IF field_touched(invPostCode) THEN
				CALL outMonitor("***Modified FIELD invPostCode")							
				CALL DIALOG.SetFieldTouched("invPostCode", FALSE)
			END IF
						
		BEFORE FIELD invCity
			CALL outMonitor("BEFORE FIELD invCity")
		AFTER FIELD invCity
			CALL outMonitor("AFTER FIELD invCity")
			IF field_touched(invCity) THEN
				CALL outMonitor("***Modified FIELD invCity")							
				CALL DIALOG.SetFieldTouched("invCity", FALSE)
			END IF
						
		BEFORE FIELD invState
			CALL outMonitor("BEFORE FIELD invState")
		AFTER FIELD invState
			CALL outMonitor("AFTER FIELD invState")
			IF field_touched(invState) THEN
				CALL outMonitor("***Modified FIELD invState")							
				CALL DIALOG.SetFieldTouched("invState", FALSE)
			END IF
									
		BEFORE FIELD delAddress1
			CALL outMonitor("BEFORE FIELD delAddress1")
		AFTER FIELD delAddress1
			CALL outMonitor("AFTER FIELD delAddress1")
			IF field_touched(delAddress1) THEN
				CALL outMonitor("***Modified FIELD delAddress1")							
				CALL DIALOG.SetFieldTouched("delAddress1", FALSE)
			END IF
						
		BEFORE FIELD delAddress2
			CALL outMonitor("BEFORE FIELD delAddress2")
		AFTER FIELD delAddress2
			CALL outMonitor("AFTER FIELD delAddress2")
			IF field_touched(delAddress2) THEN
				CALL outMonitor("***Modified FIELD delAddress2")							
				CALL DIALOG.SetFieldTouched("delAddress2", FALSE)
			END IF
						
		BEFORE FIELD delAddress3
			CALL outMonitor("BEFORE FIELD delAddress3")
		AFTER FIELD delAddress3
			CALL outMonitor("AFTER FIELD delAddress3")
			IF field_touched(delAddress3) THEN
				CALL outMonitor("***Modified FIELD delAddress3")							
				CALL DIALOG.SetFieldTouched("delAddress3", FALSE)
			END IF
						
		BEFORE FIELD delPostCode
			CALL outMonitor("BEFORE FIELD delPostCode")
		AFTER FIELD delPostCode
			CALL outMonitor("AFTER FIELD delPostCode")
			IF field_touched(delPostCode) THEN
				CALL outMonitor("***Modified FIELD delPostCode")							
				CALL DIALOG.SetFieldTouched("delPostCode", FALSE)
			END IF
						
		BEFORE FIELD delCity
			CALL outMonitor("BEFORE FIELD delCity")
		AFTER FIELD delCity
			CALL outMonitor("AFTER FIELD delCity")
			IF field_touched(delCity) THEN
				CALL outMonitor("***Modified FIELD delCity")							
				CALL DIALOG.SetFieldTouched("delCity", FALSE)
			END IF
						
		BEFORE FIELD delState
			CALL outMonitor("BEFORE FIELD delState")
		AFTER FIELD delState
			CALL outMonitor("AFTER FIELD delState")
			IF field_touched(delState) THEN
				CALL outMonitor("***Modified FIELD delState")							
				CALL DIALOG.SetFieldTouched("delState", FALSE)
			END IF
						
		BEFORE FIELD notes
			CALL outMonitor("BEFORE FIELD notes")
		AFTER FIELD notes
			CALL outMonitor("AFTER FIELD notes")
		BEFORE FIELD f_1_1
			CALL outMonitor("BEFORE FIELD f_1_1")
		AFTER FIELD f_1_1
			CALL outMonitor("AFTER FIELD f_1_1")
		BEFORE FIELD f_1_2
			CALL outMonitor("BEFORE FIELD f_1_2")
		AFTER FIELD f_1_2
			CALL outMonitor("AFTER FIELD f_1_2")
		BEFORE FIELD f_1_3
			CALL outMonitor("BEFORE FIELD f_1_3")
		AFTER FIELD f_1_3
			CALL outMonitor("AFTER FIELD f_1_3")
		BEFORE FIELD f_1_4
			CALL outMonitor("BEFORE FIELD f_1_4")
		AFTER FIELD f_1_4
			CALL outMonitor("AFTER FIELD f_1_4")
		BEFORE FIELD f_1_5
			CALL outMonitor("BEFORE FIELD f_1_5")
		AFTER FIELD f_1_5
			CALL outMonitor("AFTER FIELD f_1_5")
		BEFORE FIELD f_2_1
			CALL outMonitor("BEFORE FIELD f_2_1")
		AFTER FIELD f_2_1
			CALL outMonitor("AFTER FIELD f_2_1")
		BEFORE FIELD f_2_2
			CALL outMonitor("BEFORE FIELD f_2_2")
		AFTER FIELD f_2_2
			CALL outMonitor("AFTER FIELD f_2_2")
		BEFORE FIELD f_2_3
			CALL outMonitor("BEFORE FIELD f_2_3")
		AFTER FIELD f_2_3
			CALL outMonitor("AFTER FIELD f_2_3")
		BEFORE FIELD f_2_4
			CALL outMonitor("BEFORE FIELD f_2_4")
		AFTER FIELD f_2_4
			CALL outMonitor("AFTER FIELD f_2_4")
		BEFORE FIELD f_2_5
			CALL outMonitor("BEFORE FIELD f_2_5")
		AFTER FIELD f_2_5
			CALL outMonitor("AFTER FIELD f_2_5")
		BEFORE FIELD f_3_1
			CALL outMonitor("BEFORE FIELD f_3_1")
		AFTER FIELD f_3_1
			CALL outMonitor("AFTER FIELD f_3_1")
		BEFORE FIELD f_3_2
			CALL outMonitor("BEFORE FIELD f_3_2")
		AFTER FIELD f_3_2
			CALL outMonitor("AFTER FIELD f_3_2")
		BEFORE FIELD f_3_3
			CALL outMonitor("BEFORE FIELD f_3_3")
		AFTER FIELD f_3_3
			CALL outMonitor("AFTER FIELD f_3_3")
		BEFORE FIELD f_3_4
			CALL outMonitor("BEFORE FIELD f_3_4")
		AFTER FIELD f_3_4
			CALL outMonitor("AFTER FIELD f_3_4")
		BEFORE FIELD f_3_5
			CALL outMonitor("BEFORE FIELD f_3_5")
		AFTER FIELD f_3_5
			CALL outMonitor("AFTER FIELD f_3_5")
		BEFORE FIELD f_4_1
			CALL outMonitor("BEFORE FIELD f_4_1")
		AFTER FIELD f_4_1
			CALL outMonitor("AFTER FIELD f_4_1")
		BEFORE FIELD f_4_2
			CALL outMonitor("BEFORE FIELD f_4_2")
		AFTER FIELD f_4_2
			CALL outMonitor("AFTER FIELD f_4_2")
		BEFORE FIELD f_4_3
			CALL outMonitor("BEFORE FIELD f_4_3")
		AFTER FIELD f_4_3
			CALL outMonitor("AFTER FIELD f_4_3")
		BEFORE FIELD f_4_4
			CALL outMonitor("BEFORE FIELD f_4_4")
		AFTER FIELD f_4_4
			CALL outMonitor("AFTER FIELD f_4_4")
		BEFORE FIELD f_4_5
			CALL outMonitor("BEFORE FIELD f_4_5")
		AFTER FIELD f_4_5
			CALL outMonitor("AFTER FIELD f_4_5")
		BEFORE FIELD f_5_1
			CALL outMonitor("BEFORE FIELD f_5_1")
		AFTER FIELD f_5_1
			CALL outMonitor("AFTER FIELD f_5_1")
		BEFORE FIELD f_5_2
			CALL outMonitor("BEFORE FIELD f_5_2")
		AFTER FIELD f_5_2
			CALL outMonitor("AFTER FIELD f_5_2")
		BEFORE FIELD f_5_3
			CALL outMonitor("BEFORE FIELD f_5_3")
		AFTER FIELD f_5_3
			CALL outMonitor("AFTER FIELD f_5_3")
		BEFORE FIELD f_5_4
			CALL outMonitor("BEFORE FIELD f_5_4")
		AFTER FIELD f_5_4
			CALL outMonitor("AFTER FIELD f_5_4")
		BEFORE FIELD f_5_5
			CALL outMonitor("BEFORE FIELD f_5_5")
		AFTER FIELD f_5_5
			CALL outMonitor("AFTER FIELD f_5_5")
		AFTER INPUT
			CALL outMonitor("AFTER INPUT")		
			CALL outMonitor("Final/Main Validation - if wrong, continue input")
			CALL validateInput()						
			
	END INPUT
	
	CALL outMonitor("END INPUT")
		
	IF int_flag THEN
		LET int_flag = FALSE
		ERROR "User aborted data input"
		CALL outMonitor("int_flag = TRUE -> User pressed Cancel")			
	ELSE
		#At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE"
		CALL outMonitor("At this stage, the data must be fully validated/qualified for your SQL INSERT/UpDATE")
		MESSAGE "Record Data Saved"
		LET myRecMain.* = myRec.*
		CALL outMonitor("int_flag = FALSE -> User pressed OK")			
		CALL outMonitor("Save Data (SQL INSERT/UPDATE)")			

	END IF	

END FUNCTION
################################################################################
# END FUNCTION edit_with_form_tabindex_field_order()
################################################################################


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	DEFINE i SMALLINT
	
	LET myRecMain.invAddress1 = "Pixel House"
	LET myRecMain.invAddress2 = "Pixel Drive"
	LET myRecMain.invAddress3 = "Pixel Area"
	LET myRecMain.invPostCode = "ABC DEF"		
	LET myRecMain.invCity = "Pixel City"		
	LET myRecMain.invState = "Pixel State"		
	
	LET myRecMain.delAddress1 = "Omega House"
	LET myRecMain.delAddress2 = "Omega Drive"
	LET myRecMain.delAddress3 = "Omega Area"
	LET myRecMain.delPostCode = "GHI JKL"		
	LET myRecMain.delCity = "Omega City"		
	LET myRecMain.delState = "Omega State"		

	LET myRecMain.notes = "This is just a dummy text note example. ABCDEFGHIJKLMNOPQRSTUVWXYZ ÖöÜüÄäß !§$%&/()=?`"		
	FOR i = 1 TO 7
		LET myRecMain.notes = myRecMain.notes, "\n",  myRecMain.notes 	
	END FOR	

	LET myRecMain.f_1_1 = "Row 1 Col-1"
	LET myRecMain.f_1_2 = "Row 1 Col-2"
	LET myRecMain.f_1_3 = "Row 1 Col-3"
	LET myRecMain.f_1_4 = "Row 1 Col-4"
	LET myRecMain.f_1_5 = "Row 1 Col-5"
	LET myRecMain.f_2_1 = "Row 2 Col-1"
	LET myRecMain.f_2_2 = "Row 2 Col-2"
	LET myRecMain.f_2_3 = "Row 2 Col-3"
	LET myRecMain.f_2_4 = "Row 2 Col-4"
	LET myRecMain.f_2_5 = "Row 2 Col-5"
	LET myRecMain.f_3_1 = "Row 3 Col-1"
	LET myRecMain.f_3_2 = "Row 3 Col-2"
	LET myRecMain.f_3_3 = "Row 3 Col-3"
	LET myRecMain.f_3_4 = "Row 3 Col-4"
	LET myRecMain.f_3_5 = "Row 3 Col-5"
	LET myRecMain.f_4_1 = "Row 4 Col-1"
	LET myRecMain.f_4_2 = "Row 4 Col-2"
	LET myRecMain.f_4_3 = "Row 4 Col-3"
	LET myRecMain.f_4_4 = "Row 4 Col-4"
	LET myRecMain.f_4_5 = "Row 4 Col-5"
	LET myRecMain.f_5_1 = "Row 5 Col-1"
	LET myRecMain.f_5_2 = "Row 5 Col-2"
	LET myRecMain.f_5_3 = "Row 5 Col-3"
	LET myRecMain.f_5_4 = "Row 5 Col-4"
	LET myRecMain.f_5_5 = "Row 5 Col-5"
	
END FUNCTION
################################################################################
# END FUNCTION initData()
################################################################################

################################################################################
# FUNCTION outMonitor(p_string)
################################################################################
FUNCTION outMonitor(p_string)
	DEFINE p_string STRING
	
	LET mod_monitor = trim(mod_monitor_count), " - ",trim(p_string), "\n", mod_monitor
	LET mod_monitor_count = mod_monitor_count + 1
	DISPLAY mod_monitor TO monitor
END FUNCTION	
################################################################################
# END FUNCTION outMonitor(p_string)
################################################################################

################################################################################
# FUNCTION outMonitor_clear()
#
#
################################################################################
FUNCTION outMonitor_clear()
	LET mod_monitor = ""
	LET mod_monitor_count=1
	DISPLAY mod_monitor TO monitor
END FUNCTION	
################################################################################
# END FUNCTION outMonitor_clear()
################################################################################


################################################################################
# FUNCTION validateInput()
#
#
################################################################################
FUNCTION validateInput()
	
	IF myRec.invAddress1 IS NULL THEN
		ERROR "Field invAddress1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() invAddress1")		
		CALL ui.dialog.getCurrent().nextField("invAdddress1") #NEXT FIELD invAddress1
	END IF
	IF myRec.invAddress2 IS NULL THEN
		ERROR "Field invAddress2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() invAddress2")		
		CALL ui.dialog.getCurrent().nextField("invAdddress2") #NEXT FIELD invAddress2
	END IF
	IF myRec.invAddress3 IS NULL THEN
		ERROR "Field invAddress3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() invAddress3")
		CALL ui.dialog.getCurrent().nextField("invAdddress3") #NEXT FIELD invAddress3
	END IF
	IF myRec.invPostCode IS NULL THEN
		ERROR "Field invPostCode must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() invPostCode")		
		CALL ui.dialog.getCurrent().nextField("invPostCode") #NEXT FIELD invPostCode
	END IF
	IF myRec.invCity IS NULL THEN
		ERROR "Field invCity must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() invCity")		
		CALL ui.dialog.getCurrent().nextField("invCity") #NEXT FIELD invCity
	END IF
	IF myRec.invState IS NULL THEN
		ERROR "Field invState must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() invState")		
		CALL ui.dialog.getCurrent().nextField("invState") #NEXT FIELD invState
	END IF


	IF myRec.delAddress1 IS NULL THEN
		ERROR "Field delAddress1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() delAddress1")		
		CALL ui.dialog.getCurrent().nextField("delAdddress1") #NEXT FIELD delAddress1
	END IF
	IF myRec.delAddress2 IS NULL THEN
		ERROR "Field delAddress2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() delAddress2")		
		CALL ui.dialog.getCurrent().nextField("delAdddress2") #NEXT FIELD delAddress2
	END IF
	IF myRec.delAddress3 IS NULL THEN
		ERROR "Field delAddress3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() delAddress3")
		CALL ui.dialog.getCurrent().nextField("delAdddress3") #NEXT FIELD delAddress3
	END IF
	IF myRec.delPostCode IS NULL THEN
		ERROR "Field delPostCode must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() delPostCode")		
		CALL ui.dialog.getCurrent().nextField("delPostCode") #NEXT FIELD delPostCode
	END IF
	IF myRec.delCity IS NULL THEN
		ERROR "Field delCity must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() delCity")		
		CALL ui.dialog.getCurrent().nextField("invCity") #NEXT FIELD delCity
	END IF
	IF myRec.delState IS NULL THEN
		ERROR "Field delState must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() delState")		
		CALL ui.dialog.getCurrent().nextField("delState") #NEXT FIELD delState
	END IF

	IF myRec.notes IS NULL THEN
		ERROR "Field notes must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() notes")		
		CALL ui.dialog.getCurrent().nextField("notes") #NEXT FIELD notes
	END IF

	IF myRec.f_1_1 IS NULL THEN
		ERROR "Field f_1_1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_1_1")		
		CALL ui.dialog.getCurrent().nextField("f_1_1") #NEXT FIELD f_1_1
	END IF
	IF myRec.f_1_2 IS NULL THEN
		ERROR "Field f_1_2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_1_2")		
		CALL ui.dialog.getCurrent().nextField("f_1_2") #NEXT FIELD f_1_2
	END IF
	IF myRec.f_1_3 IS NULL THEN
		ERROR "Field f_1_3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_1_3")		
		CALL ui.dialog.getCurrent().nextField("f_1_3") #NEXT FIELD f_1_3
	END IF
	IF myRec.f_1_4 IS NULL THEN
		ERROR "Field f_1_4 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_1_4")		
		CALL ui.dialog.getCurrent().nextField("f_1_4") #NEXT FIELD f_1_4
	END IF
	IF myRec.f_1_5 IS NULL THEN
		ERROR "Field f_1_5 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_1_5")		
		CALL ui.dialog.getCurrent().nextField("f_1_5") #NEXT FIELD f_1_5
	END IF

	IF myRec.f_2_1 IS NULL THEN
		ERROR "Field f_2_1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_2_1")		
		CALL ui.dialog.getCurrent().nextField("f_2_1") #NEXT FIELD f_2_1
	END IF
	IF myRec.f_2_2 IS NULL THEN
		ERROR "Field f_2_2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_2_2")		
		CALL ui.dialog.getCurrent().nextField("f_2_2") #NEXT FIELD f_2_2
	END IF
	IF myRec.f_2_3 IS NULL THEN
		ERROR "Field f_2_3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_2_3")		
		CALL ui.dialog.getCurrent().nextField("f_2_3") #NEXT FIELD f_2_3
	END IF
	IF myRec.f_2_4 IS NULL THEN
		ERROR "Field f_2_4 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_2_4")		
		CALL ui.dialog.getCurrent().nextField("f_2_4") #NEXT FIELD f_2_4
	END IF
	IF myRec.f_2_5 IS NULL THEN
		ERROR "Field f_2_5 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_2_5")		
		CALL ui.dialog.getCurrent().nextField("f_2_5") #NEXT FIELD f_2_5
	END IF

	IF myRec.f_3_1 IS NULL THEN
		ERROR "Field f_3_1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_3_1")		
		CALL ui.dialog.getCurrent().nextField("f_3_1") #NEXT FIELD f_3_1
	END IF
		
	IF myRec.f_3_2 IS NULL THEN
		ERROR "Field f_3_2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_3_2")		
		CALL ui.dialog.getCurrent().nextField("f_3_2") #NEXT FIELD f_3_2
	END IF
		
	IF myRec.f_3_3 IS NULL THEN
		ERROR "Field f_3_3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_3_3")		
		CALL ui.dialog.getCurrent().nextField("f_3_3") #NEXT FIELD f_3_3
	END IF
		
	IF myRec.f_3_4 IS NULL THEN
		ERROR "Field f_3_4 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_3_4")		
		CALL ui.dialog.getCurrent().nextField("f_3_4") #NEXT FIELD f_3_4
	END IF
		
	IF myRec.f_3_5 IS NULL THEN
		ERROR "Field f_3_5 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_3_5")		
		CALL ui.dialog.getCurrent().nextField("f_3_5") #NEXT FIELD f_3_5
	END IF
	IF myRec.f_4_1 IS NULL THEN
		ERROR "Field f_4_1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_4_1")		
		CALL ui.dialog.getCurrent().nextField("f_4_1") #NEXT FIELD f_4_1
	END IF
		
	IF myRec.f_4_2 IS NULL THEN
		ERROR "Field f_4_2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_4_2")		
		CALL ui.dialog.getCurrent().nextField("f_4_2") #NEXT FIELD f_4_2
	END IF
		
	IF myRec.f_4_3 IS NULL THEN
		ERROR "Field f_4_3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_4_3")		
		CALL ui.dialog.getCurrent().nextField("f_4_3") #NEXT FIELD f_4_3
	END IF
		
	IF myRec.f_4_4 IS NULL THEN
		ERROR "Field f_4_4 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_4_4")		
		CALL ui.dialog.getCurrent().nextField("f_4_4") #NEXT FIELD f_4_4
	END IF
		
	IF myRec.f_4_5 IS NULL THEN
		ERROR "Field f_4_5 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_4_5")		
		CALL ui.dialog.getCurrent().nextField("f_4_5") #NEXT FIELD f_4_5
	END IF

	IF myRec.f_5_1 IS NULL THEN
		ERROR "Field f_5_1 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_5_1")		
		CALL ui.dialog.getCurrent().nextField("f_5_1") #NEXT FIELD f_5_1
	END IF
	IF myRec.f_5_2 IS NULL THEN
		ERROR "Field f_5_2 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_5_2")		
		CALL ui.dialog.getCurrent().nextField("f_5_2") #NEXT FIELD f_5_2
	END IF
	IF myRec.f_5_3 IS NULL THEN
		ERROR "Field f_5_3 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_5_3")		
		CALL ui.dialog.getCurrent().nextField("f_5_3") #NEXT FIELD f_5_3
	END IF
	IF myRec.f_5_4 IS NULL THEN
		ERROR "Field f_5_4 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_5_4")		
		CALL ui.dialog.getCurrent().nextField("f_5_4") #NEXT FIELD f_5_4
	END IF
	IF myRec.f_5_5 IS NULL THEN
		ERROR "Field f_5_5 must not be empty"
		CALL outMonitor("AFTER INPUT validateInput() f_5_5")		
		CALL ui.dialog.getCurrent().nextField("f_5_5") #NEXT FIELD f_5_5
	END IF
	
END FUNCTION
################################################################################
# END FUNCTION validateInput()
################################################################################

################################################################################
# FUNCTION default_title_text()
#
#
################################################################################
FUNCTION default_title_text()
	DISPLAY "ATTRIBUTE(FIELD ORDER FORM), fgl_dialog_fieldorder(FALSE), required, fieldtouched() Demo Example" TO lbTitle
	DISPLAY "" TO lbInfo1
	DISPLAY "" TO lbInfo2	
END FUNCTION
################################################################################
# END FUNCTION default_title_text()
################################################################################