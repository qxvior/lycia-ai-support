#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores_demo

MAIN
   DEFINE
      v_date    DATE

   WHENEVER ERROR CONTINUE
	DROP TABLE lyc_8316_table_for_update
	DROP VIEW lyc_8316_view_for_update
	DROP SYNONYM lyc_8316_syn_for_update
   
   CREATE TABLE lyc_8316_table_for_update
   (
    id          INTEGER,
    col_date    DATE
   )
   CREATE VIEW lyc_8316_view_for_update AS SELECT * FROM lyc_8316_table_for_update
   CREATE SYNONYM lyc_8316_syn_for_update FOR lyc_8316_table_for_update   

	LET v_date = "01/01/2011"
   INSERT INTO lyc_8316_table_for_update VALUES(1,v_date)
   INSERT INTO lyc_8316_table_for_update VALUES(2,v_date)
   INSERT INTO lyc_8316_table_for_update VALUES(3,v_date)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   UPDATE lyc_8316_table_for_update SET col_date = col_date + 1 UNITS DAY WHERE id = 1
   IF SQLCA.SQLCODE = 0 THEN
   SELECT col_date INTO v_date FROM lyc_8316_table_for_update WHERE id = 1
   IF v_date IS NULL THEN LET v_date = "12/31/1899" END IF
   DISPLAY v_date
   ELSE DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE 
   END IF

   UPDATE lyc_8316_view_for_update SET (col_date)=(col_date + 1 UNITS MONTH) WHERE id = 2
   IF SQLCA.SQLCODE = 0 THEN
   SELECT col_date INTO v_date FROM lyc_8316_view_for_update WHERE id = 2
   IF v_date IS NULL THEN LET v_date = "12/31/1899" END IF
   DISPLAY v_date
   ELSE DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE 
   END IF

   UPDATE lyc_8316_syn_for_update SET * = (id,col_date + 1 UNITS YEAR) WHERE id = 3
   IF SQLCA.SQLCODE = 0 THEN
   SELECT col_date INTO v_date FROM lyc_8316_syn_for_update WHERE id = 3
   IF v_date IS NULL THEN LET v_date = "12/31/1899" END IF
   DISPLAY v_date
   ELSE DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE 
   END IF

   DROP TABLE lyc_8316_table_for_update
  
END MAIN
   