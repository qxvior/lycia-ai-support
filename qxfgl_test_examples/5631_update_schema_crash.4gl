# Project: lyc1000
# Filename: 5631_update_schema_crash.4gl
# Created By: alch
# Creation Date: Aug 12, 2020

SCHEMA schema_test0031

MAIN
	UPDATE schema_table SET col1 = 5 WHERE col1 = 1
END MAIN

{
create table vendornote 
  (
    cmpy_code nchar(2),
    vend_code nchar(8),
    note_date datetime year to second,
    note_text lvarchar(4096)
  );

  create table schema_table 
  (
    col1 integer,
    col2 nchar(8),
    col3 lvarchar(2048),
    col4 datetime year to second
  );
  }