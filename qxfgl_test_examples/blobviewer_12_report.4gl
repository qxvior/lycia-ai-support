MAIN
 DEFINE f_rep TEXT
	START REPORT rep_1 TO FILE "blobviewer_12_report.out" 
	OUTPUT TO REPORT rep_1(1,1)
	FINISH REPORT rep_1
	LOCATE f_rep IN FILE "blobviewer_12_report.out"
	OPEN WINDOW w WITH FORM "blobviewer_12_report" 
	DISPLAY f_rep to bl1
	CALL fgl_getkey()
END MAIN
   
REPORT rep_1(p_id_group,p_col_int)
   DEFINE
      p_id_group,
      p_col_int  INTEGER

    OUTPUT
      TOP MARGIN    0
      LEFT MARGIN   0
      BOTTOM MARGIN 0
      PAGE LENGTH   1

   FORMAT

      BEFORE GROUP OF p_id_group
         PRINT "BEFORE GROUP OF ",p_id_group CLIPPED,"       "

      ON EVERY ROW
         PRINT "     ",p_id_group," ",p_col_int USING "###&"

      AFTER  GROUP OF p_id_group
         PRINT "AFTER GROUP OF ",p_id_group CLIPPED,"       "

END REPORT
   