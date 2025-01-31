
#Module Scope Variables		
	DEFINE myrec OF RECORD
		sliderBarLeft SMALLINT,
		sliderBarRight SMALLINT,		
		sliderBarTop SMALLINT,		
		sliderBarBottom SMALLINT,	

		sliderBarLeftValue SMALLINT,
		sliderBarRightValue SMALLINT,		
		sliderBarTopValue SMALLINT,		
		sliderBarBottomValue SMALLINT,	
					
		scrollBarLeft SMALLINT,
		scrollBarRight SMALLINT,		
		scrollBarTop SMALLINT,		
		scrollBarBottom SMALLINT,			


		scrollBarLeftValue SMALLINT,
		scrollBarRightValue SMALLINT,		
		scrollBarTopValue SMALLINT,		
		scrollBarBottomValue SMALLINT

		
	END RECORD



FUNCTION widget_slider()
	DEFINE w_slider WINDOW
	#OPTIONS AUTOREFRESH 3

	
	#CALL fgl_setkeylabel("actExitProgram","Exit Program","qx://application/icon24/exit_w2_01_024.ico", 100, TRUE)	
	#CALL fgl_setkeylabel("CANCEL","")  --remove default accept/cancel buttons
	#CALL fgl_setkeylabel("ACCEPT","")
	#CALL InputButtonEvent(btInput)
	
	LET myrec.sliderBarLeft = 50	
	LET myrec.sliderBarRight = 50
	LET myrec.sliderBarTop = 50
	LET myrec.sliderBarBottom = 50

	LET myrec.scrollBarLeft = 50
	LET myrec.scrollBarRight = 50
	LET myrec.scrollBarTop = 50
	LET myrec.scrollBarBottom = 50
	
	CALL w_slider.openWithForm("w_slider", getFormPath("gdt_slide_scroll"), 1,1,"", "BORDER")	
	CALL fgl_settitle("Slider/ScrollBar Demno")


				
	CALL updateSliderBarLeft(myrec.sliderBarLeft)	
	CALL updateSliderBarRight(myrec.sliderBarRight)	
	CALL updateSliderBarTop(myrec.sliderBarTop)	
	CALL updateSliderBarBottom(myrec.sliderBarBottom)
				
	CALL updateScrollBarLeft(myrec.scrollBarLeft)	
	CALL updateScrollBarRight(myrec.scrollBarRight)	
	CALL updateScrollBarTop(myrec.scrollBarTop)				
	CALL updateScrollBarBottom(myrec.scrollBarBottom)	

	

	INPUT BY NAME myrec.* WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)
		BEFORE INPUT
			CALL fgl_setkeylabel("actExitProgram","Exit Program","qx://application/icon24/exit_w2_01_024.ico", 100, TRUE)	
			CALL fgl_setkeylabel("CANCEL","")  --remove default accept/cancel buttons
			CALL fgl_setkeylabel("ACCEPT","")		
				
		ON ACTION actExitProgram
			EXIT INPUT
					
	 	ON CHANGE sliderBarLeft
			CALL updateSliderBarLeft(myrec.sliderBarLeft)	

	 	ON CHANGE sliderBarLeftValue
 			CALL updateSliderBarLeft(myrec.sliderBarLeftValue)	

	 		
	 	ON CHANGE sliderBarRight
			CALL updateSliderBarRight(myrec.sliderBarRight)	

	 	ON CHANGE sliderBarRightValue
 			CALL updateSliderBarRight(myrec.sliderBarRightValue)	
		
	 		
	 	ON CHANGE sliderBarTop
			CALL updateSliderBarTop(myrec.sliderBarTop)	

	 	ON CHANGE sliderBarTopValue
 			CALL updateSliderBarTop(myrec.sliderBarTopValue)	

	 		
	 	ON CHANGE sliderBarBottom
			CALL updateSliderBarBottom(myrec.sliderBarBottom)	

	 	ON CHANGE sliderBarBottomValue
 			CALL updateSliderBarBottom(myrec.sliderBarBottomValue)	

		#ScrollBar	 	####################	

		#LEFT
	 	ON CHANGE scrollBarLeft
			CALL updateScrollBarLeft(myrec.scrollBarLeft)	

	 	ON CHANGE scrollBarLeftValue
 			CALL updateScrollBarLeft(myrec.scrollBarLeftValue)	
 			

		#Right
	 	ON CHANGE scrollBarRight
			CALL updateScrollBarRight(myrec.scrollBarRight)	

	 	ON CHANGE scrollBarRightValue
 			CALL updateScrollBarRight(myrec.scrollBarRightValue)	


		#Top
	 	ON CHANGE scrollBarTop
			CALL updateScrollBarTop(myrec.scrollBarTop)	

	 	ON CHANGE scrollBarTopValue
 			CALL updateScrollBarTop(myrec.scrollBarTopValue)	


		#Bottom
	 	ON CHANGE scrollBarBottom
			CALL updateScrollBarBottom(myrec.scrollBarBottom)	

	 	ON CHANGE scrollBarBottomValue
 			CALL updateScrollBarBottom(myrec.scrollBarBottomValue)	
 		
 		ON CHANGE testField
 			CALL fgl_winmessage("change text","change text","info")	

	 END INPUT

	CALL w_slider.close()

END FUNCTION

###########################################################
# FUNCTION updateSliderBarLeft(value)
#
# Arguments:
# value SMALLINT  --slider value
#
# Return: void
###########################################################
FUNCTION updateSliderBarLeft(value)
	DEFINE value SMALLINT  --slider value
	
	LET myrec.sliderBarLeft = value
	LET myrec.sliderBarLeftValue = value	
	#LET myrec.progressBar_1_Left = value
	#LET myrec.progressBar_1_LeftValue = value
				
	DISPLAY value TO sliderBarLeftValue
	DISPLAY value TO progressBar_1_Left
	DISPLAY value TO progressBar_1_LeftValue
 	
		
END FUNCTION



FUNCTION updateSliderBarRight(value)
	DEFINE value SMALLINT
	
	LET myrec.sliderBarRight = value
	LET myrec.sliderBarRightValue = value
		
	DISPLAY value TO sliderBarRightValue
	DISPLAY value TO progressBar_1_Right
	DISPLAY value TO progressBar_1_RightValue
	
		
END FUNCTION


FUNCTION updateSliderBarTop(value)
	DEFINE value SMALLINT
	
	LET myrec.sliderBarTop = value
	LET myrec.sliderBarTopValue = value	
		
	#DISPLAY value TO sliderBarTopValue
	DISPLAY value TO progressBar_1_Top
	DISPLAY value TO progressBar_1_TopValue
	
		
END FUNCTION


FUNCTION updateSliderBarBottom(value)
	DEFINE value SMALLINT
	
	LET myrec.sliderBarBottom = value
	LET myrec.sliderBarBottomValue = value
		
	DISPLAY value TO sliderBarBottomValue
	DISPLAY value TO progressBar_1_Bottom
	DISPLAY value TO progressBar_1_BottomValue
		
END FUNCTION


######### ScrollBar Event Section #####################################################
FUNCTION updateScrollBarLeft(value)
	DEFINE value SMALLINT
	
	LET myrec.scrollBarLeft = value
	LET myrec.scrollBarLeftValue = value
		
	DISPLAY value TO scrollBarLeftValue
	DISPLAY value TO progressBar_2_Left
	DISPLAY value TO progressBar_2_LeftValue
		
END FUNCTION



FUNCTION updateScrollBarRight(value)
	DEFINE value SMALLINT
	
	LET myrec.scrollBarRight = value
	LET myrec.scrollBarRightValue = value
		
	DISPLAY value TO scrollBarRightValue
	DISPLAY value TO progressBar_2_Right
	DISPLAY value TO progressBar_2_RightValue
	
		
END FUNCTION



FUNCTION updateScrollBarTop(value)
	DEFINE value SMALLINT
	
	LET myrec.scrollBarTop = value
	LET myrec.scrollBarTopValue = value	
		
	DISPLAY value TO scrollBarTopValue
	DISPLAY value TO progressBar_2_Top
	DISPLAY value TO progressBar_2_TopValue
		
END FUNCTION



FUNCTION updateScrollBarBottom(value)
	DEFINE value SMALLINT
	
	LET myrec.scrollBarBottom = value
	LET myrec.scrollBarBottomValue = value	
		
	DISPLAY value TO scrollBarBottomValue
	DISPLAY value TO progressBar_2_Bottom
	DISPLAY value TO progressBar_2_BottomValue
		
END FUNCTION