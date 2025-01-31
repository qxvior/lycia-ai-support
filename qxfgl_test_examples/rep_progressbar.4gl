##############################################################################################
# Module Variables
##############################################################################################
DEFINE 
  t_test_rec TYPE AS 
    RECORD
      f1 CHAR,  --Character strings, of size up to 32,767 bytes in length - default is 1 if not specified
      f2 CHAR(10),
      f3 CHARACTER(100), -- This keyword is a synonym for CHAR
      f4 VARCHAR,  --Character strings of varying length, for size =< 255 bytes - default = 1
      f5 VARCHAR(10,5),  --Character strings of varying length, for size =< 255 bytes
      f6 VARCHAR(255),  --Character strings of varying length, for size =< 255 bytes min 5 max 10
      f7 NCHAR, -- default size 1 - Character strings, of size up to 32,767 bytes in length
      f8 NCHAR(10),  -- Character strings, of size up to 32,767 bytes in length
      f9 NVARCHAR,	-- default size - Character strings of varying leng
      f10 NVARCHAR(250), -- Character strings of varying length, for size
      f11 TEXT,  --  Character strings of up to 2'31' bytes
      f11b TEXT,  --  Character strings of up to 2'31' bytes
      f12 SMALLINT, --  Whole numbers, from -32,767 to +32,767
      f13 INTEGER,  --  Whole numbers, from -2,147,483,647 to +2,147,483,647
      f14 INT, -- This keyword is a synonym for INTEGER
      f15 SMALLFLOAT,  -- Floating-point numbers, of up to 16-digit precision
      f16 REAL,  -- This keyword is a synonym for SMALLFLOAT - 
      f17 FLOAT,  -- Floating-point numbers, of up to 32-digit precision
      f18 DOUBLE PRECISION,  --synonym for Float
      f19 DECIMAL(30,15),  --Floating-point numbers, of a specified precision
      f20 DEC(8,2),  -- Fixed-point numbers, of a specified scale and precision, This keyword is a synonym for DECIMAL
      f21 NUMERIC(6),  --This keyword is a synonym for DECIMAL  (totoal length - precission defaults to 2)
      f22 NUMERIC,  -- Default precision is 16 (if not specified)
      f23 MONEY(8,2),  --  Currency amounts, with definable scale and precision
      f24 DATE,  --Points in time, specified as calendar dates
      f25 DATETIME YEAR TO DAY,  --Points in time, specified as calendar dates and time-of-day
      f26 INTERVAL YEAR TO MONTH,  --Spans of time in years and months, or in smaller time units

#      f27 BYTE,  --Any kind of binary data, of length up to 231 bytes
#      f27a BYTE,  --Any kind of binary data, of length up to 231 bytes
#      f27b BYTE,  --Any kind of binary data, of length up to 231 bytes
#
#      f28 BYTE,  --Any kind of binary data, of length up to 231 bytes
#      f28a BYTE,  --Any kind of binary data, of length up to 231 bytes
#      f28b BYTE,  --Any kind of binary data, of length up to 231 bytes

      info CHAR(4096)  --Character strings, of size up to 32,767 bytes in length - default is 1 if not specified
    END RECORD


#DEFINE l_report_loops INT

##########################################################################
# MAIN
#
# Example/Demo on how to show a progress bar in reporting
##########################################################################
MAIN
	DEFINE l_report_loops INT
	DEFINE l_report_file_name STRING
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW wReport WITH FORM "form/rep_progressbar"
	
	LET l_report_loops = 1000
	LET l_report_file_name = "classic_4gl_report.txt"
	
	INPUT l_report_loops, l_report_file_name WITHOUT DEFAULTS FROM report_loops,reportFileName ATTRIBUTE(UNBUFFERED)
		BEFORE INPUT
			CALL dialog.setActionHidden("ACCEPT",TRUE) --hide the OK/accept button
			CALL dialog.setActionHidden("ACCEPT",TRUE) --hide the OK/accept button
						
			ON ACTION ("Report")
				CALL writeLyciaReportFile(l_report_loops, l_report_file_name)
				
			ON ACTION "CANCEL"
				EXIT INPUT

	END INPUT
	CLOSE WINDOW wReport

END MAIN
##########################################################################
# END MAIN
##########################################################################


##############################################################
# FUNCTION writeLyciaReportFile()
#
#
##############################################################
FUNCTION writeLyciaReportFile(p_report_loops,p_report_file_name)
	DEFINE p_report_loops INT
	DEFINE p_report_file_name VARCHAR(200)
	
  #DEFINE SystemInfo TEXT
	DEFINE cmdRunString STRING
	DEFINE temp_string STRING
  DEFINE test_rec OF t_test_rec 
	DEFINE reportFile TEXT
	DEFINE i INT
	DEFINE progressBarStepValue SMALLINT
	DEFINE modResult SMALLINT
	DEFINE progressBarValue SMALLINT
	DEFINE l_report_file TEXT

	IF p_report_file_name IS NULL THEN
		LET p_report_file_name = "classic_4gl_report.txt"
		DISPLAY p_report_file_name TO reportFileName		
	END IF

	LET progressBarStepValue = p_report_loops / 100  

		CALL fgl_report_type(p_report_file_name,"text_viewer")  # or q4gl_add_user_report_type("note","text")

		START REPORT lycia_system_report TO p_report_file_name  #PIPE "more > report.out"
			FOR i = 1 TO p_report_loops
			
			CALL init_test_rec() RETURNING test_rec.*

				LET modResult = i MOD progressBarStepValue 
				
				IF modResult = 0 THEN
					LET progressBarValue = progressBarValue +1
					
					DISPLAY progressBarValue TO pbReportProgress
#					DISPLAY BY NAME progressBarValue
#					DISPLAY BY NAME loopCount
					CALL ui.interface.refresh()
					
				END IF
									
				
				OUTPUT TO REPORT lycia_system_report(i,test_rec.*)
			END FOR
			
		FINISH REPORT lycia_system_report		
		LOCATE l_report_file in file p_report_file_name
		CALL ui.Interface.writeToPipe("my_pipe",l_report_file)
						    
#	LOCATE reportFile IN FILE p_report_file_name
#	DISPLAY reportFile TO SystemInfo

	#Download the report file
#	IF fgl_download(p_report_file_name, p_report_file_name) = FALSE THEN
#		LET temp_string = "Could not download ", fgl_getenv("HOMEPATH") CLIPPED, p_report_file_name CLIPPED
#		CALL fgl_winmessage("Error when downloading the report file",temp_string,"error")
#	ELSE
#		LET temp_string = "Downloaded the report file ", fgl_getenv("HOMEPATH") CLIPPED, p_report_file_name CLIPPED
#		CALL fgl_winmessage("Report File Download",temp_string,"info")
#	END IF	


END FUNCTION
##############################################################
# END FUNCTION writeLyciaReportFile()
##############################################################

      
##############################################################
# REPORT lycia_system_report()
#
#  
##############################################################
REPORT lycia_system_report(p_count,p_test_rec)
	DEFINE p_count INT 
  DEFINE p_test_rec OF t_test_rec 

  OUTPUT
    BOTTOM MARGIN 1
    TOP MARGIN 1
    PAGE LENGTH 64
    RIGHT MARGIN 132

  FORMAT
    #  ON EVERY ROW 
   #      PRINT dummy         



    FIRST PAGE HEADER
      SKIP 1 LINES
      PRINT COLUMN 1, "Lycia System Environment Report"
      SKIP 1 LINES
      PRINT COLUMN 1, "Executing date: ", TODAY USING "dd mmm. yyyy" -- "Executing date: "
      PRINT COLUMN 1, "Executing time: ", TIME -- "Executing date: "
     ON EVERY ROW 

			SKIP 3 LINES    
			PRINT "##################################################################################"        
			PRINT "#                                                                                #"			
      PRINT COLUMN 1, "#",
            COLUMN 3, "Customer/User Details",
            COLUMN 20, p_count,
            COLUMN 82,"#"      
			PRINT "#                                                                                #"			
      PRINT "##################################################################################"        
      SKIP 3 LINES

      PRINT COLUMN 1,  "p_test_rec.f1:",
            COLUMN 25, p_test_rec.f1
      PRINT COLUMN 1,  "p_test_rec.f2:",
            COLUMN 25, p_test_rec.f2
      PRINT COLUMN 1,  "p_test_rec.f3",
            COLUMN 25, p_test_rec.f3
      PRINT COLUMN 1,  "p_test_rec.f4:",
            COLUMN 25, p_test_rec.f4
      PRINT COLUMN 1,  "p_test_rec.f5:",
            COLUMN 25, p_test_rec.f5
      PRINT COLUMN 1,  "p_test_rec.f6:",
            COLUMN 25, p_test_rec.f6
      PRINT COLUMN 1,  "p_test_rec.f7:",
            COLUMN 25, p_test_rec.f7
      PRINT COLUMN 1,  "p_test_rec.f8:",
            COLUMN 25, p_test_rec.f8
      PRINT COLUMN 1,  "p_test_rec.f9:",
            COLUMN 25, p_test_rec.f9
      PRINT COLUMN 1,  "p_test_rec.f10:",
            COLUMN 25, p_test_rec.f10
      PRINT COLUMN 1,  "p_test_rec.f11:",
            COLUMN 25, p_test_rec.f11
      PRINT COLUMN 1,  "p_test_rec.f12:",
            COLUMN 25, p_test_rec.f12
      PRINT COLUMN 1,  "p_test_rec.f13:",
            COLUMN 25, p_test_rec.f13
      PRINT COLUMN 1,  "p_test_rec.f14:",
            COLUMN 25, p_test_rec.f14
      PRINT COLUMN 1,  "p_test_rec.f15:",
            COLUMN 25, p_test_rec.f15
      PRINT COLUMN 1,  "p_test_rec.f16:",
            COLUMN 25, p_test_rec.f16
      PRINT COLUMN 1,  "p_test_rec.f17:",
            COLUMN 25, p_test_rec.f17
      PRINT COLUMN 1,  "p_test_rec.f18:",
            COLUMN 25, p_test_rec.f18
      PRINT COLUMN 1,  "p_test_rec.f19:",
            COLUMN 25, p_test_rec.f19
      PRINT COLUMN 1,  "p_test_rec.f20:",
            COLUMN 25, p_test_rec.f20
      PRINT COLUMN 1,  "p_test_rec.f21:",
            COLUMN 25, p_test_rec.f21
      PRINT COLUMN 1,  "p_test_rec.f22:",
            COLUMN 25, p_test_rec.f22
      PRINT COLUMN 1,  "p_test_rec.f23:",
            COLUMN 25, p_test_rec.f23
      PRINT COLUMN 1,  "p_test_rec.f24:",
            COLUMN 25, p_test_rec.f24
      PRINT COLUMN 1,  "p_test_rec.f25:",
            COLUMN 25, p_test_rec.f25
      PRINT COLUMN 1,  "p_test_rec.f26:",
            COLUMN 25, p_test_rec.f26
      PRINT COLUMN 1,  "p_test_rec.info:",
            COLUMN 25, p_test_rec.info            


			SKIP 3 LINES    
			PRINT "##################################################################################"        
			PRINT "#                                                                                #"			
      PRINT "# End of test record data                                                        #"
			PRINT "#                                                                                #"			
      PRINT "##################################################################################"        
      SKIP 3 LINES

	WHENEVER ERROR CONTINUE  #in case, we have some file access problem

			SKIP 3 LINES    
			PRINT "##################################################################################"        
			PRINT "#                                                                                #"			
      PRINT "# Let's include an external texts file                                           #"
			PRINT "#                                                                                #"			
      PRINT "##################################################################################"        
      SKIP 3 LINES

			PRINT FILE "txt/rep_include_example.txt"
			
			SKIP 3 LINES            
			PRINT "##################################################################################"        
			PRINT "#                                                                                #"			
      PRINT "# End of this record (classic 4gl Report  OUTPUT)                                #"
			PRINT "#                                                                                #"			
			PRINT "##################################################################################"        


    #PAGE TRAILER
    #  SKIP 3 LINES
    #  PRINT COLUMN 45, "Page ## / ##", PAGENO USING "## /", (COUNT(*) + 1 + (5 - ((COUNT(*) + 1) mod 5))) / 5 USING "##" -- "Page ## / ##"

	WHENEVER ERROR STOP

END REPORT
##################################################################################
# END REPORT lycia_system_report()
##################################################################################


##################################################################################
# FUNCTION init_test_rec()  
#
#
##################################################################################
FUNCTION init_test_rec()
  DEFINE test_rec OF t_test_rec 
  
  #LOCATE test_rec.f11 in memory
    
	#LOCATE test_rec.f11 IN FILE "txt/letter.txt"
	#LOCATE test_rec.f11b IN FILE "txt/letter.txt"
	
#	LOCATE test_rec.f27 IN FILE "image/gd_passport_pic.jpg"
#	LOCATE test_rec.f27a IN FILE "image/gd_passport_pic.jpg"
#	LOCATE test_rec.f27b IN FILE "image/gd_passport_pic.jpg"
#
#	LOCATE test_rec.f28 IN FILE "document/coversheet.pdf"
#	LOCATE test_rec.f28a IN FILE "document/coversheet.pdf"
#	LOCATE test_rec.f28b IN FILE "document/coversheet.pdf"

  LET test_rec.f1 =  "A" -- CHAR default = 1
  LET test_rec.f2 =  "10ABCDEFG1"  -- CHAR(10)
  LET test_rec.f3 =  "100_ABC_1_ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJ" --CHAR(100)
  LET test_rec.f4 =  "A" -- VARCHAR - default size = 1
  LET test_rec.f5 =  "VARCHAR_2A"  -- VARCHAR(10,5)
  LET test_rec.f6 =  "VARCHAR_1A123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" --VARCHAR(255)
  LET test_rec.f7 =  "A"  -- NCHAR - default size = 1
  LET test_rec.f8 =  "NChar(10)A"  --NCHAR(10)
  LET test_rec.f9 =  "A"
  LET test_rec.f10 = "NVARCHAR2A123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
  #LET test_rec.f11 = "A-Is this an extra long text block \n With some stuff\nin what format do I have to assign TEXT to a TEXT variable"  --TEXT
  LET test_rec.f12 = 32767  -- -32,767  SMALLINT
  LET test_rec.f13 = 214748364  --INTEGER/INT
  LET test_rec.f14 = -214748364  --INTEGER/INT
  LET test_rec.f15 = 1234567.00  --SMALLFLOAT/REAL
  LET test_rec.f16 = -1234567.00  --SMALLFLOAT/REAL
  LET test_rec.f17 = 1234567890.12  -- FLOAT/DOUBLE PRECISION
  LET test_rec.f18 = -1234567890.12  -- FLOAT/DOUBLE PRECISION
  LET test_rec.f19 = 1234567890.123  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f20 = -123456.12  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f21 = 1234.12  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f22 = -12345678.12  -- DECIMAL/DEC/NUMERIC
  LET test_rec.f23 = 123456.12  -- money
  LET test_rec.f24 = "10/10/10"  -- DATE
  LET test_rec.f25 = "2010-10-10"  -- DATETIME YEAR TO DAY
  LET test_rec.f26 = "04-02"  -- INTERVAL YEAR TO MONTH
  --	LET test_rec.f27 = "BYTE_1____123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"

  LET test_rec.info =                        "VARCHAR_1A12345678901234567890123456789012345678901234567890123456789012345678901234567890\n1234567890123456789012345678901234567890123456789012345678901234567890123456789\n012345678901234567890123456789012345678901234567890123456789012345678901234567890\n\n" --VARCHAR(255)
  LET test_rec.info = test_rec.info CLIPPED, test_rec.info CLIPPED  # "VARCHAR_1A12345678901234567890123456789012345678901234567890123456789012345678901234567890\n1234567890123456789012345678901234567890123456789012345678901234567890123456789\n012345678901234567890123456789012345678901234567890123456789012345678901234567890\n\n" --VARCHAR(255)
#  LET test_rec.info = test_rec.info CLIPPED, "VARCHAR_1A12345678901234567890123456789012345678901234567890123456789012345678901234567890\n1234567890123456789012345678901234567890123456789012345678901234567890123456789\n012345678901234567890123456789012345678901234567890123456789012345678901234567890\n\n" --VARCHAR(255)
  LET test_rec.info = test_rec.info CLIPPED, test_rec.info CLIPPED  
  LET test_rec.info = test_rec.info CLIPPED, test_rec.info CLIPPED    
  
  RETURN test_rec.*
END FUNCTION
##################################################################################
# END FUNCTION init_test_rec()
##################################################################################