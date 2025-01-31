MAIN
  START REPORT report_simple_01
  CASE arg_val(1)
	WHEN "wait"
		RUN "6185_report_child_app"
		OUTPUT TO REPORT report_simple_01("This is FIRST CHILD REPORT. Nested child will be start WITH WAITING")
		
	WHEN "no_wait"
		RUN "6185_report_child_app" WITHOUT WAITING
		OUTPUT TO REPORT report_simple_01("This is FIRST CHILD REPORT. Nested child will be start WITHOUT WAITING")
		
	WHEN "just_report"
		OUTPUT TO REPORT report_simple_01("FIRST CHILD REPORT")
	OTHERWISE #when run as second child
		SLEEP 1
		OUTPUT TO REPORT report_simple_01("SECOND CHILD REPORT")
  END CASE 
  FINISH REPORT report_simple_01
END MAIN

REPORT report_simple_01(str)
DEFINE str STRING
  FORMAT 
	ON EVERY ROW print str
END REPORT
  