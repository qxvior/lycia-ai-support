TYPE t_cust RECORD
         cust_id INTEGER,
         cust_name VARCHAR(30)
     END RECORD

TYPE t_ord RECORD
         ord_id INTEGER,
         ord_cust INTEGER,
         ord_date DATE
     END RECORD

MAIN
  CALL create_database()
  CALL run_cust_report()
END MAIN

FUNCTION create_database()
  DEFINE d DATE
  CONNECT TO ":memory:+driver='dbmsqt'"
  CREATE TABLE cust (
            cust_id INTEGER PRIMARY KEY,
            cust_name VARCHAR(30)
         )
  INSERT INTO cust VALUES ( 101, "Mike Potter" )
  INSERT INTO cust VALUES ( 102, "John Callaghan" )
  CREATE TABLE ord (
            ord_id INTEGER PRIMARY KEY,
            ord_cust INTEGER REFERENCES cust(cust_id),
            ord_date DATE
         )
  LET d = TODAY - 10
  INSERT INTO ord VALUES ( 1001, 101, d )
  LET d = TODAY - 1
  INSERT INTO ord VALUES ( 1002, 101, d )
  LET d = TODAY
  INSERT INTO ord VALUES ( 1003, 102, d )
END FUNCTION

FUNCTION run_cust_report()
  DEFINE r_cust t_cust
  START REPORT cust_report
       TO XML HANDLER om.XmlWriter.createFileWriter("output.xml")
  DECLARE c_cust CURSOR FOR SELECT * FROM cust ORDER BY cust_id
  FOREACH c_cust INTO r_cust.*
      OUTPUT TO REPORT cust_report(r_cust)
  END FOREACH
  FINISH REPORT cust_report
END FUNCTION

REPORT cust_report(r_cust t_cust)
  DEFINE r_ord t_ord
  OUTPUT
    TOP MARGIN 0 BOTTOM MARGIN 0
    LEFT MARGIN 0 RIGHT MARGIN 0
    PAGE LENGTH 1
  FORMAT
    ON EVERY ROW
      PRINT NAME = customer r_cust.*
      START REPORT ord_report
      DECLARE c_ord CURSOR FOR
        SELECT * FROM ord WHERE ord_cust = r_cust.cust_id ORDER BY ord_date
      FOREACH c_ord INTO r_ord.*
          OUTPUT TO REPORT ord_report(r_ord)
      END FOREACH
      FINISH REPORT ord_report
END REPORT

REPORT ord_report(r_ord t_ord)
  OUTPUT
    TOP MARGIN 0 BOTTOM MARGIN 0
    LEFT MARGIN 0 RIGHT MARGIN 0
    PAGE LENGTH 1
  FORMAT
    ON EVERY ROW
      PRINTX NAME = order r_ord.*
END REPORT