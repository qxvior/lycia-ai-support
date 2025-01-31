################################################################################
# Module Scope
################################################################################
#Type definition
DEFINE modu_dt_recMember TYPE AS 
  RECORD
		activeMember BOOLEAN,
		firstName STRING,
		lastName STRING
  END RECORD

	DEFINE modu_arr_left DYNAMIC ARRAY OF modu_dt_recMember	--one dynamic data array for each table
	DEFINE modu_arr_right DYNAMIC ARRAY OF modu_dt_recMember	--one dynamic data array for each table


################################################################################
# MAIN
#
#
################################################################################
MAIN
	DEFINE idxLeft,idxRight SMALLINT

	CALL ui_init()	
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL init_data()
	CALL hideNavigation()	--hide the toolbar navigation butons for the table container
	
	OPEN WINDOW wDialogTable WITH FORM "form/cnt_table_copy_dialog"

#	DISPLAY ARRAY modu_arr_left TO tableLeft.* WITHOUT SCROLL
#	DISPLAY ARRAY modu_arr_right TO tableRight.* WITHOUT SCROLL	

	IF modu_arr_left.getSize() > 0 THEN
		LET idxLeft = 1
	END IF
	IF modu_arr_right.getSize() > 0 THEN
		LET idxRight = 1
	END IF

	
	MENU
		ON ACTION "DISPLAY ARRAY"
	
			DIALOG  ATTRIBUTE(UNBUFFERED)
			
				DISPLAY ARRAY modu_arr_left TO tableLeft.*
					BEFORE ROW
						LET idxLeft = arr_curr()
						CALL displayProperties(idxLeft,idxRight)
						
					ON ACTION ("ACCEPT")
						CALL moveRecord("toRight",idxLeft,idxRight)
						
				END DISPLAY
		
				DISPLAY ARRAY modu_arr_right TO tableRight.*
					BEFORE ROW
						LET idxRight = arr_curr()		
						CALL displayProperties(idxLeft,idxRight)
					
					ON ACTION ("ACCEPT")
						CALL moveRecord("toLeft",idxLeft,idxRight)
										
				END DISPLAY
		
			--------------------------------------

				ON ACTION ("MoveToRight")
					CALL moveRecord("toRight",idxLeft,idxRight)
					
				ON ACTION ("MoveToLeft")
					CALL moveRecord("toLeft",idxLeft,idxRight)
						
				ON ACTION "CANCEL"
					EXIT DIALOG	
			
			END DIALOG
		
		
		ON ACTION "INPUT ARRAY"  ------------------- INPUT ARRAY
			
			DIALOG ATTRIBUTE(UNBUFFERED)
			
				INPUT ARRAY modu_arr_left WITHOUT DEFAULTS FROM tableLeft.*
					BEFORE ROW
						LET idxLeft = arr_curr()
						CALL displayProperties(idxLeft,idxRight)
						
					ON ACTION ("ACCEPT")
						CALL moveRecord("toRight",idxLeft,idxRight)

				END INPUT
		
				INPUT ARRAY modu_arr_right WITHOUT DEFAULTS  FROM tableRight.*
					BEFORE ROW
						LET idxRight = arr_curr()		
						CALL displayProperties(idxLeft,idxRight)
					
					ON ACTION ("ACCEPT")
						CALL moveRecord("toLeft",idxLeft,idxRight)
				END INPUT
				-----------------------------------------

				ON ACTION ("MoveToRight")
					CALL moveRecord("toRight",idxLeft,idxRight)
								
				ON ACTION ("MoveToLeft")
					CALL moveRecord("toLeft",idxLeft,idxRight)

								
				ON ACTION "CANCEL"
					EXIT DIALOG	
			
			END DIALOG

		-----------------------------------------------

		ON ACTION "CANCEL"
			EXIT MENU
			
    ON ACTION "HELP"
  		CALL onlineHelp(NULL,"TableAll")		
  					
	END MENU
END MAIN
################################################################################
# END MAIN
################################################################################


################################################################################
# FUNCTION displayProperties(p_idx_left,p_idx_right)
#
# DISPLAY some table/array properties in the form
################################################################################
FUNCTION displayProperties(p_idx_left,p_idx_right)
	DEFINE p_idx_left,p_idx_right SMALLINT
	
	DISPLAY p_idx_left TO idxLeft
	DISPLAY p_idx_right TO idxRight
	DISPLAY modu_arr_left.getSize() TO m_arr_leftSize
	DISPLAY modu_arr_right.getSize() TO m_arr_rightSize
	 
END FUNCTION
################################################################################
# END FUNCTION displayProperties(p_idx_left,p_idx_right)
################################################################################


################################################################################
# FUNCTION moveRecord(p_direction,pIdx)
#
# MOVE a record from one array to the other (both directions are possible)
################################################################################
FUNCTION moveRecord(p_direction,p_idx_left,p_idx_right)
	DEFINE p_direction STRING
	DEFINE p_idx_left,p_idx_right SMALLINT
	DEFINE l_rec_member OF modu_dt_recMember

	#We are copying the data from one array to the other and delete it		
	CASE p_direction
		WHEN "toRight"
			IF p_idx_left < 1 THEN
				RETURN --invalid index, table/array is empty
			END IF		
			CALL modu_arr_right.append([modu_arr_left[p_idx_left].activeMember,modu_arr_left[p_idx_left].firstName,modu_arr_left[p_idx_left].lastName])
			CALL modu_arr_left.deleteElement(p_idx_left)

		WHEN "toLeft" 
			IF p_idx_right < 1 THEN
				RETURN --invalid index, table/array is empty
			END IF	
			CALL modu_arr_left.append([modu_arr_right[p_idx_right].activeMember,modu_arr_right[p_idx_right].firstName,modu_arr_right[p_idx_right].lastName])
			CALL modu_arr_right.deleteElement(p_idx_right)

	END CASE

	CALL displayProperties(p_idx_left,p_idx_right)
	
END FUNCTION
################################################################################
# END FUNCTION moveRecord(p_direction,pIdx)
################################################################################


################################################################################
# FUNCTION init_data()
#
# initialise the data arrays
################################################################################		
FUNCTION init_data()
	DEFINE i SMALLINT
	
	LET i = 1
	LET modu_arr_left[i].activeMember = TRUE
	LET modu_arr_left[i].firstName = "Hubert"
	LET modu_arr_left[i].lastName = "Hölzl"

	LET i = i+1
	LET modu_arr_left[i].activeMember = TRUE
	LET modu_arr_left[i].firstName = "John"
	LET modu_arr_left[i].lastName = "Walker"

	LET i = i+1
	LET modu_arr_left[i].activeMember = TRUE
	LET modu_arr_left[i].firstName = "Eric"
	LET modu_arr_left[i].lastName = "Sundar"


	LET i = 1
	LET modu_arr_right[i].activeMember = TRUE
	LET modu_arr_right[i].firstName = "Mike"
	LET modu_arr_right[i].lastName = "Oldfield"

	LET i = i+1
	LET modu_arr_right[i].activeMember = TRUE
	LET modu_arr_right[i].firstName = "Chris"
	LET modu_arr_right[i].lastName = "Marple"


	LET i = i+1
	LET modu_arr_right[i].activeMember = TRUE
	LET modu_arr_right[i].firstName = "Daren"
	LET modu_arr_right[i].lastName = "Waffel"

END FUNCTION
################################################################################
# END FUNCTION init_data()
################################################################################