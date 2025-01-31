# Project: lyc1000
# Filename: 7310_mssql_connection_string.4gl
# Created By: alch
# Creation Date: Feb 8, 2022

MAIN
	DEFINE l_rec_customer RECORD
			l_fname VARCHAR(16),
			l_lname VARCHAR(16),
			l_company VARCHAR(32)
		END RECORD

CONNECT TO "DRIVER={SQL Server};SERVER=mssql-test.qx;UID=informix;PWD=Default2375;DATABASE=stores;"

SELECT fname, lname, company INTO l_rec_customer.* FROM customer WHERE customer_num = 101
DISPLAY l_rec_customer

END MAIN