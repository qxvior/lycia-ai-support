DATABASE stores
MAIN

START REPORT A
START REPORT B

OUTPUT TO REPORT A("GR1","85.05")
OUTPUT TO REPORT B("GR1","85.05")
OUTPUT TO REPORT B("GR1","85.05")

FINISH REPORT A
FINISH REPORT B
CALL fgl_getkey()
END MAIN

REPORT A (CONC,xIMP)
DEFINE CONC   CHAR(3)
DEFINE xIMP    money(10,2)

OUTPUT
   PAGE   LENGTH 20
ORDER BY CONC
FORMAT
  ON EVERY ROW
     PRINT "REPORT A      ", xIMP 
    
  AFTER GROUP of CONC
     PRINT "========AFTER GROUP==========="
     PRINT "group sum =  ", group sum(xIMP) 
     PRINT "group count =", group count(*) 
  ON LAST ROW
     PRINT "==========LAST ROW==================="
     PRINT "SUM =", sum(ximp) 
     PRINT "COUNT  =", count(*) 
END REPORT

REPORT B (CONC,xIMP)
DEFINE CONC   CHAR(3)
DEFINE xIMP    money(10,2)

OUTPUT
   PAGE   LENGTH 20
ORDER BY CONC
FORMAT
  ON EVERY ROW
     PRINT "REPORT B      ", xIMP 
    
  AFTER GROUP of CONC
     PRINT "========AFTER GROUP==========="
     PRINT "group sum =  ", group sum(xIMP) 
     PRINT "group count =", group count(*) 
  ON LAST ROW
     PRINT "==========LAST ROW==================="
     PRINT "SUM =", sum(ximp) 
     PRINT "COUNT  =", count(*) 
END REPORT