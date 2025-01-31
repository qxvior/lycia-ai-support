# Project: lyc1000
# Filename: 6637_wrong_blobsize.4gl
# Created By: alch
# Creation Date: Jul 1, 2021

DATABASE axa_querix_amarta
MAIN
DEFINE lc_file CHAR(200)
DEFINE lc_cmd CHAR(1000)
DEFINE lo_compressed LIKE print_blob.pblob_text

	LET lc_file = "/tmp/tmp_file0"
	LOCATE lo_compressed IN FILE lc_file
	DISPLAY "blob size = ", lo_compressed.GetLength()
	DISPLAY "File size (",lc_file,") = ",os.Path.size(trim(lc_file))

	CALL print_blob_sql(lo_compressed)
	DISPLAY "blob size = ", lo_compressed.GetLength()
	DISPLAY "File size (",lc_file,") = ",os.Path.size(trim(lc_file))

	LET lc_cmd = "mv ", lc_file CLIPPED, " ", lc_file CLIPPED, ".gz; gunzip -f ", lc_file CLIPPED, ".gz"
	RUN lc_cmd
	DISPLAY "blob size = ", lo_compressed.GetLength()
	DISPLAY "File size (",lc_file,") = ",os.Path.size(trim(lc_file))

	CALL os.Path.delete(trim(lc_file))
END MAIN

FUNCTION print_blob_sql(lo_print)    
DEFINE lo_print LIKE print_blob.pblob_text

	SELECT pblob_text INTO lo_print FROM print_blob WHERE prtblbid_ref = "5835720"

END FUNCTION