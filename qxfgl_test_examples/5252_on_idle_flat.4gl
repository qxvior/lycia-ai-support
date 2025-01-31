MAIN
   DEFINE
      field1,
      field2,
      field3  CHAR(10)


   OPEN WINDOW w1 AT 1,1 WITH FORM "5252/5252_on_idle_flat" 

   INPUT BY NAME field1,field2,field3 ATTRIBUTE(WITHOUT DEFAULTS)
		ON IDLE 2 display "2"
   END INPUT
   CLOSE WINDOW w1 

END MAIN