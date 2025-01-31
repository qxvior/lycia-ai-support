database stores

REPORT report_simple_01()
DEFINE i INTEGER
  FORMAT
    FIRST PAGE HEADER
--* IF 1=1 THEN
--* print
--* print "001"
--* ELSE
--* print "001"
--* print "002"
--* END IF
    select tabid into i from systables where tabid=1
    PRINT i
END REPORT

REPORT report_simple_02()
DEFINE i INTEGER
  FORMAT
    FIRST PAGE HEADER
    print
    select tabid into i from systables where tabid=1
    PRINT i
END REPORT

REPORT report_simple_03()
DEFINE i INTEGER
  FORMAT
    FIRST PAGE HEADER
    select tabid into i from systables where tabid=1
    PRINT i
END REPORT

REPORT report_simple_04()
DEFINE i INTEGER
  FORMAT
    FIRST PAGE HEADER
    print "004"
    select tabid into i from systables where tabid=1
    PRINT i
END REPORT

REPORT report_simple_05()
DEFINE i INTEGER
  FORMAT
    FIRST PAGE HEADER
--* print
    select tabid into i from systables where tabid=1
    PRINT i
END REPORT

REPORT report_simple_06()
DEFINE i INTEGER
  FORMAT
    FIRST PAGE HEADER
--* print "006"
    select tabid into i from systables where tabid=1
    PRINT i
END REPORT

MAIN 
  DISPLAY "REPORT #1"
  START REPORT report_simple_01
    OUTPUT TO REPORT report_simple_01()
  FINISH REPORT report_simple_01
  DISPLAY "REPORT #2"
  START REPORT report_simple_02
    OUTPUT TO REPORT report_simple_02()
  FINISH REPORT report_simple_02
  DISPLAY "REPORT #3"
  START REPORT report_simple_03
    OUTPUT TO REPORT report_simple_03()
  FINISH REPORT report_simple_03
  DISPLAY "REPORT #4"
  START REPORT report_simple_04
    OUTPUT TO REPORT report_simple_04()
  FINISH REPORT report_simple_04
  DISPLAY "REPORT #5"
  START REPORT report_simple_05
    OUTPUT TO REPORT report_simple_05()
  FINISH REPORT report_simple_05
  DISPLAY "REPORT #6"
  START REPORT report_simple_06
    OUTPUT TO REPORT report_simple_06()
  FINISH REPORT report_simple_06
  DISPLAY "DONE"
END MAIN