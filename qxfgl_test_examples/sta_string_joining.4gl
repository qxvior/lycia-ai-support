##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE s1, s2, s3, s4 STRING
	DEFINE join_result1,join_result2,join_result3,join_result4,join_result5,join_result6,join_result7 STRING 
	
	LET s1 = "Adam"
	LET s2 = "Eva"
	LET s3 = "Apple"
	LET s4 = NULL
	
	OPEN WINDOW sta_string_joining WITH FORM "form/sta_string_joining"
	
	LET join_result1 = s1, " ", s2, " ", s3, " ", s4
	LET join_result2 = s1|| " " || s2 || " " || s3 || " " || s4
	LET join_result3 = SFMT("%1%2%3%4", s1, s2, s3, s4)	
	LET join_result4 = SFMT("1st = '%1' 2nd = '%2' 3rd = '%3'  4th = '%4'", s1,s2,s3,s4)
	LET join_result5 = "s1 = ",s1 USING "##&", "AND s2 =", s3 USING "##&"
	LET join_result6 = SFMT("s1 = %1 AND s2 = %2", s1 USING "##&", s2 USING "##&" )


			
			DISPLAY s1 TO s1
			DISPLAY s2 TO s2
			DISPLAY s3 TO s3
			#DISPLAY s4 TO s4
				
			DISPLAY join_result1 TO join_result1
			DISPLAY join_result2 TO join_result2
			DISPLAY join_result3 TO join_result3
			DISPLAY join_result4 TO join_result4
			DISPLAY join_result5 TO join_result5
			DISPLAY join_result6 TO join_result6
		
			#displayed to the console
			DISPLAY "s1 = ",s1 USING "##&", "AND s2 =", s2 USING "##&"
			DISPLAY SFMT("s1 = %1 AND s2 = %2", s1 USING "##&", s2 USING "##&" )
	
	MENU

		ON ACTION "OPTION1"#First Segment
					DISPLAY "SFMT(\"%1\",s1,s2)" TO lb_result7
					LET join_result7 = SFMT("%1",s1,s2)
					DISPLAY join_result7 TO join_result7
		ON ACTION "OPTION2"#Second Segment"
					DISPLAY "SFMT(\"%2\",s1,s2)" TO lb_result7
					LET join_result7 = SFMT("%2",s1,s2)
					DISPLAY join_result7 TO join_result7
		ON ACTION "OPTION3"#First-Second Segment"
					DISPLAY "SFMT(\"%1-%2\",s1,s2)" TO lb_result7
					LET join_result7 = SFMT("%1-%2",s1,s2)
					DISPLAY join_result7 TO join_result7
		ON ACTION "OPTION4"#Second-First Segment"
					DISPLAY "SFMT(\"%2-%1\",s1,s2)" TO lb_result7
					LET join_result7 = SFMT("%2-%1",s1,s2)
					DISPLAY join_result7 TO join_result7

		ON ACTION "CANCEL"
			EXIT MENU
	END MENU
	
	CLOSE WINDOW sta_string_joining
END MAIN
##################################################################################
# END MAIN
##################################################################################