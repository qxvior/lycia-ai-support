MAIN
	DEFINE
		prg_arr DYNAMIC ARRAY OF RECORD
			f1 CHAR(10),
			f2 CHAR(10),
			f3 CHAR(10)
		END RECORD,
		
      i INTEGER
	
	DEFER INTERRUPT
	
	OPEN WINDOW w1 AT 1,2 WITH FORM "4642/4642_before_input_repeat" ATTRIBUTE (FORM LINE FIRST)

   LET i = 0
   
   INPUT ARRAY prg_arr WITHOUT DEFAULTS FROM scr_arr.* ATTRIBUTE(UNBUFFERED,auto append=FALSE)
      BEFORE INPUT
         LET i = i+1
         DISPLAY i," BEFORE INPUT"
         
      # Should not compile
      BEFORE INPUT
         LET i = i+1
         DISPLAY i," BEFORE INPUT2"
   END INPUT
   
   CLOSE WINDOW w1
   
END MAIN