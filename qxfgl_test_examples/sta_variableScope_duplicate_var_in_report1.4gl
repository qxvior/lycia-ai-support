################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global.4gl"

#####################################################################################
# REPORT rep_1(rep_string)
#
#
#####################################################################################

REPORT rep_1(rep_string)
   DEFINE rep_string STRING
	DEFINE var4 char(35)
#	LET var4 = 111	
	
   FORMAT
   PAGE HEADER
      skip 6 lines
			LET var4 = "Alex"	         
      ON EVERY ROW 
         PRINT rep_string
         PRINT var4
END REPORT


 