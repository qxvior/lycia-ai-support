############################################################
# Globals
############################################################
GLOBALS "gdt_globals.4gl"


############################################################################
# FUNCTION init_contact()
#
#	Arguments
# none
#
# RETURN
#	VOID
#
# Initialise demo app variables
############################################################################
FUNCTION init_contact()
	DEFINE i INT
	LET currRecId = 1

	LET cont_pic[1] = "qx://application/image_contact/contact01_100.png"
	LET cont_pic[2] = "qx://application/image_contact/contact02_100.png"
	LET cont_pic[3] = "qx://application/image_contact/contact03_100.png"
	LET cont_pic[4] = "qx://application/image_contact/contact04_100.png"
	LET cont_pic[5] = "qx://application/image_contact/contact05_100.png"
	LET cont_pic[6] = "qx://application/image_contact/contact06_100.png"
	LET cont_pic[7] = "qx://application/image_contact/contact07_100.png"
	LET cont_pic[8] = "qx://application/image_contact/contact08_100.png"
	LET cont_pic[9] = "qx://application/image_contact/contact09_100.png"
	LET cont_pic[10] = "qx://application/image_contact/contact10_100.png"
	LET cont_pic[11] = "qx://application/image_contact/contact11_100.png"
	LET cont_pic[12] = "qx://application/image_contact/contact12_100.png"
	LET cont_pic[13] = "qx://application/image_contact/contact13_100.png"
	LET cont_pic[14] = "qx://application/image_contact/contact14_100.png"
	LET cont_pic[15] = "qx://application/image_contact/contact15_100.png"
	LET cont_pic[16] = "qx://application/image_contact/contact15_100.png"
	LET cont_pic[17] = "qx://application/image_contact/contact15_100.png"
	LET cont_pic[18] = "qx://application/image_contact/contact15_100.png"
	LET cont_pic[19] = "qx://application/image_contact/contact15_100.png"
	LET cont_pic[20] = "qx://application/image_contact/contact15_100.png"
	LET cont_pic[21] = "qx://application/image_contact/contact15_100.png"
																				
	LET cont_rec[1].cont_id = 1
	LET cont_rec[1].cont_group_id = "Family"     
	LET cont_rec[1].cont_title = "Mr"
	LET cont_rec[1].cont_fname = "John"
	LET cont_rec[1].cont_lname = "Smith"
	LET cont_rec[1].cont_country = "Germany"
	LET cont_rec[1].cont_phone =	"+49 8243 453978"
	LET cont_rec[1].cont_mobile = "+49 8243 353455"
	LET cont_rec[1].cont_fax = 		"+49 8243 453935" 		
	LET cont_rec[1].cont_email = "j.smith@btnet.com"
	LET cont_rec[1].cont_url = "www.jsmith.com"
	LET cont_rec[1].cont_dob = "11/12/1978"	
	LET cont_rec[1].cont_memo = "This is the memo field for John Smith"
	LET cont_rec[1].cont_picture = "qx://application/image_contact/contact01_100.png"

	LET cont_rec[2].cont_id = 2
	LET cont_rec[2].cont_group_id = "Family"     
	LET cont_rec[2].cont_title = "Mr"
	LET cont_rec[2].cont_fname = "George"
	LET cont_rec[2].cont_lname = "Smith"
	LET cont_rec[2].cont_country = "Germany"
	LET cont_rec[2].cont_phone =	"+49 8243 453978"
	LET cont_rec[2].cont_mobile = "+49 8243 353455"
	LET cont_rec[2].cont_fax = 		"+49 8243 453935" 		
	LET cont_rec[2].cont_email = "g.smith@btnet.com"
	LET cont_rec[2].cont_url = "www.tsmith.com"
	LET cont_rec[2].cont_dob = "12/08/1976"	
	LET cont_rec[2].cont_type = 1	
	LET cont_rec[2].cont_memo = "This is the memo field for George Smith"
	LET cont_rec[2].cont_picture = "qx://application/image_contact/contact02_100.png"

	LET cont_rec[3].cont_id = 3
	LET cont_rec[3].cont_group_id = "Friend"     
	LET cont_rec[3].cont_title = "Mr"
	LET cont_rec[3].cont_fname = "Steve"
	LET cont_rec[3].cont_lname = "Williams"
	LET cont_rec[3].cont_country = "United Kingdom"
	LET cont_rec[3].cont_phone =	"+44 232 545435"
	LET cont_rec[3].cont_mobile = "+44 532 558855"
	LET cont_rec[3].cont_fax = 		"+44 232 857674" 		
	LET cont_rec[3].cont_email = "s.williams@btnet.co.uk"
	LET cont_rec[3].cont_url = "www.swilliams.com"
	LET cont_rec[3].cont_dob = "02/02/1969"	
	LET cont_rec[3].cont_type = 1	
	LET cont_rec[3].cont_memo = "This is the memo field for Steve Williams"
	LET cont_rec[3].cont_picture = "qx://application/image_contact/contact03_100.png"

	LET cont_rec[4].cont_id = 4
	LET cont_rec[4].cont_group_id = "Friend"     
	LET cont_rec[4].cont_title = "Mr"
	LET cont_rec[4].cont_fname = "Tom"
	LET cont_rec[4].cont_lname = "Hanks"
	LET cont_rec[4].cont_country = "United Kingdom"
	LET cont_rec[4].cont_phone =	"+44 232 545435"
	LET cont_rec[4].cont_mobile = "+44 532 558855"
	LET cont_rec[4].cont_fax = 		"+44 232 857674" 		
	LET cont_rec[4].cont_email = "s.williams@btnet.co.uk"
	LET cont_rec[4].cont_url = "www.swilliams.com"
	LET cont_rec[4].cont_dob = "02/02/1969"	
	LET cont_rec[4].cont_type = 1	
	LET cont_rec[4].cont_memo = "This is the memo field for Steve Williams"
	LET cont_rec[4].cont_picture = "qx://application/image_contact/contact04_100.png"
	
	LET cont_rec[5].cont_id = 5
	LET cont_rec[5].cont_group_id = "Friend"     
	LET cont_rec[5].cont_title = "Mrs"
	LET cont_rec[5].cont_fname = "Angela"
	LET cont_rec[5].cont_lname = "Swain"
	LET cont_rec[5].cont_country = "United Kingdom"
	LET cont_rec[5].cont_phone =	"+44 232 545435"
	LET cont_rec[5].cont_mobile = "+44 532 558855"
	LET cont_rec[5].cont_fax = 		"+44 232 857674" 		
	LET cont_rec[5].cont_email = "s.williams@btnet.co.uk"
	LET cont_rec[5].cont_url = "www.swilliams.com"
	LET cont_rec[5].cont_dob = "02/02/1969"	
	LET cont_rec[5].cont_type = 1	
	LET cont_rec[5].cont_memo = "This is the memo field for Steve Williams"
	LET cont_rec[5].cont_picture = "qx://application/image_contact/contact05_100.png"
	
		
	LET cont_rec[6].cont_id = 6
	LET cont_rec[6].cont_group_id = "Business"     
	LET cont_rec[6].cont_title = "Mrs"
	LET cont_rec[6].cont_fname = "Laura"
	LET cont_rec[6].cont_lname = "Steinman"
	LET cont_rec[6].cont_country = "United Kingdom"
	LET cont_rec[6].cont_phone =	"+44 232 545435"
	LET cont_rec[6].cont_mobile = "+44 532 558855"
	LET cont_rec[6].cont_fax = 		"+44 232 857674" 		
	LET cont_rec[6].cont_email = "s.williams@btnet.co.uk"
	LET cont_rec[6].cont_url = "www.swilliams.com"
	LET cont_rec[6].cont_dob = "02/02/1969"	
	LET cont_rec[6].cont_type = 1	
	LET cont_rec[6].cont_memo = "This is the memo field for Steve Williams"
	LET cont_rec[6].cont_picture = "qx://application/image_contact/contact06_100.png"
	
		
	LET cont_rec[7].cont_id = 7
	LET cont_rec[7].cont_group_id = "Business"     
	LET cont_rec[7].cont_title = "Mrs"
	LET cont_rec[7].cont_fname = "Pamela"
	LET cont_rec[7].cont_lname = "Ackerly"
	LET cont_rec[7].cont_country = "Australia"
	LET cont_rec[7].cont_phone =	"+44 232 545435"
	LET cont_rec[7].cont_mobile = "+44 532 558855"
	LET cont_rec[7].cont_fax = 		"+44 232 857674" 
	LET cont_rec[7].cont_email = "s.williams@btnet.co.uk"
	LET cont_rec[7].cont_url = "www.swilliams.com"
	LET cont_rec[7].cont_dob = "02/02/1969"	
	LET cont_rec[7].cont_type = 1	
	LET cont_rec[7].cont_memo = "This is the memo field for Pamela Ackerly"
	LET cont_rec[7].cont_picture = "qx://application/image_contact/contact07_100.png"	

		
	LET cont_rec[8].cont_id = 8
	LET cont_rec[8].cont_group_id = "Business"     
	LET cont_rec[8].cont_title = "Mr"
	LET cont_rec[8].cont_fname = "Thilo"
	LET cont_rec[8].cont_lname = "Whine"
	LET cont_rec[8].cont_country = "Germany"
	LET cont_rec[8].cont_phone =	"+49 89 232323"
	LET cont_rec[8].cont_mobile = "+49 157  558855"
	LET cont_rec[8].cont_fax = 		"+49 89 857674" 
	LET cont_rec[8].cont_email = "t.whine@t-online.de"
	LET cont_rec[8].cont_url = "www.whine.de"
	LET cont_rec[8].cont_dob = "06/07/1988"	
	LET cont_rec[8].cont_type = 1	
	LET cont_rec[8].cont_memo = "This is the memo field for Thilo Whein"
	LET cont_rec[8].cont_picture = "qx://application/image_contact/contact08_100.png"		

		
	LET cont_rec[9].cont_id = 9
	LET cont_rec[9].cont_group_id = "Other"     
	LET cont_rec[9].cont_title = "Mr"
	LET cont_rec[9].cont_fname = "Jack"
	LET cont_rec[9].cont_lname = "Ribber"
	LET cont_rec[9].cont_country = "Germany"
	LET cont_rec[9].cont_phone =	"+49 89 232323"
	LET cont_rec[9].cont_mobile = "+49 157  558855"
	LET cont_rec[9].cont_fax = 		"+49 89 857674" 
	LET cont_rec[9].cont_email = "t.whine@t-online.de"
	LET cont_rec[9].cont_url = "www.horror.de"
	LET cont_rec[9].cont_dob = "06/07/1928"	
	LET cont_rec[9].cont_type = 1	
	LET cont_rec[9].cont_memo = "This is the memo field for Jack the Ribber"
	LET cont_rec[9].cont_picture = "qx://application/image_contact/contact09_100.png"
	
		
		
	LET cont_rec[10].cont_id = 10
	LET cont_rec[10].cont_group_id = "Friend"     
	LET cont_rec[10].cont_title = "Mr"
	LET cont_rec[10].cont_fname = "Daniel"
	LET cont_rec[10].cont_lname = "White"
	LET cont_rec[10].cont_country = "United Kingdom"
	LET cont_rec[10].cont_phone =	"+49 89 232323"
	LET cont_rec[10].cont_mobile = "+49 157  558855"
	LET cont_rec[10].cont_fax = 		"+49 89 857674" 
	LET cont_rec[10].cont_email = "t.whine@t-online.de"
	LET cont_rec[10].cont_url = "www.whine.de"
	LET cont_rec[10].cont_dob = "06/07/1953"	
	LET cont_rec[10].cont_type = 1	
	LET cont_rec[10].cont_memo = "This is the memo field for Daniel White"
	LET cont_rec[10].cont_picture = "qx://application/image_contact/contact10_100.png"
	
		
	LET cont_rec[11].cont_id = 11
	LET cont_rec[11].cont_group_id = "Business"     
	LET cont_rec[11].cont_title = "Mrs"
	LET cont_rec[11].cont_fname = "Sandra"
	LET cont_rec[11].cont_lname = "Dixon"
	LET cont_rec[11].cont_country = "United States"
	LET cont_rec[11].cont_phone =	"+49 89 232323"
	LET cont_rec[11].cont_mobile = "+49 157  558855"
	LET cont_rec[11].cont_fax = 		"+49 89 857674" 
	LET cont_rec[11].cont_email = "t.whine@t-online.de"
	LET cont_rec[11].cont_url = "www.whine.de"
	LET cont_rec[11].cont_dob = "06/07/1969"	
	LET cont_rec[11].cont_type = 1	
	LET cont_rec[11].cont_memo = "This is the memo field for Sandra Dixon"
	LET cont_rec[11].cont_picture = "qx://application/image_contact/contact11_100.png"
	
		
	LET cont_rec[12].cont_id = 12
	LET cont_rec[12].cont_group_id = "Friend"     
	LET cont_rec[12].cont_title = "Mrs"
	LET cont_rec[12].cont_fname = "Mirjam"
	LET cont_rec[12].cont_lname = "Wenig"
	LET cont_rec[12].cont_country = "Germany"
	LET cont_rec[12].cont_phone =	"+49 89 232323"
	LET cont_rec[12].cont_mobile = "+49 157  558855"
	LET cont_rec[12].cont_fax = 		"+49 89 857674" 
	LET cont_rec[12].cont_email = "m.wenig@t-online.de"
	LET cont_rec[12].cont_url = "www.wenig.de"
	LET cont_rec[12].cont_dob = "06/07/1988"	
	LET cont_rec[12].cont_type = 1	
	LET cont_rec[12].cont_memo = "This is the memo field for Mirjam Wenig"
	LET cont_rec[12].cont_picture = "qx://application/image_contact/contact12_100.png"
	
		
	LET cont_rec[13].cont_id = 13
	LET cont_rec[13].cont_group_id = "Business"     
	LET cont_rec[13].cont_title = "Mr"
	LET cont_rec[13].cont_fname = "Josef"
	LET cont_rec[13].cont_lname = "Huber"
	LET cont_rec[13].cont_country = "Germany"
	LET cont_rec[13].cont_phone =	"+49 89 232323"
	LET cont_rec[13].cont_mobile = "+49 157  558855"
	LET cont_rec[13].cont_fax = 		"+49 89 857674" 
	LET cont_rec[13].cont_email = "j.huber@t-online.de"
	LET cont_rec[13].cont_url = "www.huber.de"
	LET cont_rec[13].cont_dob = "06/07/1988"	
	LET cont_rec[13].cont_type = 1	
	LET cont_rec[13].cont_memo = "This is the memo field for Josef Huber"
	LET cont_rec[13].cont_picture = "qx://application/image_contact/contact13_100.png"
	
	LET cont_rec[14].cont_id = 14
	LET cont_rec[14].cont_group_id = "Other"     
	LET cont_rec[14].cont_title = "Mrs"
	LET cont_rec[14].cont_fname = "Jane"
	LET cont_rec[14].cont_lname = "Slocam"
	LET cont_rec[14].cont_country = "United Kingdom"
	LET cont_rec[14].cont_phone =	"+44 89 232323"
	LET cont_rec[14].cont_mobile = "+44 157  558855"
	LET cont_rec[14].cont_fax = 		"+44 89 857674" 
	LET cont_rec[14].cont_email = "j.slocam@t-online.de"
	LET cont_rec[14].cont_url = "www.slocam.de"
	LET cont_rec[14].cont_dob = "06/07/1988"	
	LET cont_rec[14].cont_type = 1	
	LET cont_rec[14].cont_memo = "This is the memo field for contact 14"
	LET cont_rec[14].cont_picture = "qx://application/image_contact/contact14_100.png"

	LET cont_rec[15].cont_id = 15
	LET cont_rec[15].cont_group_id = "Business"     
	LET cont_rec[15].cont_title = "Mr"
	LET cont_rec[15].cont_fname = "Ivan"
	LET cont_rec[15].cont_lname = "Drackson"
	LET cont_rec[15].cont_country = "United States"
	LET cont_rec[15].cont_phone =	"+1 89 232323"
	LET cont_rec[15].cont_mobile = "+1 157  558855"
	LET cont_rec[15].cont_fax = 		"+1 89 857674" 
	LET cont_rec[15].cont_email = "i.drackson@t-online.de"
	LET cont_rec[15].cont_url = "www.drackson.de"
	LET cont_rec[15].cont_dob = "06/07/1988"	
	LET cont_rec[15].cont_type = 1	
	LET cont_rec[15].cont_memo = "This is the memo field for contact 15"
	LET cont_rec[15].cont_picture = "qx://application/image_contact/contact15_100.png"

	LET cont_rec[16].cont_id = 16
	LET cont_rec[16].cont_group_id = "Friend"     
	LET cont_rec[16].cont_title = "Mr"
	LET cont_rec[16].cont_fname = "Rogger"
	LET cont_rec[16].cont_lname = "Whitaker"
	LET cont_rec[16].cont_country = "United Kingdom"
	LET cont_rec[16].cont_phone =	"+44 89 232323"
	LET cont_rec[16].cont_mobile = "+44 157  558855"
	LET cont_rec[16].cont_fax = 		"+44 89 857674" 
	LET cont_rec[16].cont_email = "r.whitaker@t-online.de"
	LET cont_rec[16].cont_url = "www.whitaker.de"
	LET cont_rec[16].cont_dob = "06/07/1988"	
	LET cont_rec[16].cont_type = 1	
	LET cont_rec[16].cont_memo = "This is the memo field for contact 16"
	LET cont_rec[16].cont_picture = "qx://application/image_contact/contact16_100.png"

	LET cont_rec[17].cont_id = 17
	LET cont_rec[17].cont_group_id = "Business"     
	LET cont_rec[17].cont_title = "Mrs"
	LET cont_rec[17].cont_fname = "Judy"
	LET cont_rec[17].cont_lname = "Right"
	LET cont_rec[17].cont_country = "United States"
	LET cont_rec[17].cont_phone =	"+49 89 232323"
	LET cont_rec[17].cont_mobile = "+49 157  558855"
	LET cont_rec[17].cont_fax = 		"+49 89 857674" 
	LET cont_rec[17].cont_email = "j.right@t-online.de"
	LET cont_rec[17].cont_url = "www.right.de"
	LET cont_rec[17].cont_dob = "06/07/1988"	
	LET cont_rec[17].cont_type = 1	
	LET cont_rec[17].cont_memo = "This is the memo field for contact 17"
	LET cont_rec[17].cont_picture = "qx://application/image_contact/contact17_100.png"

	LET cont_rec[18].cont_id = 18
	LET cont_rec[18].cont_group_id = "Business"     
	LET cont_rec[18].cont_title = "Mrs"
	LET cont_rec[18].cont_fname = "Jane"
	LET cont_rec[18].cont_lname = "Jackson"
	LET cont_rec[18].cont_country = "United States"
	LET cont_rec[18].cont_phone =	"+1 89 232323"
	LET cont_rec[18].cont_mobile = "+1 157  558855"
	LET cont_rec[18].cont_fax = 		"+1 89 857674" 
	LET cont_rec[18].cont_email = "j.jackson@t-online.de"
	LET cont_rec[18].cont_url = "www.jackson.de"
	LET cont_rec[18].cont_dob = "06/07/1988"	
	LET cont_rec[18].cont_type = 1	
	LET cont_rec[18].cont_memo = "This is the memo field for contact 18"
	LET cont_rec[18].cont_picture = "qx://application/image_contact/contact18_100.png"

	LET cont_rec[19].cont_id = 19
	LET cont_rec[19].cont_group_id = "Friend"     
	LET cont_rec[19].cont_title = "Mr"
	LET cont_rec[19].cont_fname = "Michael"
	LET cont_rec[19].cont_lname = "Schumacher"
	LET cont_rec[19].cont_country = "Germany"
	LET cont_rec[19].cont_phone =	"+49 89 232323"
	LET cont_rec[19].cont_mobile = "+49 157  558855"
	LET cont_rec[19].cont_fax = 		"+49 89 857674" 
	LET cont_rec[19].cont_email = "m.schumacher@t-online.de"
	LET cont_rec[19].cont_url = "www.schumacher.de"
	LET cont_rec[19].cont_dob = "06/07/1988"	
	LET cont_rec[19].cont_type = 1	
	LET cont_rec[19].cont_memo = "This is the memo field for contact 19"
	LET cont_rec[19].cont_picture = "qx://application/image_contact/contact19_100.png"

	LET cont_rec[20].cont_id = 20
	LET cont_rec[20].cont_group_id = "Other"     
	LET cont_rec[20].cont_title = "Mr"
	LET cont_rec[20].cont_fname = "Damen"
	LET cont_rec[20].cont_lname = "Hill"
	LET cont_rec[20].cont_country = "United Kingdom"
	LET cont_rec[20].cont_phone =	"+49 89 232323"
	LET cont_rec[20].cont_mobile = "+49 157 558855"
	LET cont_rec[20].cont_fax = 		"+49 89 857674" 
	LET cont_rec[20].cont_email = "d.hillg@bt-online.de"
	LET cont_rec[20].cont_url = "www.hill.de"
	LET cont_rec[20].cont_dob = "06/07/1988"	
	LET cont_rec[20].cont_type = 1	
	LET cont_rec[20].cont_memo = "This is the memo field for contact 20"
	LET cont_rec[20].cont_picture = "qx://application/image_contact/contact20_100.png"

	LET cont_rec[21].cont_picture = "qx://application/image_contact/contact21_100.png"
	LET cont_rec[22].cont_picture = "qx://application/image_contact/contact22_100.png"					
	
	###############################################
	LET globalMaxContId = 20
	##############################################

	LET contGroupIdList[1] = "All"		
	LET contGroupIdList[2] = "Family"		
	LET contGroupIdList[3] = "Friend"	
	LET contGroupIdList[4] = "Business"	
	LET contGroupIdList[5] = "Other"	

	LET globalContGroupId = 1
	CALL initContactList(contGroupIdList[globalContGroupId], TRUE) --"All at start"
		 
end function



############################################################################
# FUNCTION initContactList(p_group)
#
#	Arguments
# p_group STRING  --filter by group All, or specific group
#
# RETURN
#	VOID
#
# Initialise demo app contact list array
############################################################################
FUNCTION initContactList(p_group, p_order)
	DEFINE p_group STRING  --filter by group All, or specific group
	DEFINE p_order BOOLEAN	--fname - lname or lname-fname
	DEFINE i INT,id INT
	
	LET id = 1  --array index


	#IF p_order = NULL THEN
	#	LET p_order = TRUE
	#END IF
	
	IF p_group IS NULL OR p_group = "All" THEN
		IF p_order = TRUE THEN 
			FOR i = 1 TO globalMaxContId
				LET cont_list[id].cont_name = trim(cont_rec[i].cont_lname), ", ",	cont_rec[i].cont_fname 
				LET id = ID + 1
			END FOR
		ELSE
			FOR i = 1 TO globalMaxContId
				LET cont_list[id].cont_name = trim(cont_rec[i].cont_fname), ", ",	cont_rec[i].cont_lname 
				LET id = ID + 1
			END FOR		
		END IF
	ELSE	
		IF p_order = FALSE THEN 	
			FOR i = 1 TO globalMaxContId
				IF cont_rec[i].cont_group_id = p_group  THEN
					LET cont_list[id].cont_name = trim(cont_rec[i].cont_lname), ", ", cont_rec[i].cont_fname 			
					LET id = ID + 1
				END IF			
			END FOR
		ELSE
			FOR i = 1 TO globalMaxContId
				IF cont_rec[i].cont_group_id = p_group  THEN
					LET cont_list[id].cont_name = trim(cont_rec[i].cont_fname), ", ", cont_rec[i].cont_lname 			
					LET id = ID + 1
				END IF			
			END FOR			
		END IF
	
	END IF

	
END FUNCTION	