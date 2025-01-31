MAIN
 DEFINE l_rec_data RECORD
					fName STRING,
					transaction DYNAMIC ARRAY OF MONEY
		END RECORD
 DEFINE l_ref_rec REFERENCE

LET l_rec_data.fName = "Name"
LET l_rec_data.transaction[1]=123
LET l_ref_rec = l_rec_data
DISPLAY l_ref_rec
END MAIN