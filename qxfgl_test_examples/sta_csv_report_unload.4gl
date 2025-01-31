DEFINE dt_rec_participant TYPE AS RECORD 
		FName VARCHAR(30),
		LName VARCHAR(30),
		dob DATE,
		country VARCHAR(30)	
	END RECORD 

 
##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE i SMALLINT
	DEFINE l_rec_participant OF dt_rec_participant
	DEFINE l_db_name STRING
	DEFINE l_connected BOOLEAN
	DEFINE l_unl_file1 STRING
	DEFINE l_unl_file2 STRING
	DEFINE l_rpt_file1 STRING
	DEFINE l_unl_file1_text TEXT
	DEFINE l_unl_file2_text TEXT
	DEFINE l_rpt_file1_text TEXT

	CALL ui_init()
	DEFER INTERRUPT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit

	OPEN WINDOW sta_csv_report_unload WITH FORM "form/sta_csv_report_unload"	

	LET l_unl_file1 = "csv/output_unl_comma.csv"
	LET l_unl_file2 = "csv/output_unl_csv.csv"
	LET l_rpt_file1 = "csv/output_rpt_csv.csv"
		
	DISPLAY l_unl_file1 TO unl_file1
	DISPLAY l_unl_file2 TO unl_file2
	DISPLAY l_rpt_file1 TO rpt_file1
		
	LET l_db_name =  fgl_winprompt(0,0, "Enter the DB name to connect to", "cms", 25, 0)
	IF int_flag THEN	#user pressed cancel = exit
		EXIT PROGRAM
	END IF

	LET l_connected = FALSE	
	WHILE NOT l_connected 
		
		CONNECT TO l_db_name #"cms"

		IF status < 0 THEN 
			LET l_db_name =  fgl_winprompt(0,0, "Could not connect!\nEnter the DB name to connect to", "cms", 25, 0)
			IF int_flag THEN
					EXIT PROGRAM
				END IF
		ELSE
			LET l_connected = TRUE
			DISPLAY l_db_name TO db_name
		END IF
	END WHILE


#	TRY
#		DROP TABLE participant
#	END TRY

	TRY
	
		CREATE TEMP TABLE participant(
			FName VARCHAR(30),
			LName VARCHAR(30),
			dob DATE,
			country VARCHAR(30)
			)
	CATCH
		CALL fgl_winmessage("ERROR","Could not create DB table participate","ERROR")
		EXIT PROGRAM
	END TRY

	FOR i = 1 TO 100
		LET l_rec_participant.fname = get_random_fname()
		LET l_rec_participant.lname = get_random_lname()
		LET l_rec_participant.dob = get_random_date()
		LET l_rec_participant.country = get_random_country()
	
		DISPLAY l_rec_participant.*
		INSERT INTO participant VALUES (l_rec_participant.*)
			
	END FOR

	UNLOAD TO l_unl_file1 DELIMITER "," SELECT * FROM participant #"csv/output_comma.csv"
	UNLOAD TO l_unl_file2 DELIMITER "CSV" SELECT * FROM participant #"csv/output_csv.csv"

	CALL csv_report(l_rpt_file1)

	CALL l_unl_file1_text.readfile(l_unl_file1)
	CALL l_unl_file2_text.readfile(l_unl_file2)
	CALL l_rpt_file1_text.readfile(l_rpt_file1)

	INPUT l_unl_file1_text,l_unl_file2_text,l_rpt_file1_text WITHOUT DEFAULTS 
	FROM unl_text_file1,unl_text_file2,rpt_text_file1
	
	TRY
		DROP TABLE participant
	END TRY
	
	MENU
		BEFORE MENU
			CALL dialog.setActionHidden("ACCEPT",TRUE)
		ON ACTION CANCEL
			EXIT MENU
	END MENU
	
END MAIN
##################################################################################
# END MAIN
##################################################################################	

##################################################################################
# FUNCTION csv_report(p_rpt_file_name)
#
#
##################################################################################	
FUNCTION csv_report(p_rpt_file_name)
	DEFINE p_rpt_file_name STRING
	DEFINE l_rpt_file1 STRING
	DEFINE l_rec_participant OF dt_rec_participant

   DECLARE cur CURSOR FOR 
      SELECT * FROM participant

   START REPORT rep_name TO FILE p_rpt_file_name
   FOREACH cur INTO l_rec_participant.*
      OUTPUT TO REPORT rep_name(l_rec_participant.*)
   END FOREACH
   FINISH REPORT rep_name

END FUNCTION
##################################################################################
# END FUNCTION csv_report(p_rpt_file_name)
##################################################################################	

##################################################################################
# REPORT rep_name(p_rec_participant)
#
#
##################################################################################	
REPORT rep_name(p_rec_participant)
	DEFINE p_rec_participant OF dt_rec_participant

   OUTPUT
      PAGE LENGTH 1
      TOP MARGIN 0
      LEFT MARGIN 0      
      BOTTOM MARGIN 0

   FORMAT
      ON EVERY ROW
      PRINT 
      "\"",p_rec_participant.FName CLIPPED,"\",",
      "\"",p_rec_participant.LName CLIPPED,"\",",
      "\"",p_rec_participant.dob CLIPPED,"\"",
      "\"",p_rec_participant.country CLIPPED,"\""

END REPORT 
##################################################################################
# END REPORT rep_name(p_rec_participant)
##################################################################################	

##################################################################################
# FUNCTION get_random_fname()
#
#
##################################################################################	
FUNCTION get_random_fname()
	DEFINE l_idx SMALLINT
	
	LET l_idx = util.Math.rand(6)
	
	CASE l_idx
		WHEN 0 
			RETURN "Hubert,Sepp"
		WHEN 1 
			RETURN "Alex"
		WHEN 2 
			RETURN "Angela"
		WHEN 3 
			RETURN "Laura"
		WHEN 4 
			RETURN "Vlad"
		WHEN 5 
			RETURN "Mike"
		WHEN 6 
			RETURN "Donald"
	END CASE			
END FUNCTION
##################################################################################
# END FUNCTION get_random_fname()
##################################################################################	


##################################################################################
# FUNCTION get_random_lname()
#
#
##################################################################################	
FUNCTION get_random_lname()
	DEFINE l_idx SMALLINT
	
	LET l_idx = util.Math.rand(6)
	
	CASE l_idx
		WHEN 0 
			RETURN "Hölzl"
		WHEN 1 
			RETURN "Smith"
		WHEN 2 
			RETURN "Burger"
		WHEN 3 
			RETURN "Huber"
		WHEN 4 
			RETURN "Woods"
		WHEN 5 
			RETURN "Müller"
		WHEN 6 
			RETURN "Williams"
	END CASE			
END FUNCTION
##################################################################################
# END FUNCTION get_random_lname()
##################################################################################	


##################################################################################
# FUNCTION get_random_country()
#
#
##################################################################################	
FUNCTION get_random_country()
	DEFINE l_idx SMALLINT
	
	LET l_idx = util.Math.rand(6)
	
	CASE l_idx
		WHEN 0 
			RETURN "Germany"
		WHEN 1 
			RETURN "England"
		WHEN 2 
			RETURN "Italy"
		WHEN 3 
			RETURN "USA"
		WHEN 4 
			RETURN "France"
		WHEN 5 
			RETURN "Spain"
		WHEN 6 
			RETURN "Portugal"
	END CASE			

END FUNCTION
##################################################################################
# END FUNCTION get_random_country()
##################################################################################	

##################################################################################
# FUNCTION get_random_date()
#
#
##################################################################################	
FUNCTION get_random_date()
	DEFINE l_date DATE
	
	LET l_date = TODAY
	LET l_date = l_date - (80 * 365) + util.Math.rand(60*365)

	RETURN l_date
END FUNCTION
##################################################################################
# END FUNCTION get_random_date()
##################################################################################