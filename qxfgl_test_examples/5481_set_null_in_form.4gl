MAIN

DEFINE trec RECORD f1 BIGINT,
f3 BOOLEAN,
f4 DEC,
f5 DOUBLE PRECISION,
f6 FLOAT,
f8 INTEGER,
f9 MONEY,
f10 NUMERIC,
f11 REAL,
f12 SMALLFLOAT,
f13 SMALLINT,
f14 TINYINT
END RECORD
options input wrap
OPEN WINDOW w WITH FORM '5481/5481_set_null_in_form' ATTRIBUTE(BORDER)
INPUT BY NAME trec.* WITHOUT DEFAULTS

CALL check_null("BIGINT           :",trec.f1)
CALL check_null("BOOLEAN          :",trec.f3)
CALL check_null("DEC              :",trec.f4)
CALL check_null("DOUBLE PRECISION :",trec.f5)
CALL check_null("FLOAT            :",trec.f6)
CALL check_null("INTEGER          :",trec.f8)
CALL check_null("MONEY            :",trec.f9)
CALL check_null("NUMERIC          :",trec.f10)
CALL check_null("REAL             :",trec.f11)
CALL check_null("SMALLFLOAT       :",trec.f12)
CALL check_null("SMALLINT         :",trec.f13)
CALL check_null("TINYINT          :",trec.f14)

END MAIN

FUNCTION check_null(data_type,tVariant)
DEFINE tVariant VARIANT
DEFINE data_type STRING


IF tVariant IS NULL THEN
 LET data_type=data_type," NULL"
ELSE
 LET data_type=data_type," NOT NULL"
END IF
DISPLAY data_type
END FUNCTION