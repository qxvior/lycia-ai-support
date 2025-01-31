DATABASE stores
MAIN
DEFINE rec_from_scheme RECORD LIKE data_type.*
DEFINE get_datatype VARIANT


LET get_datatype = rec_from_scheme.col_int    DISPLAY "1.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_sint   DISPLAY "2.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_dec    DISPLAY "3.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_mon    DISPLAY "4.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_flt    DISPLAY "5.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_sflt   DISPLAY "6.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_date   DISPLAY "7.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_datime DISPLAY "8.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_inter1 DISPLAY "9.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_inter2 DISPLAY "10.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_char   DISPLAY "11.",get_datatype.gettypefullname()
LET get_datatype = rec_from_scheme.col_vchar  DISPLAY "12.",get_datatype.gettypefullname()

LET rec_from_scheme.col_from_scheme = "test value"
DISPLAY rec_from_scheme.col_from_scheme
LET get_datatype = rec_from_scheme.col_from_scheme DISPLAY get_datatype.gettypefullname()

CALL fgl_getkey()
END MAIN