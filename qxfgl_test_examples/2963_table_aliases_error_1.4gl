##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_2963
   DROP TABLE lyc_2963_1
   DROP VIEW view_lyc_2963_1
   DROP SYNONYM syn_lyc_2963_1

   CREATE TABLE lyc_2963
   (col_int  INTEGER,
    col_char CHAR(80)
   )
   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   CREATE TABLE lyc_2963_1
   (col_dec  DECIMAL(16,2),
    col_date DATE
   )
   DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   CREATE VIEW view_lyc_2963_1 AS SELECT * FROM lyc_2963_1
   DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   CREATE SYNONYM syn_lyc_2963_1 FOR lyc_2963_1
   DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

DATABASE stores_demo

   DROP TABLE lyc_2963
   DROP TABLE lyc_2963_2
   DROP VIEW view_lyc_2963_2
   DROP SYNONYM syn_lyc_2963_2

   CREATE TABLE lyc_2963
   (col_int  INTEGER,
    col_char CHAR(80)   
   )
   DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   CREATE TABLE lyc_2963_2
   (col_sml     SMALLINT,
    col_varchar VARCHAR(80)
   )
   DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   CREATE VIEW view_lyc_2963_2 AS SELECT * FROM lyc_2963_2
   DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   CREATE SYNONYM syn_lyc_2963_2 FOR lyc_2963_2
   DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
