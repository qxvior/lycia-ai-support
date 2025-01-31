MAIN


OPEN WINDOW wButton WITH FORM "form/css_button_image_library"

	MENU
		ON ACTION "Enable Buttons"
			
			
			MENU
				ON ACTION "ACCEPT"
					CALL fgl_winmessage("ACCEPT","Event ACCEPT triggered","info")

				ON ACTION "aACCEPT"
					CALL fgl_winmessage("aACCEPT","Event aACCEPT triggered","info")

				ON ACTION "CANCEL"
					CALL fgl_winmessage("CANCEL","Event ACCEPT triggered","info")
				ON ACTION "aCANCEL"
					CALL fgl_winmessage("aCANCEL","Event aACCEPT triggered","info")

				ON ACTION "PRINT"
					CALL fgl_winmessage("PRINT","Event PRINT triggered","info")
				ON ACTION "aPRINT"
					CALL fgl_winmessage("aPRINT","Event aPRINT triggered","info")
			
				ON ACTION "UPLOAD"
					CALL fgl_winmessage("UPLOAD","Event UPLOAD triggered","info")
				ON ACTION "aUPLOAD"
					CALL fgl_winmessage("aUPLOAD","Event aUPLOAD triggered","info")
			
				ON ACTION "UPLOAD_CLOUD"
					CALL fgl_winmessage("UPLOAD_CLOUD","Event UPLOAD_CLOUD triggered","info")
				ON ACTION "aUPLOAD_CLOUD"
					CALL fgl_winmessage("aUPLOAD_CLOUD","Event aUPLOAD_CLOUD triggered","info")
			
				ON ACTION "UPLOAD_FILE"
					CALL fgl_winmessage("UPLOAD_FILE","Event UPLOAD_FILE triggered","info")
				ON ACTION "aUPLOAD_FILE"
					CALL fgl_winmessage("aUPLOAD_FILE","Event aUPLOAD_FILE triggered","info")
			
				ON ACTION "DOWNLOAD"
					CALL fgl_winmessage("DOWNLOAD","Event DOWNLOAD triggered","info")
				ON ACTION "aDOWNLOAD"
					CALL fgl_winmessage("aDOWNLOAD","Event aDOWNLOAD triggered","info")
			
				ON ACTION "DOWNLOAD_CLOUD"
					CALL fgl_winmessage("DOWNLOAD_CLOUD","Event DOWNLOAD_CLOUD triggered","info")
				ON ACTION "aDOWNLOAD_CLOUD"
					CALL fgl_winmessage("aDOWNLOAD_CLOUD","Event aDOWNLOAD_CLOUD triggered","info")
			
				ON ACTION "DOWNLOAD_FILE"
					CALL fgl_winmessage("DOWNLOAD_FILE","Event DOWNLOAD_FILE triggered","info")
				ON ACTION "aDOWNLOAD_FILE"
					CALL fgl_winmessage("aDOWNLOAD_FILE","Event aDOWNLOAD_FILE triggered","info")
			
				ON ACTION "LEFT"
					CALL fgl_winmessage("LEFT","Event LEFT triggered","info")
				ON ACTION "aLEFT"
					CALL fgl_winmessage("aLEFT","Event aLEFT triggered","info")
			
				ON ACTION "RIGHT"
					CALL fgl_winmessage("RIGHT","Event RIGHT triggered","info")
				ON ACTION "aRIGHT"
					CALL fgl_winmessage("aRIGHT","Event RIGHT triggered","info")
			
				ON ACTION "SEARCH"
					CALL fgl_winmessage("SEARCH","Event SEARCH triggered","info")
				ON ACTION "aSEARCH"
					CALL fgl_winmessage("aSEARCH","Event aSEARCH triggered","info")
					
				ON ACTION "LOOKUP"
					CALL fgl_winmessage("LOOKUP","Event LOOKUP triggered","info")		
				ON ACTION "aLOOKUP"
					CALL fgl_winmessage("aLOOKUP","Event aLOOKUP triggered","info")		

				ON ACTION "DONE"
					CALL fgl_winmessage("DONE","Event DONE triggered","info")		
				ON ACTION "aDONE"
					CALL fgl_winmessage("aDONE","Event aDONE triggered","info")		

				ON ACTION "REMOVE"
					CALL fgl_winmessage("REMOVE","Event REMOVE triggered","info")		
				ON ACTION "aREMOVE"
					CALL fgl_winmessage("aREMOVE","Event aREMOVE triggered","info")		

				ON ACTION "DELETE"
					CALL fgl_winmessage("DELETE","Event DELETE triggered","info")		
				ON ACTION "aDELETE"
					CALL fgl_winmessage("aDELETE","Event aDELETE triggered","info")		

				ON ACTION "ADD"
					CALL fgl_winmessage("ADD","Event ADD triggered","info")		
				ON ACTION "aADD"
					CALL fgl_winmessage("aADD","Event aADD triggered","info")		

				ON ACTION "MANAGE"
					CALL fgl_winmessage("MANAGE","Event MANAGE triggered","info")		
				ON ACTION "aMANAGE"
					CALL fgl_winmessage("aMANAGE","Event aMANAGE triggered","info")		

				ON ACTION "ATTACH"
					CALL fgl_winmessage("ATTACH","Event ATTACH triggered","info")		
				ON ACTION "aATTACH"
					CALL fgl_winmessage("aATTACH","Event aATTACH triggered","info")		

				ON ACTION "EDIT"
					CALL fgl_winmessage("EDIT","Event EDIT triggered","info")		
				ON ACTION "aEDIT"
					CALL fgl_winmessage("aEDIT","Event aEDIT triggered","info")		

				ON ACTION "VIEW_DETAIL"
					CALL fgl_winmessage("VIEW_DETAIL","Event VIEW_DETAIL triggered","info")		
				ON ACTION "aVIEW_DETAIL"
					CALL fgl_winmessage("aVIEW_DETAIL","Event aVIEW_DETAIL triggered","info")		

				ON ACTION "CLEAR"
					CALL fgl_winmessage("CLEAR","Event CLEAR triggered","info")		
				ON ACTION "aCLEAR"
					CALL fgl_winmessage("aCLEAR","Event aCLEAR triggered","info")		


				ON ACTION "FILTER"
					CALL fgl_winmessage("FILTER","Event FILTER triggered","info")		
				ON ACTION "aFILTER"
					CALL fgl_winmessage("aFILTER","Event aFILTER triggered","info")		


				ON ACTION "MANAGE"
					CALL fgl_winmessage("MANAGE","Event MANAGE triggered","info")		
				ON ACTION "aMANAGE"
					CALL fgl_winmessage("aMANAGE","Event aMANAGE triggered","info")		

				ON ACTION "CLONE"
					CALL fgl_winmessage("CLONE","Event CLONE triggered","info")		
				ON ACTION "aCLONE"
					CALL fgl_winmessage("aCLONE","Event aCLONE triggered","info")		

				ON ACTION "DUPLICATE"
					CALL fgl_winmessage("DUPLICATE","Event DUPLICATE triggered","info")		
				ON ACTION "aDUPLICATE"
					CALL fgl_winmessage("aDUPLICATE","Event aDUPLICATE triggered","info")		

				ON ACTION "TRANSLATE"
					CALL fgl_winmessage("TRANSLATE","Event TRANSLATE triggered","info")							
				ON ACTION "aTRANSLATE"
					CALL fgl_winmessage("aTRANSLATE","Event aTRANSLATE triggered","info")							


				ON ACTION "HELP"
					CALL fgl_winmessage("HELP","Event HELP triggered","info")
				ON ACTION "aHELP"
					CALL fgl_winmessage("aHELP","Event aHELP triggered","info")



				ON ACTION "EXIT"
				
					EXIT MENU	

					
			END MENU

		ON ACTION "EXIT"
			EXIT MENU				

	END MENU

END MAIN