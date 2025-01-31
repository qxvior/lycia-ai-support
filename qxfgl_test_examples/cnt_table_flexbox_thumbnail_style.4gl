--DATABASE tsc		

	DEFINE rec 
		RECORD
    	fStyle STRING,
    	fCategory STRING,
    	fFrom  STRING,
    	fTo STRING,
    	fMinQuantity STRING,
    	fAvailableIn STRING,
    	fPrice DECIMAL,
    	fFinish STRING,
    	fornament STRING
     END RECORD

	DEFINE fSortBy STRING
	DEFINE rec_id SMALLINT, sc_line, i , j SMALLINT
	DEFINE myClickMessage STRING

	DEFINE rec_arr DYNAMIC ARRAY OF 
		RECORD
			urlImage STRING,
			url STRING,	
			breed STRING,
			iq SMALLINT
		END RECORD
	
############################################################################
# MAIN
#
#
############################################################################

MAIN

	CALL ui_init()
	
	CALL recInit()
	CALL recArrayInit()
	
	OPEN WINDOW mywin WITH FORM "form/cnt_table_flexbox_thumbnail_style"
 	CALL fgl_settitle("CSS FlexBox Display Array Example")
  #CALL ui.Interface.setImage(CALL ui.interface.setImage("qx://application/cascade.png"))
	CALL ui.Interface.setText("FlexBox")
 	
 	

	#CALL fgl_setkeylabel("ACCEPT","Ok","{CONTEXT}/public/querix/icon/png/32/ok_button.png",1,FALSE,"Accept current operation")	
	#CALL fgl_setkeylabel("DONE","Done","{CONTEXT}/public/querix/icon/png/32/ok_button.png",1,FALSE,"Done / Close")	
	#CALL fgl_setkeylabel("CANCEL","Cancel","{CONTEXT}/public/querix/icon/png/32/cancel.png",2,FALSE,"Cancel current operation")
	#CALL fgl_setkeylabel("F6","Search","{CONTEXT}/public/querix/icon/png/32/find.png",100,TRUE,"Search for dogs")
	#CALL fgl_setkeylabel("F3","Delete","{CONTEXT}/public/querix/icon/png/32/trash_bin.png",100,TRUE,"Delete currently selected dog")

	#CALL fgl_setkeylabel("Edit","Edit","{CONTEXT}/public/querix/icon/png/32/list-edit.png",50,FALSE,"Edit dog details")
	#CALL fgl_setkeylabel("Exit","Exit","{CONTEXT}/public/querix/icon/png/32/button_on_off_blue.png",9990,FALSE,"Exit Dog Shopping Basked")
	
	#CALL fgl_setkeylabel("F7","","")
	

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL edit()	

{    ON ACTION "Move To"
      LET rec_id = fgl_winprompt(15,5,"Go To Record","", 6, 2)

      CALL fgl_dialog_setcurrline(sc_line,rec_id)
      CALL fgl_winmessage("Screen Line:" || sc_line,rec_id,"info")

		ON ACTION "actImageClick"
			LET myClickMessage = myClickMessage, " image"
			CALL fgl_winmessage("You clicked on the image",myClickMessage,"info")

		ON ACTION "actURLClick"
			LET myClickMessage = myClickMessage, " URL"
			CALL fgl_winmessage("You clicked on the image",myClickMessage,"info")

		ON ACTION "actBreedClick"
			LET myClickMessage = myClickMessage, " Bread"		
			CALL fgl_winmessage("You clicked on the Breed",myClickMessage,"info")

		ON ACTION "actIqClick"
			LET myClickMessage = myClickMessage, " IQ"		
			CALL fgl_winmessage("You clicked on the IQ",myClickMessage,"info")
 } 

END MAIN


FUNCTION edit()
	DEFINE idx SMALLINT 
	DIALOG
	
		INPUT BY NAME rec.* WITHOUT DEFAULTS
		END INPUT
	
		DISPLAY ARRAY rec_arr TO rec_arr.*
		
			BEFORE ROW
				LET idx = arr_curr()
				LET myClickMessage =  rec_arr[idx].url CLIPPED , "\n"
				LET myClickMessage =  myClickMessage CLIPPED, rec_arr[idx].breed CLIPPED , "\nIQ:", rec_arr[idx].iq 

			ON ACTION "ACCEPT"
				CALL fgl_winmessage("You clicked on the image",myClickMessage,"info")
						
			ON ACTION "GoTo"
      LET rec_id = fgl_winprompt(15,5,"Go To Record","", 6, 2)

      CALL fgl_dialog_setcurrline(sc_line,rec_id)
      CALL fgl_winmessage("Screen Line:" || sc_line,rec_id,"info")

			ON ACTION "actImageClick"
				LET myClickMessage = myClickMessage, " image"
				CALL fgl_winmessage("You clicked on the image",myClickMessage,"info")

			ON ACTION "actURLClick"
				LET myClickMessage = myClickMessage, " URL"
				CALL fgl_winmessage("You clicked on the image",myClickMessage,"info")

			ON ACTION "actBreedClick"
				LET myClickMessage = myClickMessage, " Bread"		
				CALL fgl_winmessage("You clicked on the Breed",myClickMessage,"info")

			ON ACTION "actIqClick"
				LET myClickMessage = myClickMessage, " IQ"		
				CALL fgl_winmessage("You clicked on the IQ",myClickMessage,"info")		
		END DISPLAY 

	#Sort By... located in the top right form
		INPUT BY NAME fSortBy WITHOUT DEFAULTS
			ON CHANGE fSortBy
				CALL fgl_winmessage("INPUT Event On Change fSortBy","INPUT Event On Change fSortBy\nYou can do something with it...","info")			
		END INPUT

     	
		ON ACTION "actRefineSearch"
			CALL fgl_winmessage("Event actRefineSearch","Event actRefineSearch\nDo something with it","info")
		ON ACTION "actReset"
			CALL fgl_winmessage("Event actReset","Event actReset\nDo something with it","info")

			
		ON ACTION "CANCEL"
			EXIT DIALOG
     			
    ON ACTION "HELP"
  		CALL onlineHelp("TableAll",NULL)				
			
	END DIALOG
	 
END FUNCTION

FUNCTION recInit()

	LET fSortBy = "Price Up"
	     			
	LET rec.fStyle = "Style 1"
	LET rec.fCategory  = "Category 1"
	LET rec.fFrom = "From 1"
	LET rec.fTo = "To 1"
	LET rec.fMinQuantity = "MinQuantity 1"
	LET rec.fAvailableIn = "AvailableIn 1"

	LET rec.fPrice = 25.55		
	
	LET rec.fFinish = "Finish 1"
	LET rec.fornament = "Ornament 1"

END FUNCTION


FUNCTION recArrayInit()
	DEFINE i INT

	LET rec_arr[1].urlImage = "http://builds.querix.com/demo-image/dog/beagle.jpg"
	LET rec_arr[1].url = "http://builds.querix.com/demo-image/dog/beagle.jpg"
	LET rec_arr[1].breed = "Beagle"
	LET rec_arr[1].iq = 72

	LET rec_arr[2].urlImage = "http://builds.querix.com/demo-image/dog/american_staffordshire_terriers.jpg"			
	LET rec_arr[2].url = "http://builds.querix.com/demo-image/dog/american_staffordshire_terriers.jpg"
	LET rec_arr[2].breed = "US-Staffordshire Terrier"
	LET rec_arr[2].iq = 71

	LET rec_arr[3].urlImage = "http://builds.querix.com/demo-image/dog/scottish_terrier.jpg"	
	LET rec_arr[3].url = "http://builds.querix.com/demo-image/dog/scottish_terrier.jpg"
	LET rec_arr[3].breed = "Scottish Terrier"
	LET rec_arr[3].iq = 70

	LET rec_arr[4].urlImage = "http://builds.querix.com/demo-image/dog/canine.jpg"				
	LET rec_arr[4].url = "http://builds.querix.com/demo-image/dog/canine.jpg"	
	LET rec_arr[4].breed = "Canine"
	LET rec_arr[4].iq = 29

	LET rec_arr[5].urlImage = "http://builds.querix.com/demo-image/dog/collie.jpg"			
	LET rec_arr[5].url = "http://builds.querix.com/demo-image/dog/collie.jpg"	
	LET rec_arr[5].breed = "Collie"	
	LET rec_arr[5].iq = 33

	LET rec_arr[6].urlImage = "http://builds.querix.com/demo-image/dog/dachshund.jpg"	
	LET rec_arr[6].url = "http://builds.querix.com/demo-image/dog/dachshund.jpg"	
	LET rec_arr[6].breed = "Dachshund"
	LET rec_arr[6].iq = 20

	LET rec_arr[7].urlImage = "http://builds.querix.com/demo-image/dog/foxhound.jpg"			
	LET rec_arr[7].url = "http://builds.querix.com/demo-image/dog/foxhound.jpg"	
	LET rec_arr[7].breed = "Foxhound"
	LET rec_arr[7].iq = 68

	LET rec_arr[8].urlImage = "http://builds.querix.com/demo-image/dog/german_shepherd.jpg"			
	LET rec_arr[8].url = "http://builds.querix.com/demo-image/dog/german_shepherd.jpg"	
	LET rec_arr[8].breed = "German Shepherd"
	LET rec_arr[8].iq = 49

	LET rec_arr[9].urlImage = "http://builds.querix.com/demo-image/dog/golden_retriever.jpg"			
	LET rec_arr[9].url = "http://builds.querix.com/demo-image/dog/golden_retriever.jpg"	
	LET rec_arr[9].breed = "Golden Retriever"
	LET rec_arr[9].iq = 18

	LET rec_arr[10].urlImage = "http://builds.querix.com/demo-image/dog/labrador.jpg"			
	LET rec_arr[10].url = "http://builds.querix.com/demo-image/dog/labrador.jpg"	
	LET rec_arr[10].breed = "Labrador"
	LET rec_arr[10].iq = 33

	LET rec_arr[11].urlImage = "http://builds.querix.com/demo-image/dog/mastiff.jpg"		
	LET rec_arr[11].url = "http://builds.querix.com/demo-image/dog/mastiff.jpg"	
	LET rec_arr[11].breed = "Mastiff"
	LET rec_arr[11].iq = 61

	LET rec_arr[12].urlImage = "http://builds.querix.com/demo-image/dog/yorkie.jpg"		
	LET rec_arr[12].url = "http://builds.querix.com/demo-image/dog/yorkie.jpg"	
	LET rec_arr[12].breed = "Yorkie"
	LET rec_arr[12].iq = 52


	LET rec_arr[13].urlImage = "http://builds.querix.com/demo-image/dog/bandog.jpg"		
	LET rec_arr[13].url = "http://builds.querix.com/demo-image/dog/bandog.jpg"	
	LET rec_arr[13].breed = "Bandog"
	LET rec_arr[13].iq = 8
	

	LET rec_arr[14].urlImage = "http://builds.querix.com/demo-image/dog/bloodhound.jpg"		
	LET rec_arr[14].url = "http://builds.querix.com/demo-image/dog/bloodhound.jpg"	
	LET rec_arr[14].breed = "Bloodhound"
	LET rec_arr[14].iq = 48	
	
	LET rec_arr[15].urlImage = "http://builds.querix.com/demo-image/dog/border_terrier.jpg"		
	LET rec_arr[15].url = "http://builds.querix.com/demo-image/dog/border_terrier.jpg"	
	LET rec_arr[15].breed = "Border Terrier"
	LET rec_arr[15].iq = 83

	LET rec_arr[16].urlImage = "http://builds.querix.com/demo-image/dog/bullterrier.jpg"		
	LET rec_arr[16].url = "http://builds.querix.com/demo-image/dog/bullterrier.jpg"	
	LET rec_arr[16].breed = "Bullterrier"
	LET rec_arr[16].iq = 24	

	LET rec_arr[17].urlImage = "http://builds.querix.com/demo-image/dog/english_bulldog.jpg"		
	LET rec_arr[17].url = "http://builds.querix.com/demo-image/dog/english_bulldog.jpg"	
	LET rec_arr[17].breed = "English Bulldog"
	LET rec_arr[17].iq = 55	

	LET rec_arr[18].urlImage = "http://builds.querix.com/demo-image/dog/miniature_bull_terrier.jpg"		
	LET rec_arr[18].url = "http://builds.querix.com/demo-image/dog/miniature_bull_terrier.jpg"	
	LET rec_arr[18].breed = "Miniature Bull Terrier"
	LET rec_arr[18].iq = 12	

	LET rec_arr[19].urlImage = "http://builds.querix.com/demo-image/dog/northern_inuit.jpg"		
	LET rec_arr[19].url = "http://builds.querix.com/demo-image/dog/northern_inuit.jpg"	
	LET rec_arr[19].breed = "Northern Inuit"
	LET rec_arr[19].iq = 71	

	LET rec_arr[20].urlImage = "http://builds.querix.com/demo-image/dog/parson_russell_terrrier.jpg"		
	LET rec_arr[20].url = "http://builds.querix.com/demo-image/dog/parson_russell_terrrier.jpg"	
	LET rec_arr[20].breed = "Parson Russell Terrier"
	LET rec_arr[20].iq = 49	

	LET rec_arr[21].urlImage = "http://builds.querix.com/demo-image/dog/patterdale_terrier.jpg"		
	LET rec_arr[21].url = "http://builds.querix.com/demo-image/dog/patterdale_terrier.jpg"	
	LET rec_arr[21].breed = "Patterdale Terrier"
	LET rec_arr[21].iq = 22					

	LET rec_arr[22].urlImage = "http://builds.querix.com/demo-image/dog/utonagan.jpg"		
	LET rec_arr[22].url = "http://builds.querix.com/demo-image/dog/utonagan.jpg"	
	LET rec_arr[22].breed = "Utonaganr"
	LET rec_arr[22].iq = 22	

	LET rec_arr[23].urlImage = "http://builds.querix.com/demo-image/dog/whippet.jpg"		
	LET rec_arr[23].url = "http://builds.querix.com/demo-image/dog/whippet.jpg"	
	LET rec_arr[23].breed = "whippet"
	LET rec_arr[23].iq = 66

	LET rec_arr[24].urlImage = "http://builds.querix.com/demo-image/dog/english_foxhound.jpg"		
	LET rec_arr[24].url = "http://builds.querix.com/demo-image/dog/english_foxhound.jpg"	
	LET rec_arr[24].breed = "English Foxhound"
	LET rec_arr[24].iq = 55			

	LET rec_arr[25].urlImage = "http://builds.querix.com/demo-image/dog/bernese_mountain.jpg"			
	LET rec_arr[25].url = "http://builds.querix.com/demo-image/dog/bernese_mountain.jpg"
	LET rec_arr[25].breed = "Bernese Mountain"
	LET rec_arr[25].iq = 36

	LET rec_arr[26].urlImage = "http://builds.querix.com/demo-image/dog/boxer.jpg"	
	LET rec_arr[26].url = "http://builds.querix.com/demo-image/dog/boxer.jpg"
	LET rec_arr[26].breed = "Boxer"
	LET rec_arr[26].iq = 58
	
END FUNCTION

FUNCTION getRandomMunitsValue(i)
	DEFINE i int
	CASE i
		WHEN 1
			RETURN "B"
		WHEN 2
			RETURN "S"
		WHEN 3
			RETURN "P"
		WHEN 4
			RETURN "U"
		WHEN 5
			RETURN "G"
		WHEN 6
			RETURN "H"
		WHEN 7
			RETURN "R"
	END CASE			

END FUNCTION


FUNCTION getRandomDunitsValue(i)
	DEFINE i int
	CASE i
		WHEN 1
			RETURN "B"
		WHEN 2
			RETURN "F"
		WHEN 3
			RETURN "O"
	END CASE			

END FUNCTION