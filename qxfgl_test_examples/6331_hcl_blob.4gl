MAIN
DEFINE b,b2, b3 BYTE
DEFINE s STRING
DEFINE i INT
CALL create_blob_field(b)
CALL push_field( b, s )
CALL pop_field( b ) returning s
CALL field_count( b ) returning i
CALL set_field_count (b, i) returning s
CALL null_field( b )
CALL index_field( b, i ) returning s
CALL create_blob_field(b2)
CALL append_fields( b, b2 )
CALL compare_blobs( b, b2 )
CALL get_blob_size(b)
CALL create_blob_field(b3)
CALL free_blob(b3)
CALL free_blob_field( b )
CALL free_blob_field( b2 )
DISPLAY "OK"
END MAIN
