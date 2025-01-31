#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
database stores

main

  sql drop sequence if exists "informix".sequence_lyc_4092 end sql
  display "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

  sql
    create sequence "informix".sequence_lyc_4092 increment by -1 start with -10000 maxvalue 9223372036854775807 minvalue -50000000 cycle cache 12345 noorder
--    create sequence "informix".sequence_lyc_4092 increment by -1 start with -10000 maxvalue 92233720368547758 minvalue -50000000 cycle cache 12345 noorder --> If 9223372036854775807 is reduced to 92233720368547758,    
  end sql                                                                                                                                                    --> there is no runtime error.
  display "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE  
  
end main
  
