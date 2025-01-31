main
define imagePath,imagePath2,imagePath3,imagePath4,imagePath5, url,url2,url3,url4,url5 string

	OPTIONS INPUT WRAP
	
	CALL ui_init()

	OPEN WINDOW wIconViewer WITH FORM "form/z_icon_viewer"
	CALL ui.Interface.setText("Gridpanel")

	input by name imagePath,imagePath2,imagePath3,imagePath4,imagePath5 without defaults ATTRIBUTES(UNBUFFERED)
		ON CHANGE imagePath,imagePath2,imagePath3,imagePath4,imagePath5
			LET url  = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath)
			LET url2 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath2)
			LET url3 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath3)
			LET url4 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath4)
			LET url5 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath5)						
			DISPLAY url TO btImage
			DISPLAY url TO lbImage
			DISPLAY url2 TO btImage2
			DISPLAY url2 TO lbImage2
			DISPLAY url3 TO btImage3
			DISPLAY url3 TO lbImage3	
			DISPLAY url4 TO btImage4
			DISPLAY url4 TO lbImage4	
			DISPLAY url5 TO btImage5
			DISPLAY url5 TO lbImage5	
						
		ON ACTION actRefresh
			LET url  = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath)
			LET url2 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath2)
			LET url3 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath3)
			LET url4 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath4)
			LET url5 = "{CONTEXT}/public/querix/icon/svg/24/", trim(imagePath5)						
			DISPLAY url TO btImage
			DISPLAY url TO lbImage
			DISPLAY url2 TO btImage2
			DISPLAY url2 TO lbImage2
			DISPLAY url3 TO btImage3
			DISPLAY url3 TO lbImage3	
			DISPLAY url4 TO btImage4
			DISPLAY url4 TO lbImage4	
			DISPLAY url5 TO btImage5
			DISPLAY url5 TO lbImage5									
	end input
end main