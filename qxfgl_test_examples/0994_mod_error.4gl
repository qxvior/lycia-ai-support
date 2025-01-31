#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_demo

MAIN
   DEFINE
      r_group_report RECORD
                         id_group       INTEGER,
                         name_group     CHAR(80)
                      END RECORD,
      r_detail_report RECORD
                         id_group       INTEGER,
                         name_int_group CHAR(80),
                         col_integer    INTEGER,
                         col_decimal    DECIMAL(10,2),
                         col_char       CHAR(256),
                         col_date       DATE
                      END RECORD

   WHENEVER ERROR CONTINUE

   DECLARE cur_1 CURSOR FOR
      SELECT g_r.*,d_r.* FROM group_report g_r,detail_report d_r
      WHERE g_r.id_group = d_r.id_group AND
            g_r.id_group IN(2)
      ORDER BY g_r.id_group,d_r.name_int_group,d_r.col_integer,d_r.col_decimal

   START REPORT rep_1 TO SCREEN 
   FOREACH cur_1 INTO r_group_report.*,r_detail_report.*
      OUTPUT TO REPORT rep_1(r_group_report.id_group,r_detail_report.name_int_group,r_detail_report.col_integer,r_detail_report.col_decimal)
   END FOREACH 
   FINISH REPORT rep_1

END MAIN

REPORT rep_1(p_id_group,p_name_int_group,p_col_integer,p_col_decimal)
   DEFINE
      p_id_group       INTEGER,
      p_name_int_group CHAR(80),
      p_col_integer    INTEGER,
      p_col_decimal    DECIMAL(10,2)

   OUTPUT
      TOP MARGIN    0
      LEFT MARGIN   0
      BOTTOM MARGIN 0
      PAGE LENGTH   1
   
   ORDER EXTERNAL BY p_id_group,p_name_int_group,p_col_integer,p_col_decimal

   FORMAT

      BEFORE GROUP OF p_col_integer
         PRINT "BEFORE GROUP OF                       ",p_col_integer  USING "###&"," ",
{
                    " SUM()=",SUM(p_col_integer) WHERE p_col_decimal = 5.05 OR p_col_decimal = 6.06 USING "###&.&&",  --> it's work 
                    " MIN()=",MIN(p_col_integer) WHERE p_col_decimal = 5.05 OR p_col_decimal = 6.06 USING "###&.&&",  --> it's work 
                    " MAX()=",MAX(p_col_integer) WHERE p_col_decimal = 5.05 OR p_col_decimal = 6.06 USING "###&.&&",  --> it's work 
                    " AVG()=",AVG(p_col_integer) WHERE p_col_decimal = 5.05 OR p_col_decimal = 6.06 USING "###&.&&",  --> it's work 
                    " PERCENT()=",PERCENT(*)     WHERE p_col_decimal = 5.05 OR p_col_decimal = 6.06 USING "###&.&&"   --> it's work 
}
                    " SUM()=",SUM(p_col_integer) WHERE (p_col_decimal MOD 2) = 0 USING "###&.&&",
                    " MIN()=",MIN(p_col_integer) WHERE (p_col_decimal MOD 2) = 0 USING "###&.&&",
                    " MAX()=",MAX(p_col_integer) WHERE (p_col_decimal MOD 2) = 0 USING "###&.&&",
                    " AVG()=",AVG(p_col_integer) WHERE (p_col_decimal MOD 2) = 0 USING "###&.&&",
                    " PERCENT()=",PERCENT(*)     WHERE (p_col_decimal MOD 2) = 0 USING "###&.&&"

END REPORT
