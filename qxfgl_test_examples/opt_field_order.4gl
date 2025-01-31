#opt_field_order
###########################################################################
# MODULE Scope Variables
###########################################################################
#Event Log/Report variables
DEFINE modu_log STRING
DEFINE modu_log_event_field BOOLEAN
DEFINE modu_log_event_other BOOLEAN

DEFINE modu_rec_source,modu_rec_target RECORD
	hqAddress1 STRING,
	hqAddress2 STRING,
	hqAddress3 STRING,
	hqPostCode VARCHAR(6),
	hqCity STRING,
	hqState STRING,
	invAddress1 STRING,
	invAddress2 STRING,
	invAddress3 STRING,
	invPostCode VARCHAR(6),
	invCity STRING,
	invState STRING,
	delAddress1 STRING,
	delAddress2 STRING,
	delAddress3 STRING,
	delPostCode VARCHAR(6),
	delCity STRING,
	delState  STRING
	END RECORD
DEFINE modu_arr_rec_A  DYNAMIC ARRAY OF
	RECORD
		a_col1,a_col2,a_col3 STRING
	END RECORD

DEFINE modu_arr_rec_B  DYNAMIC ARRAY OF
	RECORD
		b_col1,b_col2,b_col3 STRING
	END RECORD

	
DEFINE modu_rec_options RECORD 
	opt_field_order SMALLINT,
	opt_input_wrap BOOLEAN
	END RECORD

DEFINE modu_loop BOOLEAN
	
DEFINE modu_f_required STRING
DEFINE modu_f_not_null_form STRING
DEFINE modu_f_not_null_4gl STRING
DEFINE modu_f_greater_100 SMALLINT
DEFINE modu_f_reserve STRING
	
DEFINE modu_rec_special RECORD
	r_required STRING,
	r_not_null_form STRING,
	r_not_null_4gl STRING,
	r_greater_100 SMALLINT,
	r_reserve STRING	
END RECORD			

DEFINE modu_rec_nav,modu_rec_nav_history RECORD
	int_flag INT,
	last_key INT,
	last_action STRING,
	status INT,
	screen_navigation_direction STRING	
END RECORD

#Field order constants
CONSTANT FIELD_ORDER_CONSTRAINED SMALLINT = 0
CONSTANT FIELD_ORDER_UNCONSTRAINED SMALLINT = 1
CONSTANT FIELD_ORDER_FORM SMALLINT = 2

#Navigation direction
CONSTANT DIR_FORWARD CHAR = "F"
CONSTANT DIR_BACKWARD CHAR = "B"

#Event Log Report Contstants
CONSTANT IGNORE_EVENT SMALLINT = 0
CONSTANT FIELD_EVENT SMALLINT = 1
CONSTANT INFO_EVENT SMALLINT = 2
CONSTANT OTHER_EVENT SMALLINT = 3	
###########################################################################
# MAIN
#
#
###########################################################################	
MAIN
	DEFINE l_idx_A SMALLINT
	DEFINE l_idx_B SMALLINT
	DEFINE l_msg STRING
	
	CALL ui_init()
	CALL hideNavigation()
	
	CALL init()
	LET modu_rec_options.opt_field_order = FIELD_ORDER_CONSTRAINED
	LET modu_rec_options.opt_input_wrap = 0
	
	OPEN WINDOW opt_field_order WITH FORM "form/opt_field_order"

	LET modu_loop = TRUE
	WHILE modu_loop = TRUE 

		CALL display_log(IGNORE_EVENT,NULL)

		CASE modu_rec_options.opt_field_order
			WHEN FIELD_ORDER_CONSTRAINED
				OPTIONS FIELD ORDER CONSTRAINED
				MESSAGE "FIELD ORDER CONSTRAINED"
				CALL display_log(INFO_EVENT,"FIELD ORDER CONSTRAINED")
				SLEEP 1

			WHEN FIELD_ORDER_UNCONSTRAINED
				OPTIONS FIELD ORDER UNCONSTRAINED
				MESSAGE "FIELD ORDER UNCONSTRAINED"
				CALL display_log(INFO_EVENT,"FIELD ORDER UNCONSTRAINED")
				SLEEP 1

			WHEN FIELD_ORDER_FORM
				OPTIONS FIELD ORDER FORM
				MESSAGE "FIELD ORDER FORM"
				CALL display_log(INFO_EVENT,"FIELD ORDER FORM")
				SLEEP 1

		END CASE

		CASE modu_rec_options.opt_input_wrap
			WHEN 0
				OPTIONS INPUT NO WRAP
				MESSAGE "OPTIONS INPUT NO WRAP"
				CALL display_log(INFO_EVENT,"OPTIONS INPUT NO WRAP")
				SLEEP 1

			WHEN 1
				OPTIONS INPUT WRAP
				MESSAGE "OPTIONS INPUT WRAP"
				CALL display_log(INFO_EVENT,"OPTIONS INPUT WRAP")
				SLEEP 1

		END CASE

		#------------------------------------------------------------
		#---------------------- DIALOG ------------------------------
		DIALOG ATTRIBUTE(UNBUFFERED)
		
			#OPTIONS FIELD ORDER & INPUT WRAP etc..
			INPUT BY NAME modu_rec_options.* WITHOUT DEFAULTS
				ON CHANGE opt_field_order
					LET modu_log = NULL
					EXIT DIALOG
				ON CHANGE opt_input_wrap
					LET modu_log = NULL
					EXIT DIALOG
					
			END INPUT

 			#---------------------------------------
			#Event Log/Report Category Panel/View
 			#---------------------------------------
			INPUT modu_log WITHOUT DEFAULTS FROM log
			END INPUT
 			#---------------------------------------
			#Event Log/Report Category filter
 			#---------------------------------------
			INPUT modu_log_event_field,modu_log_event_other WITHOUT DEFAULTS FROM log_event_field, log_event_other
			END INPUT

			#---------------------------------------
			# INPUT SOURCE ADDRESS
			#---------------------------------------
			INPUT modu_rec_source.* WITHOUT DEFAULTS FROM scr_modu_rec_source.*
		
				#HQ----------------
		
				#s_hqAddress1
				ON CHANGE s_hqAddress1 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_hqAddress1") 		
		
				BEFORE FIELD s_hqAddress1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_hqAddress1") 		
		
				AFTER FIELD s_hqAddress1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_hqAddress1") 		
					CALL nav_history()  
				#s_hqAddress2
				ON CHANGE s_hqAddress2 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_hqAddress2") 		
		
				BEFORE FIELD s_hqAddress2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_hqAddress2") 		
		
				AFTER FIELD s_hqAddress2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_hqAddress2") 
					CALL nav_history()
					
				#s_hqAddress3
				ON CHANGE s_hqAddress3 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_hqAddress3") 
		
				BEFORE FIELD s_hqAddress3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_hqAddress3") 		
		
				AFTER FIELD s_hqAddress3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_hqAddress3") 
					CALL nav_history()
							
				#s_hqPostCode
				ON CHANGE s_hqPostCode 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_hqPostCode") 		
		
				BEFORE FIELD s_hqPostCode 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_hqPostCode") 		
		
				AFTER FIELD s_hqPostCode 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_hqPostCode")
					CALL nav_history() 
							
				#s_hqCity
				ON CHANGE s_hqCity 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_hqCity") 		
		
				BEFORE FIELD s_hqCity 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_hqCity") 		
		
				AFTER FIELD s_hqCity 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_hqCity")
					CALL nav_history() 
				
				#s_hqState	
				ON CHANGE s_hqState 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_hqState") 		
		
				BEFORE FIELD s_hqState 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_hqState") 		
		
				AFTER FIELD s_hqState 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_hqState")
					CALL nav_history() 
		
		
				#INVoice -----------------------------------------
		
				#s_invAddress1
				ON CHANGE s_invAddress1 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_invAddress1") 		
		
				BEFORE FIELD s_invAddress1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_invAddress1") 		
		
				AFTER FIELD s_invAddress1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_invAddress1")
					CALL nav_history() 		
		
				#s_invAddress2
				ON CHANGE s_invAddress2 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_invAddress2") 		
		
				BEFORE FIELD s_invAddress2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_invAddress2") 		
		
				AFTER FIELD s_invAddress2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_invAddress2")
					CALL nav_history() 
					
				#s_invAddress3
				ON CHANGE s_invAddress3 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_invAddress3") 
		
				BEFORE FIELD s_invAddress3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_invAddress3") 		
		
				AFTER FIELD s_invAddress3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_invAddress3")
					CALL nav_history() 
							
				#s_invPostCode
				ON CHANGE s_invPostCode 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_invPostCode") 		
		
				BEFORE FIELD s_invPostCode 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_invPostCode") 		
		
				AFTER FIELD s_invPostCode 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_invPostCode")
					CALL nav_history() 
							
				#s_invCity
				ON CHANGE s_invCity 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_invCity") 		
		
				BEFORE FIELD s_invCity 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_invCity") 		
		
				AFTER FIELD s_invCity 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_invCity")
					CALL nav_history() 
				
				#s_invState	
				ON CHANGE s_invState 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_invState") 		
		
				BEFORE FIELD s_invState 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_invState") 		
		
				AFTER FIELD s_invState 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_invState")
					CALL nav_history() 
		
		
				#DELivery ------------------------------------------------------
		
				#s_delAddress1
				ON CHANGE s_delAddress1 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_delAddress1") 		
		
				BEFORE FIELD s_delAddress1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_delAddress1") 		
		
				AFTER FIELD s_delAddress1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_delAddress1")
					CALL nav_history() 		
		
				#s_delAddress2
				ON CHANGE s_delAddress2 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_delAddress2") 		
		
				BEFORE FIELD s_delAddress2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_delAddress2") 		
		
				AFTER FIELD s_delAddress2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_delAddress2")
					CALL nav_history() 
					
				#s_delAddress3
				ON CHANGE s_delAddress3 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_delAddress3") 
		
				BEFORE FIELD s_delAddress3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_delAddress3") 		
		
				AFTER FIELD s_delAddress3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_delAddress3")
					CALL nav_history() 
							
				#s_delPostCode
				ON CHANGE s_delPostCode 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_delPostCode") 		
		
				BEFORE FIELD s_delPostCode 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_delPostCode") 		
		
				AFTER FIELD s_delPostCode 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_delPostCode")
					CALL nav_history() 
							
				#s_delCity
				ON CHANGE s_delCity 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_delCity") 		
		
				BEFORE FIELD s_delCity 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_delCity") 		
		
				AFTER FIELD s_delCity 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_delCity")
					CALL nav_history() 
				
				#s_delState	
				ON CHANGE s_delState 
					CALL display_log(FIELD_EVENT,"ON CHANGE s_delState") 		
		
				BEFORE FIELD s_delState 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD s_delState") 		
		
				AFTER FIELD s_delState 
					CALL display_log(FIELD_EVENT,"AFTER FIELD s_delState")
					CALL nav_history() 
		
		
			END INPUT


			#-----------------------------------------------------------------------------
			------------------------------
			# INPUT ARRAY A
			------------------------------

			INPUT ARRAY modu_arr_rec_A WITHOUT DEFAULTS FROM scr_table_A.*

				BEFORE ROW
					LET l_idx_A = arr_curr()
					LET l_msg = "INP-ARR-A-BEFORE ROW:", trim(l_idx_A)
					CALL display_log(OTHER_EVENT,l_msg)
					
				AFTER ROW
					LET l_msg = "INP-ARR-A-AFTER ROW:", trim(l_idx_A)
					CALL display_log(OTHER_EVENT,l_msg)

				#a_col1
				ON CHANGE a_col1 
					CALL display_log(FIELD_EVENT,"ON CHANGE a_col1") 		
					IF modu_arr_rec_A[l_idx_A].a_col1 IS NULL THEN
						LET l_msg = "Field A.a_col1 can not be NULL" 
						ERROR l_msg
						CALL display_log(FIELD_EVENT,l_msg)
						NEXT FIELD CURRENT
					END IF
					
				BEFORE FIELD a_col1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD a_col1") 		
		
				AFTER FIELD a_col1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD a_col1")
					CALL nav_history() 
					IF modu_arr_rec_A[l_idx_A].a_col1 IS NULL THEN
						LET l_msg = "Field A.a_col1 can not be NULL" 
						ERROR l_msg
						CALL display_log(FIELD_EVENT,l_msg)
						NEXT FIELD CURRENT
					END IF

				#col2
				ON CHANGE col2 
					CALL display_log(FIELD_EVENT,"ON CHANGE col2") 		
		
				BEFORE FIELD col2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD col2") 		
		
				AFTER FIELD col2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD col2")
					CALL nav_history() 
					
				#col3
				ON CHANGE col3 
					CALL display_log(FIELD_EVENT,"ON CHANGE col3") 		
		
				BEFORE FIELD col3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD col3") 		
		
				AFTER FIELD col3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD col3")
					CALL nav_history() 					
			 
			END INPUT


			#-----------------------------------------------------------------------------
			------------------------------
			# INPUT ARRAY B
			------------------------------

			INPUT ARRAY modu_arr_rec_B WITHOUT DEFAULTS FROM scr_table_B.*

				BEFORE ROW
					LET l_idx_B = arr_curr()
					LET l_msg = "INP-ARR-B-BEFORE ROW:", trim(l_idx_B)
					CALL display_log(OTHER_EVENT,l_msg)
					
				AFTER ROW
					LET l_msg = "INP-ARR-B-AFTER ROW:", trim(l_idx_B)
					CALL display_log(OTHER_EVENT,l_msg)

					IF modu_arr_rec_B[l_idx_B].b_col1 IS NULL THEN
						IF get_is_screen_navigation_forward() = "F" THEN
							LET l_msg = "Field B.b_col1 can not be NULL" 
							ERROR l_msg
							CALL display_log(OTHER_EVENT,l_msg)
							NEXT FIELD CURRENT
						ELSE
							LET l_msg = "DELETE ROW ", trim(l_idx_B)
							CALL display_log(FIELD_EVENT,l_msg)
							MESSAGE l_msg
							CALL modu_arr_rec_B.delete(l_idx_B)
						END IF
					END IF					
					

				#b_col1
				ON CHANGE b_col1 
					CALL display_log(FIELD_EVENT,"ON CHANGE b_col1") 		
					IF modu_arr_rec_B[l_idx_B].b_col1 IS NULL THEN
							LET l_msg = "Field B.b_col1 can not be NULL" 
							ERROR l_msg
							CALL display_log(FIELD_EVENT,l_msg)
							NEXT FIELD CURRENT
					END IF
					
				BEFORE FIELD b_col1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD b_col1") 		
		
				AFTER FIELD b_col1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD b_col1")
					CALL nav_history() 
					IF modu_arr_rec_B[l_idx_B].b_col1 IS NULL THEN
						IF get_is_screen_navigation_forward() = "F" THEN
							LET l_msg = "Field B.b_col1 can not be NULL" 
							ERROR l_msg
							CALL display_log(FIELD_EVENT,l_msg)
							NEXT FIELD CURRENT
						END IF
					ELSE
						#??? nothing
					END IF					
				#col2
				ON CHANGE col2 
					CALL display_log(FIELD_EVENT,"ON CHANGE col2") 		
		
				BEFORE FIELD col2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD col2") 		
		
				AFTER FIELD col2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD col2")
					CALL nav_history() 
					
				#col3
				ON CHANGE col3 
					CALL display_log(FIELD_EVENT,"ON CHANGE col3") 		
		
				BEFORE FIELD col3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD col3") 		
		
				AFTER FIELD col3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD col3")
					CALL nav_history() 					
			 
			END INPUT
			
			
			#--------------------------------------------------------------------------------

			#---------------------------------------
			# INPUT REQUIRED - Form Attribute
			#---------------------------------------
			INPUT modu_f_required WITHOUT DEFAULTS FROM f_required
				ON CHANGE f_required 
					CALL display_log(FIELD_EVENT,"ON CHANGE f_required") 		
		
				BEFORE FIELD f_required 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD f_required" )		
		
				AFTER FIELD f_required 
					CALL display_log(FIELD_EVENT,"AFTER FIELD f_required")
					CALL nav_history() 

			END INPUT
			
			#---------------------------------------
			# INPUT NOT NULL - Form Attribute
			#---------------------------------------
			INPUT modu_f_not_null_form WITHOUT DEFAULTS FROM f_not_null_form
				ON CHANGE f_not_null_form 
					CALL display_log(FIELD_EVENT,"ON CHANGE f_not_null_form") 		
		
				BEFORE FIELD f_not_null_form 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD f_not_null_form") 		
		
				AFTER FIELD f_not_null_form 
					CALL display_log(FIELD_EVENT,"AFTER FIELD f_not_null_form")
					CALL nav_history() 

			END INPUT

			#---------------------------------------
			# INPUT NOT NULL - 4GL validation
			#---------------------------------------
			INPUT modu_f_not_null_4gl WITHOUT DEFAULTS FROM f_not_null_4gl
				ON CHANGE f_not_null_4gl 
					CALL display_log(FIELD_EVENT,"ON CHANGE f_not_null_4gl") 		
					IF modu_f_not_null_4gl IS NULL THEN
						CALL display_log(FIELD_EVENT,"ON CHANGE: f_not_null_4gl must not be NULL")
						ERROR "ON CHANGE: f_not_null_4gl must not be NULL"
						NEXT FIELD CURRENT
					END IF
					
				BEFORE FIELD f_not_null_4gl 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD f_not_null_4gl") 		
		
				AFTER FIELD f_not_null_4gl 
					CALL display_log(FIELD_EVENT,"AFTER FIELD f_not_null_4gl")
					CALL nav_history() 
					IF modu_f_not_null_4gl IS NULL THEN
						CALL display_log(FIELD_EVENT,"AFTER FIELD : f_not_null_4gl must not be NULL")
						ERROR "AFTER FIELD : f_not_null_4gl must not be NULL"
						NEXT FIELD CURRENT
					END IF

			END INPUT


			#---------------------------------------
			# INPUT > 100
			#---------------------------------------
			INPUT modu_f_greater_100 WITHOUT DEFAULTS FROM f_greater_100
				ON CHANGE f_greater_100 
					CALL display_log(FIELD_EVENT,"ON CHANGE f_greater_100") 		
					IF modu_f_greater_100 <= 100 THEN
						CALL display_log(FIELD_EVENT,"ON CHANGE: VALUE is NOT greater than 100")
						ERROR "ON CHANGE: VALUE is NOT greater than 100"
						NEXT FIELD CURRENT
					END IF
					
				BEFORE FIELD f_greater_100 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD f_greater_100") 		
		
				AFTER FIELD f_greater_100 
					CALL display_log(FIELD_EVENT,"AFTER FIELD f_greater_100")
					CALL nav_history() 
					IF modu_f_greater_100 <= 100 THEN
						CALL display_log(FIELD_EVENT,"AFTER FIELD: VALUE is NOT greater than 100")
						ERROR "AFTER FIELD: VALUE is NOT greater than 100"
						NEXT FIELD CURRENT
					END IF


			END INPUT

			#---------------------------------------
			# INPUT RESERVE
			#---------------------------------------
			INPUT modu_f_reserve WITHOUT DEFAULTS FROM f_reserve
				ON CHANGE f_reserve 
					CALL display_log(FIELD_EVENT,"ON CHANGE f_reserve") 		
		
				BEFORE FIELD f_reserve 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD f_reserve" )		
		
				AFTER FIELD f_reserve 
					CALL display_log(FIELD_EVENT,"AFTER FIELD f_reserve")
					CALL nav_history() 

			END INPUT
			
			#----------------------------------------------------------

			#---------------------------------------
			# INPUT ON RECORD with conditions
			#---------------------------------------			
			INPUT BY NAME modu_rec_special.* WITHOUT DEFAULTS

				#------------------------
				#REQUIRED
				ON CHANGE r_required 
					CALL display_log(FIELD_EVENT,"ON CHANGE r_required") 		
		
				BEFORE FIELD r_required 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD r_required") 		
		
				AFTER FIELD r_required 
					CALL display_log(FIELD_EVENT,"AFTER FIELD r_required")
					CALL nav_history() 

				#------------------------
				#NOT NULL - Form attribute
				ON CHANGE r_not_null_form 
					CALL display_log(FIELD_EVENT,"ON CHANGE r_not_null_form") 		
		
				BEFORE FIELD r_not_null_form 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD r_not_null_form") 		
		
				AFTER FIELD r_not_null_form 
					CALL display_log(FIELD_EVENT,"AFTER FIELD r_not_null_form")
					CALL nav_history()
					
				#------------------------ 
				#NOT NULL in 4GL AFTER FIELD
				ON CHANGE r_not_null_4gl 
					CALL display_log(FIELD_EVENT,"ON CHANGE f_not_null_4gl") 		
					IF modu_rec_special.r_not_null_4gl IS NULL THEN
						CALL display_log(FIELD_EVENT,"ON CHANGE: r_not_null_4gl must not be NULL")
						ERROR "ON CHANGE: r_not_null_4gl must not be NULL"
						NEXT FIELD r_not_null_4gl
					END IF
					
				BEFORE FIELD r_not_null_4gl 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD r_not_null_4gl") 		
		
				AFTER FIELD r_not_null_4gl 
					CALL display_log(FIELD_EVENT,"AFTER FIELD r_not_null_4gl")
					CALL nav_history() 					

					IF modu_rec_special.r_not_null_4gl IS NULL THEN
						CALL display_log(FIELD_EVENT,"AFTER FIELD: r_not_null_4gl must not be NULL")
						ERROR "AFTER FIELD: r_not_null_4gl must not be NULL"
						NEXT FIELD r_not_null_4gl
					END IF
									
				#------------------------ 
				#Value greater than 100 value > 100
				ON CHANGE r_greater_100 
					CALL display_log(FIELD_EVENT,"ON CHANGE r_greater_100") 		
					IF modu_rec_special.r_greater_100 <= 100 THEN
						CALL display_log(FIELD_EVENT,"ON CHANGE: VALUE is NOT greater than 100")
						ERROR "ON CHANGE: VALUE is NOT greater than 100"
						NEXT FIELD r_greater_100
					END IF
					
				BEFORE FIELD r_greater_100 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD r_greater_100") 		
		
				AFTER FIELD r_greater_100 
					CALL display_log(FIELD_EVENT,"AFTER FIELD r_greater_100")
					CALL nav_history() 
					IF modu_rec_special.r_greater_100 <= 100 THEN
						CALL display_log(FIELD_EVENT,"AFTER FIELD: VALUE is NOT greater than 100")
						ERROR "AFTER FIELD: VALUE is NOT greater than 100"
						NEXT FIELD r_greater_100
					END IF

				#------------------------ 
				#Reserve (has no condition or validation)
				ON CHANGE r_reserve 
					CALL display_log(FIELD_EVENT,"ON CHANGE r_reserve") 		
		
				BEFORE FIELD r_reserve 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD r_reserve" )		
		
				AFTER FIELD r_reserve 
					CALL display_log(FIELD_EVENT,"AFTER FIELD r_reserve")
					CALL nav_history() 
					
			
			END INPUT
			# END RECORD INPUT 'Conditions'



			#-----------------------------------------------------------------------------
			------------------------------
			# INPUT TARGET ADDRESS
			------------------------------
			INPUT modu_rec_target.* WITHOUT DEFAULTS FROM scr_modu_rec_target.*
		
				#HQ----------------
		
				#t_hqAddress1
				ON CHANGE t_hqAddress1 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_hqAddress1") 		
		
				BEFORE FIELD t_hqAddress1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_hqAddress1") 		
		
				AFTER FIELD t_hqAddress1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_hqAddress1")
					CALL nav_history() 		
		
				#t_hqAddress2
				ON CHANGE t_hqAddress2 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_hqAddress2") 		
		
				BEFORE FIELD t_hqAddress2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_hqAddress2") 		
		
				AFTER FIELD t_hqAddress2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_hqAddress2")
					CALL nav_history() 
					
				#t_hqAddress3
				ON CHANGE t_hqAddress3 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_hqAddress3") 
		
				BEFORE FIELD t_hqAddress3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_hqAddress3") 		
		
				AFTER FIELD t_hqAddress3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_hqAddress3")
					CALL nav_history() 
							
				#t_hqPostCode
				ON CHANGE t_hqPostCode 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_hqPostCode") 		
		
				BEFORE FIELD t_hqPostCode 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_hqPostCode") 		
		
				AFTER FIELD t_hqPostCode 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_hqPostCode")
					CALL nav_history() 
							
				#t_hqCity
				ON CHANGE t_hqCity 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_hqCity") 		
		
				BEFORE FIELD t_hqCity 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_hqCity") 		
		
				AFTER FIELD t_hqCity 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_hqCity")
					CALL nav_history() 
				
				#t_hqState	
				ON CHANGE t_hqState 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_hqState") 		
		
				BEFORE FIELD t_hqState 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_hqState") 		
		
				AFTER FIELD t_hqState 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_hqState")
					CALL nav_history() 
		
		
				#INVoice -----------------------------------------
		
				#t_invAddress1
				ON CHANGE t_invAddress1 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_invAddress1") 		
		
				BEFORE FIELD t_invAddress1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_invAddress1") 		
		
				AFTER FIELD t_invAddress1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_invAddress1")
					CALL nav_history() 		
		
				#t_invAddress2
				ON CHANGE t_invAddress2 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_invAddress2") 		
		
				BEFORE FIELD t_invAddress2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_invAddress2") 		
		
				AFTER FIELD t_invAddress2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_invAddress2")
					CALL nav_history() 
					
				#t_invAddress3
				ON CHANGE t_invAddress3 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_invAddress3") 
		
				BEFORE FIELD t_invAddress3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_invAddress3") 		
		
				AFTER FIELD t_invAddress3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_invAddress3")
					CALL nav_history() 
							
				#t_invPostCode
				ON CHANGE t_invPostCode 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_invPostCode") 		
		
				BEFORE FIELD t_invPostCode 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_invPostCode") 		
		
				AFTER FIELD t_invPostCode 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_invPostCode")
					CALL nav_history() 
							
				#t_invCity
				ON CHANGE t_invCity 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_invCity") 		
		
				BEFORE FIELD t_invCity 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_invCity") 		
		
				AFTER FIELD t_invCity 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_invCity")
					CALL nav_history() 
				
				#t_invState	
				ON CHANGE t_invState 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_invState") 		
		
				BEFORE FIELD t_invState 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_invState") 		
		
				AFTER FIELD t_invState 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_invState")
					CALL nav_history() 
		
		
				#DELivery ------------------------------------------------------
		
				#t_delAddress1
				ON CHANGE t_delAddress1 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_delAddress1") 		
		
				BEFORE FIELD t_delAddress1 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_delAddress1") 		
		
				AFTER FIELD t_delAddress1 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_delAddress1")
					CALL nav_history() 		
		
				#t_delAddress2
				ON CHANGE t_delAddress2 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_delAddress2") 		
		
				BEFORE FIELD t_delAddress2 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_delAddress2") 		
		
				AFTER FIELD t_delAddress2 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_delAddress2")
					CALL nav_history() 
					
				#t_delAddress3
				ON CHANGE t_delAddress3 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_delAddress3") 
		
				BEFORE FIELD t_delAddress3 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_delAddress3") 		
		
				AFTER FIELD t_delAddress3 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_delAddress3")
					CALL nav_history() 
							
				#t_delPostCode
				ON CHANGE t_delPostCode 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_delPostCode") 		
		
				BEFORE FIELD t_delPostCode 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_delPostCode") 		
		
				AFTER FIELD t_delPostCode 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_delPostCode")
					CALL nav_history() 
							
				#t_delCity
				ON CHANGE t_delCity 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_delCity") 		
		
				BEFORE FIELD t_delCity 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_delCity") 		
		
				AFTER FIELD t_delCity 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_delCity")
					CALL nav_history() 
				
				#t_delState	
				ON CHANGE t_delState 
					CALL display_log(FIELD_EVENT,"ON CHANGE t_delState") 		
		
				BEFORE FIELD t_delState 
					CALL display_log(FIELD_EVENT,"BEFORE FIELD t_delState") 		
		
				AFTER FIELD t_delState 
					CALL display_log(FIELD_EVENT,"AFTER FIELD t_delState")
					CALL nav_history() 
		
		
			END INPUT

			ON ACTION "CLEAR LOG"
				LET modu_log = NULL			
				CALL display_log(IGNORE_EVENT,NULL)
				
			ON ACTION "ANY EVENT"
				CALL nav_history()
			
			ON ACTION "EXIT"
				LET modu_loop = FALSE 
				EXIT DIALOG
		END DIALOG
	
	END WHILE	
END MAIN
###########################################################################
# END MAIN
###########################################################################


###########################################################################
# FUNCTION init()
#
# Init Variables
###########################################################################
FUNCTION init()
	LET modu_log_event_field = TRUE
	LET modu_log_event_other = TRUE
	LET modu_rec_source.hqAddress1 = "Address 1"
	LET modu_rec_source.hqAddress2 = "Address 2"
	LET modu_rec_source.hqAddress3 = "Address 3"
	LET modu_rec_source.hqPostCode = "Post Code"
	LET modu_rec_source.hqCity     = "Germany"
	LET modu_rec_source.hqState    = "State"

	LET modu_rec_source.invAddress1 = "Address 1"
	LET modu_rec_source.invAddress2 = "Address 2"
	LET modu_rec_source.invAddress3 = "Address 3"
	LET modu_rec_source.invPostCode = "Post Code"
	LET modu_rec_source.invCity     = "Germany"
	LET modu_rec_source.invState    = "State"

	LET modu_rec_source.delAddress1 = "Address 1"
	LET modu_rec_source.delAddress2 = "Address 2"
	LET modu_rec_source.delAddress3 = "Address 3"
	LET modu_rec_source.delPostCode = "Post Code"
	LET modu_rec_source.delCity     = "Germany"
	LET modu_rec_source.delState    = "State"


	LET modu_rec_target.hqAddress1 = "Address 1"
	LET modu_rec_target.hqAddress2 = "Address 2"
	LET modu_rec_target.hqAddress3 = "Address 3"
	LET modu_rec_target.hqPostCode = "Post Code"
	LET modu_rec_target.hqCity     = "Germany"
	LET modu_rec_target.hqState    = "State"

	LET modu_rec_target.invAddress1 = "Address 1"
	LET modu_rec_target.invAddress2 = "Address 2"
	LET modu_rec_target.invAddress3 = "Address 3"
	LET modu_rec_target.invPostCode = "Post Code"
	LET modu_rec_target.invCity     = "Germany"
	LET modu_rec_target.invState    = "State"

	LET modu_rec_target.delAddress1 = "Address 1"
	LET modu_rec_target.delAddress2 = "Address 2"
	LET modu_rec_target.delAddress3 = "Address 3"
	LET modu_rec_target.delPostCode = "Post Code"
	LET modu_rec_target.delCity     = "Germany"
	LET modu_rec_target.delState    = "State"
	
	LET modu_arr_rec_A[1].a_col1="AA1"
	LET modu_arr_rec_A[1].a_col2="AA2"
	LET modu_arr_rec_A[1].a_col3="AA3"		

	LET modu_arr_rec_B[1].b_col1="BA1"
	LET modu_arr_rec_B[1].b_col2="BA2"
	LET modu_arr_rec_B[1].b_col3="BA3"		
		
END FUNCTION
###########################################################################
# END FUNCTION init()
###########################################################################


###########################################################################
# FUNCTION nav_history()
#
# We show some 4gl status variables, last action, last key... from current AND previous interactions
###########################################################################
FUNCTION nav_history()

	#save history
	LET modu_rec_nav_history.* = modu_rec_nav.* 

	LET modu_rec_nav.int_flag = int_flag
	LET modu_rec_nav.last_key = fgl_lastkey()
	LET modu_rec_nav.last_action = fgl_lastaction()
	LET modu_rec_nav.status = status
	LET modu_rec_nav.screen_navigation_direction = get_is_screen_navigation_forward()

	DISPLAY modu_rec_nav_history.int_flag TO h_int_flag
	DISPLAY trim(fgl_keyname(modu_rec_nav_history.last_key)) TO h_last_key_name
	DISPLAY modu_rec_nav_history.last_key TO h_last_key_value
	DISPLAY modu_rec_nav_history.last_action TO h_last_action
	DISPLAY modu_rec_nav_history.status TO h_status
	DISPLAY modu_rec_nav_history.screen_navigation_direction TO h_screen_navigation_direction


	DISPLAY modu_rec_nav.int_flag TO int_flag
	DISPLAY trim(fgl_keyname(modu_rec_nav.last_key)) TO last_key_name
	DISPLAY modu_rec_nav.last_key TO last_key_value
	DISPLAY modu_rec_nav.last_action TO last_action
	DISPLAY modu_rec_nav.status TO status
	DISPLAY modu_rec_nav.screen_navigation_direction TO screen_navigation_direction
	
END FUNCTION
###########################################################################
# END FUNCTION nav_history()
###########################################################################


###########################################################################
# FUNCTION display_log(p_log_line)
#
# Stores all field navigation debug information in log text_area field
###########################################################################
FUNCTION display_log(p_event_type,p_log_line)
	DEFINE p_event_type SMALLINT
	DEFINE p_log_line STRING
	
	CASE p_event_type
		WHEN IGNORE_EVENT
			#LET modu_log = "[", trim(p_log_line), "]", "\n",  trim(modu_log) 
			#DISPLAY modu_log TO log
			
		WHEN INFO_EVENT
			LET modu_log = "[", trim(p_log_line), "]", "\n",  trim(modu_log) 
			DISPLAY modu_log TO log
					
		WHEN FIELD_EVENT
			IF modu_log_event_field = TRUE AND p_log_line IS NOT NULL THEN
				LET modu_log = "[", trim(get_is_screen_navigation_forward()), "]", trim(p_log_line), "\n",  trim(modu_log)
			END IF
			DISPLAY modu_log TO log
			
		WHEN OTHER_EVENT
			IF modu_log_event_other = TRUE AND p_log_line IS NOT NULL THEN
				LET modu_log = "[", trim(get_is_screen_navigation_forward()), "]", trim(p_log_line), "\n",  trim(modu_log)
			END IF
			DISPLAY modu_log TO log
			
		OTHERWISE
			CALL fgl_Winmessage("Internal 4GL error","Unknown p_event_type","ERROR")
			DISPLAY modu_log TO log	
	END CASE
	 
	
END FUNCTION
###########################################################################
# END FUNCTION display_log(p_log_line)
###########################################################################


###########################################################################
# FUNCTION get_screen_navigation()
#
# Detect the screen cursor navigation direction
###########################################################################
FUNCTION get_is_screen_navigation_forward() --returns FALSE if it moves back and TRUE if it moves forward
	DEFINE l_last_key SMALLINT
	DEFINE l_ret_direction CHAR --BOOLEAN
	DEFINE l_msg STRING
	
	LET l_ret_direction = "?"
	CASE 
		--WHEN fgl_lastAction("nextfield") LET l_ret_direction = DIR_FORWARD
		--WHEN fgl_lastAction("prevfield") LET l_ret_direction = DIR_BACKWARD
		WHEN int_flag = TRUE														LET l_ret_direction = DIR_BACKWARD 
		WHEN fgl_lastkey() = FGL_KEYVAL("ACCEPT")				LET l_ret_direction = DIR_FORWARD  #special case accept
		WHEN fgl_lastkey() =  FGL_KEYVAL("CANCEL")			LET l_ret_direction = DIR_BACKWARD  #special case cancel
		WHEN fgl_lastkey() =  FGL_KEYVAL("RETURN")			LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("DOWN")				LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("UP")					LET l_ret_direction = DIR_BACKWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("RIGHT")				LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("ARROW RIGHT")	LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("LEFT")				LET l_ret_direction = DIR_BACKWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("ARROW LEFT")	LET l_ret_direction = DIR_BACKWARD  #2002
		WHEN fgl_lastkey() =  FGL_KEYVAL("PAGEDOWN")		LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("PAGEUP")			LET l_ret_direction = DIR_BACKWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("END")					LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("HOME")				LET l_ret_direction = DIR_BACKWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("ENTER")				LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("TAB")					LET l_ret_direction = DIR_FORWARD
		WHEN fgl_lastkey() =  FGL_KEYVAL("SHIFT-TAB")		LET l_ret_direction = DIR_BACKWARD
	
		OTHERWISE #something I'm still unsure.. how to handle best with legacy code
			IF l_ret_direction = "?" THEN 
				CASE
					WHEN fgl_lastAction() = "append" LET l_ret_direction = DIR_FORWARD #NULL
					WHEN fgl_lastAction() = "insert" LET l_ret_direction = DIR_FORWARD #NULL
					WHEN fgl_lastAction() = "delete" LET l_ret_direction = DIR_BACKWARD # NULL
				END CASE
			END IF

			IF l_ret_direction = "?" THEN
				LET l_msg = 
					"Could not detect screen cursor navigation direction!\n",
					"FUNCTION get_screen_navigation()\n",
					"fgl_lastkey()=", trim(fgl_lastkey()), " fgl_keyname()=", trim(fgl_keyname(fgl_lastkey()))
				CALL fgl_winmessage("HuHo Error", l_msg,"error")
				--LET l_msg =
				--	"Could not detect screen cursor navigation direction!\n",	"FUNCTION get_screen_navigation()\n",
				--	"fgl_lastkey()=", trim(fgl_lastkey()), " fgl_keyname()=", trim(fgl_keyname(fgl_lastkey()))
				--ERROR l_msg
			END IF
	END CASE
	
	RETURN l_ret_direction
END FUNCTION
###########################################################################
# END FUNCTION get_screen_navigation()
###########################################################################