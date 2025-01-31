##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
DATABASE stores
MAIN
   DEFINE
      field1,
      field2,
      field3, 
      field4 CHAR(10)

   OPEN WINDOW w1 AT 1,1 WITH FORM "2963/2963_table_aliases_error_1"
   LET field1 = "field1"
   LET field2 = "field2"
   LET field3 = "field3"
   LET field4 = "field4"

   INPUT  
         field1,
         field2,
         field3,
         field4
         WITHOUT DEFAULTS FROM
         alias_1.col_int,
         alias_2.col_char,
         lyc_2963.col_int,
         alias_4.col_char

   CLOSE WINDOW w1

   DISPLAY "field1 = ",field1
   DISPLAY "field2 = ",field2
   DISPLAY "field3 = ",field3
   DISPLAY "field4 = ",field4
   DISPLAY ""

END MAIN
