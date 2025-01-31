#IMPORT XML

##########################################################################
# MAIN
#
# Demo Program for XML report printing with PRINT and PrintX
# PrintX works identically to PRINT but injects a 
# The PRINTX statement is similar to PRINT, except that when XML is produced by the report, the XML print element will be 
# named as specified. If the NAME clause is omitted or the report is run in non-XML mode, then PRINTX does exactly the same as PRINT.
#
# To generate XML output, you must redirect the report output into a SAX document handler with the TO XML HANDLER clause
# START REPORT rep_printX TO XML HANDLER om.XmlWriter.createFileWriter("xml/report_to_xml_with_printX.xml")
# Note that when using XML output, BYTE values are converted to Base64 before they are printed with the PRINTX instruction.
##########################################################################
MAIN
	DEFINE l_rec_report RECORD
		print TEXT,
		printX TEXT
		END RECORD

	OPEN WINDOW rep_xml_printx WITH FORM "form/rep_xml_printx"

  START REPORT rep_printX TO XML HANDLER om.XmlWriter.createFileWriter("xml/report_to_xml_with_printX.xml")
      OUTPUT TO REPORT rep_printX("val1") 
      OUTPUT TO REPORT rep_printX("val2")
  FINISH REPORT rep_printX
  LOCATE l_rec_report.printX IN FILE "xml/report_to_xml_with_printX.xml"

  START REPORT rep_print TO XML HANDLER om.XmlWriter.createFileWriter("xml/report_to_xml_with_print.xml")
      OUTPUT TO REPORT rep_print("val1") 
      OUTPUT TO REPORT rep_print("val2")
  FINISH REPORT rep_print
  LOCATE l_rec_report.print IN FILE "xml/report_to_xml_with_print.xml"

	INPUT l_rec_report.* WITHOUT DEFAULTS FROM print, printX
	 
END MAIN
##########################################################################
# END MAIN
##########################################################################


##########################################################################
# REPORT rep_printX(v)
#
# The first of two identical reports but using PrintX statements (NOT PRINT)
##########################################################################
REPORT rep_printX(v)
  DEFINE v CHAR(5),
  			 c, cn   CHAR(5),
         s, sn   STRING,
         i, inu  INT,
         d, dn   DATE,
         dt, dtn DATETIME YEAR TO MINUTE,
         t, tn   INTERVAL HOUR TO MINUTE,
         dc, dcn DECIMAL(16,2),
         m,mn MONEY(8,2),
         f, fn FLOAT
         

  DEFINE rr RECORD f1 INT, f2 STRING END RECORD
  
  #Note: Little extreme test for page length
	#The first page contains 2 lines from FIRST PAGE HEADER + 1 line from PAGE TRAILER block ===  3 lines.
	#Next pages contain 1 line from PAGE HEADER block + 1 row from ON EVERY ROW block + 1 line from PAGE TRAILER block ===  3 lines. 
  OUTPUT 
    PAGE LENGTH 3
    TOP MARGIN 0
    BOTTOM MARGIN 0

  ORDER EXTERNAL BY v
    
  FORMAT
    FIRST PAGE HEADER
        PRINTX NAME = head "first page header"
        PRINTX NAME = page COLUMN 28, PAGENO USING "page NO <<<<"

    PAGE HEADER
        PRINTX NAME = head "page header"
        
    BEFORE GROUP OF v
        PRINTX NAME = beforegroup "before group"

    AFTER GROUP OF v
        PRINTX NAME = aftergroup "after group"
        
    ON EVERY ROW

        LET c = "ccc"
        LET s = "sss"
        LET i = 37
        LET d = "02/01/2000"
        LET dt = "2000-02-01 12:07"
        LET t = "7:40"
        LET dc = 5.7
        LET m = 36.5
        LET f = 36.6

        INITIALIZE cn, sn, inu, dn, dtn, tn, dcn, fn TO null
        
       	PRINTX NAME = rec rr.*, c, cn, s, sn, i, inu, d, dn, dt, dtn, t, tn, dc, dcn, m, mn, f, fn
        
    PAGE TRAILER
       PRINTX NAME = trail "trail"
END REPORT
##########################################################################
# END REPORT rep_printX(v)
##########################################################################


##########################################################################
# REPORT rep_print(v)
#
# The same report with PRINT statements
##########################################################################
REPORT rep_print(v)
  DEFINE v CHAR(5),
  			 c, cn   CHAR(5),
         s, sn   STRING,
         i, inu  INT,
         d, dn   DATE,
         dt, dtn DATETIME YEAR TO MINUTE,
         t, tn   INTERVAL HOUR TO MINUTE,
         dc, dcn DECIMAL(16,2),
         m,mn MONEY(8,2),
         f, fn FLOAT
         

  DEFINE rr RECORD f1 INT, f2 STRING END RECORD
  
  #Note: Little extreme test for page length
	#The first page contains 2 lines from FIRST PAGE HEADER + 1 line from PAGE TRAILER block ===  3 lines.
	#Next pages contain 1 line from PAGE HEADER block + 1 row from ON EVERY ROW block + 1 line from PAGE TRAILER block ===  3 lines. 
  OUTPUT 
    PAGE LENGTH 3
    TOP MARGIN 0
    BOTTOM MARGIN 0

  ORDER EXTERNAL BY v
    
  FORMAT
    FIRST PAGE HEADER
        PRINT "first page header"
        PRINT COLUMN 28, PAGENO USING "page NO <<<<"

    PAGE HEADER
        PRINT "page header"

    BEFORE GROUP OF v
        PRINT "before group"

    AFTER GROUP OF v
        PRINT "after group"

    ON EVERY ROW

        LET c = "ccc"
        LET s = "sss"
        LET i = 37
        LET d = "02/01/2000"
        LET dt = "2000-02-01 12:07"
        LET t = "7:40"
        LET dc = 5.7
        LET m = 36.5
        LET f = 36.6

        INITIALIZE cn, sn, inu, dn, dtn, tn, dcn, fn TO null
        
        PRINT rr.*, c, cn, s, sn, i, inu, d, dn, dt, dtn, t, tn, dc, dcn, m, mn, f, fn

    PAGE TRAILER
       PRINT  "trail"
END REPORT
##########################################################################
# END REPORT rep_print(v)
##########################################################################