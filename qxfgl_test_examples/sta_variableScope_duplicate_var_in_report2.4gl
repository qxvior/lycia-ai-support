
################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global.4gl"

#####################################################################################
# REPORT rep_2(rep_string)
#
#
#####################################################################################

REPORT rep_2(rep_string)
   DEFINE rep_string STRING
	DEFINE var4 char(30)
#	LET var4 = "Hubert"
   FORMAT
   PAGE HEADER
      skip 6 lines
			LET var4 ="Hubert"  
			       
      ON EVERY ROW 
         PRINT rep_string
         PRINT var4
END REPORT
 