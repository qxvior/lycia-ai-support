database stores
DEFINE l_bufferline STRING 
DEFINE l_rec_invoicehead RECORD 
		period_num SMALLINT, 
		total_amt DECIMAL(16,2)
	END RECORD 
	
MAIN
	CREATE TEMP TABLE t_report(
	period_num SMALLINT,
	total_amt DECIMAL(16,2)
	)
	INSERT INTO t_report VALUES("1","0.00")
	INSERT INTO t_report VALUES("1","0.00")
	INSERT INTO t_report VALUES("5","600.00")
	INSERT INTO t_report VALUES("5","600.00")
	INSERT INTO t_report VALUES("5","0.00")
	INSERT INTO t_report VALUES("6","0.00")
	INSERT INTO t_report VALUES("6","0.00")
	INSERT INTO t_report VALUES("6","0.00")
	INSERT INTO t_report VALUES("6","0.00")
	INSERT INTO t_report VALUES("6","0.00")
	
	MENU
		ON ACTION "PIPE"
			CALL rep_to_pipe()
		ON ACTION "FILE_TO_PIPE"
			CALL file_to_pipe()
		ON ACTION "SCREEN"
			CALL rep_to_screen()
		ON ACTION "EXIT"
			EXIT MENU
	END MENU
END MAIN
###################################################################################
FUNCTION rep_to_pipe()
    CALL fgl_report_type("screen","text")
	START REPORT AB3_rpt_list TO pipe "screen"
	WITH PAGE LENGTH = 66, 
	TOP MARGIN = 0, 
	BOTTOM MARGIN = 0, 
	LEFT MARGIN = 0

	PREPARE choice FROM "SELECT * FROM t_report "
	DECLARE selcurs1 CURSOR FOR choice 
	FOREACH selcurs1 INTO l_rec_invoicehead.*
		OUTPUT TO REPORT AB3_rpt_list(l_rec_invoicehead.*)  
	END FOREACH 
	FINISH REPORT AB3_rpt_list
END FUNCTION
###################################################################################
FUNCTION file_to_pipe()
	START REPORT AB3_rpt_list TO "rep_5315"
	WITH PAGE LENGTH = 66, 
	TOP MARGIN = 0, 
	BOTTOM MARGIN = 0, 
	LEFT MARGIN = 0

	PREPARE choice FROM "SELECT * FROM t_report "
	DECLARE selcurs2 CURSOR FOR choice 
	FOREACH selcurs2 INTO l_rec_invoicehead.*
		OUTPUT TO REPORT AB3_rpt_list(l_rec_invoicehead.*)  
	END FOREACH 
	FINISH REPORT AB3_rpt_list

#read report from file (kandoo case)
    CALL fgl_report_type("screen","text")
	START REPORT rep_display_report TO pipe "screen"
	CALL fgl_channel_open_file("stream", "rep_5315", "r")
	WHILE fgl_channel_read("stream",l_bufferLine) 
		OUTPUT TO REPORT rep_display_report(l_bufferline) 
	END WHILE 
	FINISH REPORT rep_display_report 
END FUNCTION
###################################################################################
FUNCTION rep_to_screen()
    CALL fgl_report_type("screen","text")
	START REPORT AB3_rpt_list TO SCREEN
	WITH PAGE LENGTH = 66, 
	TOP MARGIN = 0, 
	BOTTOM MARGIN = 0, 
	LEFT MARGIN = 0

	PREPARE choice FROM "SELECT * FROM t_report "
	DECLARE selcurs3 CURSOR FOR choice 
	FOREACH selcurs3 INTO l_rec_invoicehead.*
		OUTPUT TO REPORT AB3_rpt_list(l_rec_invoicehead.*)  
	END FOREACH 
	FINISH REPORT AB3_rpt_list
END FUNCTION




###################################################################################
REPORT rep_display_report(p_rep_line) 
	DEFINE p_rep_line STRING 

	FORMAT 
		ON EVERY ROW PRINT p_rep_line clipped 

END REPORT

REPORT AB3_rpt_list(p_rec_invoicehead) 
	DEFINE p_rec_invoicehead RECORD 
		period_num SMALLINT, 
		total_amt DECIMAL(16,2) 
	END RECORD 
	
	OUTPUT 
	ORDER BY p_rec_invoicehead.period_num
	FORMAT 
		PAGE HEADER 
			PRINT COLUMN 01, "page:",pageno 
		ON EVERY ROW 
			PRINT COLUMN 75, p_rec_invoicehead.period_num USING "##", 
			COLUMN 80, p_rec_invoicehead.total_amt USING "---,---,---.&&"

		ON LAST ROW 
			PRINT COLUMN 1, "ON LAST ROW" 
		BEFORE GROUP OF p_rec_invoicehead.period_num 
			SKIP TO top OF PAGE  
			PRINT COLUMN 05, "BEFORE GROUP" 

      PAGE TRAILER
         PRINT "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
END REPORT