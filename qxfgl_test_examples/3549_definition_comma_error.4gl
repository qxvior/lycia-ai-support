MAIN
 DEFINE l_contact
  RECORD
    cont_fname STRING
    cont_lname STRING
    cont_phone STRING
    cont_fax STRING
  END RECORD

  DEFINE fa ARRAY[5] of
  RECORD
    cont_fname STRING
    cont_lname STRING
    cont_phone STRING
    cont_fax STRING
  END RECORD

  DEFINE da DYNAMIC ARRAY of
  RECORD
    cont_fname STRING
    cont_lname STRING
    cont_phone STRING
    cont_fax STRING
  END RECORD

  TYPE MyRecord
  RECORD
    cont_fname STRING
    cont_lname STRING
    cont_phone STRING
    cont_fax STRING
  END RECORD

  DEFINE MyRecord2 TYPE AS
  RECORD
    cont_fname STRING
    cont_lname STRING
    cont_phone STRING
    cont_fax STRING
  END RECORD
END MAIN