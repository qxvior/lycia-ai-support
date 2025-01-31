DATABASE stores
MAIN
   DEFINE ins_smallfloat SMALLFLOAT 
   WHENEVER ANY ERROR CONTINUE
   CREATE TABLE smallfloat_5571(
     col_smallfloat SMALLFLOAT
   )

   DELETE FROM smallfloat_5571
   DISPLAY SQLCA.SQLCODE

   LET ins_smallfloat = 5
   DISPLAY ins_smallfloat, "|", ins_smallfloat IS NULL
   INSERT INTO smallfloat_5571(col_smallfloat) VALUES(ins_smallfloat)
   DISPLAY SQLCA.SQLCODE

   LET ins_smallfloat = NULL
   DISPLAY ins_smallfloat, "|", ins_smallfloat IS NULL
   INSERT INTO smallfloat_5571(col_smallfloat) VALUES(ins_smallfloat)
   DISPLAY SQLCA.SQLCODE

   LET ins_smallfloat = 13
   DISPLAY ins_smallfloat, "|", ins_smallfloat IS NULL
   INSERT INTO smallfloat_5571(col_smallfloat) VALUES(ins_smallfloat)
   DISPLAY SQLCA.SQLCODE
   CALL fgl_getkey()
END MAIN