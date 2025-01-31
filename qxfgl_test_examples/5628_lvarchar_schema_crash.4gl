# Project: lyc1000
# Filename: 5628_lvarchar_schema_crash.4gl
# Created By: alch
# Creation Date: Aug 11, 2020

SCHEMA schema_test

MAIN
DEFINE crash_here LIKE schema_table.col3
--DEFINE rec_crash_here RECORD LIKE schema_table.*
DEFINE no_crash_here LIKE schema_table.col4

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