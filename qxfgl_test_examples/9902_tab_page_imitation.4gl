MAIN
 DEFINE winTab1Open, winTab2Open BOOLEAN
 DEFINE inpModule,contactId, detLogType SMALLINT
	LET inpModule = 1
	WHILE TRUE 
		CASE inpModule
			WHEN 1
				IF winTab1Open = TRUE THEN
					CURRENT WINDOW IS winTab1
				ELSE
					OPEN WINDOW winTab1 WITH FORM "9902/form1"
					LET winTab1Open = TRUE 	
				END IF
				INPUT BY NAME contactId
					ON ACTION "actContactDetails"
						LET inpModule = 1
						EXIT INPUT
					ON ACTION "actContactActivities"
						LET inpModule = 2
						EXIT INPUT			
				END INPUT
			WHEN 2
				IF winTab2Open = TRUE THEN
					CURRENT WINDOW IS winTab2
				ELSE
					OPEN WINDOW winTab2 WITH FORM "9902/form2"
					LET winTab2Open = TRUE 	
				END IF
				INPUT BY NAME detLogType
					ON ACTION "actContactDetails"
						LET inpModule = 1
						EXIT INPUT
					ON ACTION "actContactActivities"
						LET inpModule = 2
						EXIT INPUT			
				END INPUT
		END CASE	
	END WHILE
END MAIN

