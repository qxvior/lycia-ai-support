DATABASE stores

MAIN
 DEFINE selectByte, insertByte BYTE
 DEFINE showRes1, showRes2 TEXT

	LOCATE selectByte IN FILE "./8533/8533_hcl_selected_byte"
	LOCATE insertByte IN FILE "./8533/8533_source_byte.txt"

	LOCATE showRes1	IN FILE "./8533/8533_hcl_selected_byte"
	LOCATE showRes2 IN FILE "./8533/8533_hcl_text_unload"
	
	CREATE TEMP TABLE tmp_blob_byte (f1 BYTE)
	CREATE TEMP TABLE tmp_blob_text (f1 TEXT)
	
	INSERT INTO tmp_blob_byte VALUES (insertByte) #INSERT
	SELECT f1 INTO selectByte FROM tmp_blob_byte  #SELECT AND CHECK

	# blob data is not inserted in db
	INSERT INTO tmp_blob_text VALUES (selectByte)
	# check if data is inserted
	UNLOAD TO "./8533/8533_hcl_text_unload" SELECT * FROM tmp_blob_text
	
	DISPLAY "################CHECK SELECTED BYTE##################"
	DISPLAY showRes1
	DISPLAY "################CHECK UNLOADED TEXT##################"
	DISPLAY showRes2
	
end main
