################################################################################
# Module Scope Variables
################################################################################
DEFINE myRec 
	RECORD
		f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20 STRING,
		f1n,f2n,f3n,f4n,f5n,f6n,f7n,f8n,f9n,f10n,f11n,f12n,f13n,f14n,f15n,f16n,f17n,f18n,f19n,f20n DECIMAL (10,2),
		f1m,f2m,f3m,f4m,f5m,f6m,f7m,f8m,f9m,f10m,f11m,f12m,f13m,f14m,f15m,f16m,f17m,f18m,f19m,f20m MONEY,
		f1d,f2d,f3d,f4d,f5d,f6d,f7d,f8d,f9d,f10d,f11d,f12d,f13d,f14d,f15d,f16d,f17d,f18d,f19d,f20d DATE
	END RECORD

DEFINE myLabelRec 
	RECORD
		lbFont01,lbFont02,lbFont03,lbFont04,lbFont05,lbFont06,lbFont07,lbFont08,lbFont09,lbFont10,lbFont11,lbFont12,lbFont13,lbFont14,lbFont15,lbFont16,lbFont17,lbFont18,lbFont19,lbFont20 STRING,
		cbTP01,cbTP02,cbTP03,cbTP04,cbTP05,cbTP06,cbTP07,cbTP08,cbTP09,cbTP10,cbTP11,cbTP12,cbTP13,cbTP14,cbTP15,cbTP16,cbTP17,cbTP18,cbTP19,cbTP20 SMALLINT,
		cbNP01,cbNP02,cbNP03,cbNP04,cbNP05,cbNP06,cbNP07,cbNP08,cbNP09,cbNP10,cbNP11,cbNP12,cbNP13,cbNP14,cbNP15,cbNP16,cbNP17,cbNP18,cbNP19,cbNP20 SMALLINT,
		cbWF01,cbWF02,cbWF03,cbWF04,cbWF05,cbWF06,cbWF07,cbWF08,cbWF09,cbWF10,cbWF11,cbWF12,cbWF13,cbWF14,cbWF15,cbWF16,cbWF17,cbWF18,cbWF19,cbWF20 SMALLINT
			
	END RECORD
	
DEFINE modu_rec_preview 
	RECORD
		preview_font_family STRING,
		preview_ft1,preview_ft2,preview_ft3 STRING,
		preview_f1,preview_f2,preview_f3,preview_f4,preview_f5,preview_f6  DECIMAL (14,4)
	END RECORD

DEFINE modu_arr_font_class DYNAMIC ARRAY OF STRING

DEFINE modu_arr_rec_font_family DYNAMIC ARRAY OF RECORD
	fontName STRING, 
	textMono BOOLEAN,
	numericMono BOOLEAN,
	webFont BOOLEAN
	END RECORD


################################################################################
# MAIN
#
#
################################################################################
MAIN
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL ui_init()
	
	OPEN WINDOW mywin WITH FORM "form/css_font_viewer"
	CALL ui.Interface.setText("CSS-Font")	
	
	CALL initRecord()
	DISPLAY BY NAME myLabelRec.*
	
	CALL updateClass(1)

	DIALOG ATTRIBUTE(UNBUFFERED)
		INPUT BY NAME myRec.* WITHOUT DEFAULTS
			on action font01
							NEXT FIELD F1
			on action font02
							NEXT FIELD F2
			on action font03
							NEXT FIELD F3
			on action font04
							NEXT FIELD F4
			on action font05
							NEXT FIELD F5
			on action font06
							NEXT FIELD F6
			on action font07
							NEXT FIELD F7
			on action font08
							NEXT FIELD F8
			on action font09
							NEXT FIELD F9
			on action font10
							NEXT FIELD F10
							
			on action font11
							NEXT FIELD F11
			on action font12
							NEXT FIELD F12
			on action font13
							NEXT FIELD F13
			on action font14
							NEXT FIELD F14
			on action font15
							NEXT FIELD F15
			on action font16
							NEXT FIELD F16
			on action font17
							NEXT FIELD F17
			on action font18
							NEXT FIELD F18
			on action font19
							NEXT FIELD F19
			on action font20
							NEXT FIELD F20
							
			
			BEFORE FIELD f1,f1n,f1m,f1d
				CALL updateClass(1)
			BEFORE FIELD f2,f2,f2m,f2d
				CALL updateClass(2)
			BEFORE FIELD f3,f3n,f3m,f3d
				CALL updateClass(3)
			BEFORE FIELD f4,f4n,f4m,f4d
				CALL updateClass(4)
			BEFORE FIELD f5,f5n,f5m,f5d
				CALL updateClass(5)
			BEFORE FIELD f6,f6n,f6m,f6d
				CALL updateClass(6)
			BEFORE FIELD f7,f7n,f7m,f7d
				CALL updateClass(7)
			BEFORE FIELD f8,f8n,f8m,f8d
				CALL updateClass(8)
			BEFORE FIELD f9,f9n,f9m,f9d
				CALL updateClass(9)
			BEFORE FIELD f10,f10n,f10m,f10d
				CALL updateClass(10)
			BEFORE FIELD f11,f11n,f11m,f11d
				CALL updateClass(11)
			BEFORE FIELD f12,f12n,f12m,f12d
				CALL updateClass(12)
			BEFORE FIELD f13,f13n,f13m,f13d
				CALL updateClass(13)
			BEFORE FIELD f14,f14n,f14m,f14d
				CALL updateClass(14)
			BEFORE FIELD f15,f15n,f15m,f15d
				CALL updateClass(15)
			BEFORE FIELD f16,f16n,f16m,f16d
				CALL updateClass(16)
			BEFORE FIELD f17,f17n,f17m,f17d
				CALL updateClass(17)
			BEFORE FIELD f18,f18n,f18m,f18d
				CALL updateClass(18)
			BEFORE FIELD f19,f19n,f19m,f19d
				CALL updateClass(19)
			BEFORE FIELD f20,f20n,f20m,f20d
				CALL updateClass(20)	
		
		END INPUT
			INPUT BY NAME modu_rec_preview.*  WITHOUT DEFAULTS	
		END INPUT
		
		ON ACTION "CANCEL"
			EXIT DIALOG

	END DIALOG

END MAIN

#########################################################################
# FUNCTION updateClass(classId)
#########################################################################
FUNCTION updateClass(classId)
	DEFINE classId SMALLINT
	DEFINE preview_font_family, preview_ft1, preview_ft2, preview_ft3 ui.TextField
	DEFINE preview_f1,preview_f2,preview_f3,preview_f4,preview_f5,preview_f6 ui.TextField
	
	LET modu_rec_preview.preview_font_family = modu_arr_rec_font_family[classId].fontName 
	DISPLAY modu_arr_rec_font_family[classId].fontName  TO preview_font_family
	
	LET preview_font_family = ui.TextField.ForName("preview_font_family") 	
	LET preview_ft1 = ui.TextField.ForName("preview_ft1")
	LET preview_ft2 = ui.TextField.ForName("preview_ft2")
	LET preview_ft3 = ui.TextField.ForName("preview_ft3")
	
	LET preview_f1 = ui.TextField.ForName("preview_f1")
	LET preview_f2 = ui.TextField.ForName("preview_f2")
	LET preview_f3 = ui.TextField.ForName("preview_f3")
	LET preview_f4 = ui.TextField.ForName("preview_f4")
	LET preview_f5 = ui.TextField.ForName("preview_f5")
	LET preview_f6 = ui.TextField.ForName("preview_f6")
	
 #DISPLAY "BEFORE"
 #DISPLAY "With preview_ft1, classNames=", preview_ft1.getClassNames()
 #DISPLAY "With preview_ft2, classNames=", preview_ft2.getClassNames()
 #DISPLAY "With preview_ft3, classNames=", preview_ft3.getClassNames()
 	
	CALL preview_font_family.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_ft1.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_ft2.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_ft3.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_f1.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_f2.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_f3.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_f4.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_f5.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	CALL preview_f6.setClassNames(["fcls_data_widget", "qx-c-fcls_align_left","qx-c-fcls_length_20qch","qx-c-ActiveField", modu_arr_font_class[classId]])
	
	
 #DISPLAY "AFTER"
 #DISPLAY "With preview_ft1, classNames=", preview_ft1.getClassNames()
 #DISPLAY "With preview_ft2, classNames=", preview_ft2.getClassNames()
 #DISPLAY "With preview_ft3, classNames=", preview_ft3.getClassNames()

END FUNCTION


#########################################################################
# FUNCTION initRecord()
#########################################################################
FUNCTION initRecord()
	DEFINE i SMALLINT
#HuHo changed 24.11.2020 - Victor O. has changed how classes arguments work...
	LET modu_arr_font_class[1]  = "qx-c-fcls_font_01"
	LET modu_arr_font_class[2]  = "qx-c-fcls_font_02"
	LET modu_arr_font_class[3]  = "qx-c-fcls_font_03"
	LET modu_arr_font_class[4]  = "qx-c-fcls_font_04"
	LET modu_arr_font_class[5]  = "qx-c-fcls_font_05"
	LET modu_arr_font_class[6]  = "qx-c-fcls_font_06"
	LET modu_arr_font_class[7]  = "qx-c-fcls_font_07"
	LET modu_arr_font_class[8]  = "qx-c-fcls_font_08"
	LET modu_arr_font_class[9]  = "qx-c-fcls_font_09"
	LET modu_arr_font_class[10] = "qx-c-fcls_font_10"
	LET modu_arr_font_class[11] = "qx-c-fcls_font_11"
	LET modu_arr_font_class[12] = "qx-c-fcls_font_12"
	LET modu_arr_font_class[13] = "qx-c-fcls_font_13"
	LET modu_arr_font_class[14] = "qx-c-fcls_font_14"
	LET modu_arr_font_class[15] = "qx-c-fcls_font_15"
	LET modu_arr_font_class[16] = "qx-c-fcls_font_16"
	LET modu_arr_font_class[17] = "qx-c-fcls_font_17"
	LET modu_arr_font_class[18] = "qx-c-fcls_font_18"
	LET modu_arr_font_class[19] = "qx-c-fcls_font_19"
	LET modu_arr_font_class[20] = "qx-c-fcls_font_20"
{
	LET modu_arr_font_class[1]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_01"
	LET modu_arr_font_class[2]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_02"
	LET modu_arr_font_class[3]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_03"
	LET modu_arr_font_class[4]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_04"
	LET modu_arr_font_class[5]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_05"
	LET modu_arr_font_class[6]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_06"
	LET modu_arr_font_class[7]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_07"
	LET modu_arr_font_class[8]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_08"
	LET modu_arr_font_class[9]  = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_09"
	LET modu_arr_font_class[10] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_10"
	LET modu_arr_font_class[11] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_11"
	LET modu_arr_font_class[12] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_12"
	LET modu_arr_font_class[13] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_13"
	LET modu_arr_font_class[14] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_14"
	LET modu_arr_font_class[15] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_15"
	LET modu_arr_font_class[16] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_16"
	LET modu_arr_font_class[17] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_17"
	LET modu_arr_font_class[18] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_18"
	LET modu_arr_font_class[19] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_19"
	LET modu_arr_font_class[20] = "fcls_data_widget qx-c-fcls_align_left qx-c-fcls_length_20qch qx-c-ActiveField qx-c-fcls_font_20"

}	
	LET modu_rec_preview.preview_ft1 = "iiiiiiiiiiiiiiiiiiii"
	LET modu_rec_preview.preview_ft2 = "QQQQQQQQQQQQQQQQQQQQ"
	LET modu_rec_preview.preview_ft3 = "abcdefghijABCDEFGHIJ"

	LET modu_rec_preview.preview_f1 = 1111111111.1111
	LET modu_rec_preview.preview_f2 = 9000000000.0001
	LET modu_rec_preview.preview_f3 = 1234567890.1234
	LET modu_rec_preview.preview_f4 = -1111111111.1111
	LET modu_rec_preview.preview_f5 = -9000000000.0001
	LET modu_rec_preview.preview_f6 = -1234567890.1234


						
	LET myRec.f1 ="Test for field F1 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f2 ="Test for field F2 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f3 ="Test for field F3 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f4 ="Test for field F4 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f5 ="Test for field F5 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f6 ="Test for field F6 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f7 ="Test for field F7 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f8 ="Test for field F8 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f9 ="Test for field F9 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f10 ="Test for field F10 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f11 ="Test for field F11 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f12 ="Test for field F12 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f13 ="Test for field F13 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f14 ="Test for field F14 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f15 ="Test for field F15 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f16 ="Test for field F16 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f17 ="Test for field F17 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f18 ="Test for field F18 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f19 ="Test for field F19 - 12345678901234567890 äöüÄÖÜß€&%$§?"
	LET myRec.f20 ="Test for field F20 - 12345678901234567890 äöüÄÖÜß€&%$§?"

	LET myRec.f1n = 12345678.10
	LET myRec.f2n = 12345678.10
	LET myRec.f3n = 12345678.10
	LET myRec.f4n = 12345678.10
	LET myRec.f5n = 12345678.10
	LET myRec.f6n = 12345678.10
	LET myRec.f7n = 12345678.10
	LET myRec.f8n = 12345678.10
	LET myRec.f9n = 12345678.10
	LET myRec.f10n = 12345678.10
	LET myRec.f11n = 12345678.10
	LET myRec.f12n = 12345678.10
	LET myRec.f13n = 12345678.10
	LET myRec.f14n = 12345678.10
	LET myRec.f15n = 12345678.10
	LET myRec.f16n = 12345678.10
	LET myRec.f17n = 12345678.10
	LET myRec.f18n = 12345678.10
	LET myRec.f19n = 12345678.10
	LET myRec.f20n = 12345678.10

	LET myRec.f1m = 12345678.10
	LET myRec.f2m = 12345678.10
	LET myRec.f3m = 12345678.10
	LET myRec.f4m = 12345678.10
	LET myRec.f5m = 12345678.10
	LET myRec.f6m = 12345678.10
	LET myRec.f7m = 12345678.10
	LET myRec.f8m = 12345678.10
	LET myRec.f9m = 12345678.10
	LET myRec.f10m = 12345678.10
	LET myRec.f11m = 12345678.10
	LET myRec.f12m = 12345678.10
	LET myRec.f13m = 12345678.10
	LET myRec.f14m = 12345678.10
	LET myRec.f15m = 12345678.10
	LET myRec.f16m = 12345678.10
	LET myRec.f17m = 12345678.10
	LET myRec.f18m = 12345678.10
	LET myRec.f19m = 12345678.10
	LET myRec.f20m = 12345678.10

	LET myRec.f1d = "10/10/2123"
	LET myRec.f2d = "10/10/2123"
	LET myRec.f3d = "10/10/2123"
	LET myRec.f4d = "10/10/2123"
	LET myRec.f5d = "10/10/2123"
	LET myRec.f6d = "10/10/2123"
	LET myRec.f7d = "10/10/2123"
	LET myRec.f8d = "10/10/2123"
	LET myRec.f9d = "10/10/2123"
	LET myRec.f10d = "10/10/2123"
	LET myRec.f11d = "10/10/2123"
	LET myRec.f12d = "10/10/2123"
	LET myRec.f13d = "10/10/2123"
	LET myRec.f14d = "10/10/2123"
	LET myRec.f15d = "10/10/2123"
	LET myRec.f16d = "10/10/2123"
	LET myRec.f17d = "10/10/2123"
	LET myRec.f18d = "10/10/2123"
	LET myRec.f19d = "10/10/2123"
	LET myRec.f20d = "10/10/2123"
	
	LET i = 1
	LET modu_arr_rec_font_family[i].fontName = "Montserrat" 
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont01 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP01 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP01 	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF01		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Noto Sans"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont02 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP02 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP02 	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF02		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Helvetica Neue"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = FALSE

	LET myLabelRec.lbFont03 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP03 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP03	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF03		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Sans-Serif"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = TRUE
		
	LET myLabelRec.lbFont04 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP04 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP04	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF04		= modu_arr_rec_font_family[i].webFont
	
	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Roboto Mono"
	LET modu_arr_rec_font_family[i].textMono = TRUE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE
	
	LET myLabelRec.lbFont05 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP05 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP05	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF05		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Droid Sans Mono"
	LET modu_arr_rec_font_family[i].textMono = TRUE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont06 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP06 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP06	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF06		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Space Mono"
	LET modu_arr_rec_font_family[i].textMono = TRUE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont07 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP07 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP07	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF07		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Monospace"
	LET modu_arr_rec_font_family[i].textMono = TRUE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont08 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP08 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP08	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF08		= modu_arr_rec_font_family[i].webFont
	
	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Open Sans"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont09 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP09 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP09	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF09		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Fira Sans"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont10 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP10 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP10	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF10		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Josefin Sans"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont11 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP11 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP11	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF11		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Open Sans Condensed"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont12 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP12 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP12	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF12		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Roboto"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont13 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP13 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP13	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF13		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Lato"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE
	
	LET myLabelRec.lbFont14 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP14 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP14	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF14		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Roboto Condensed"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE
	
	LET myLabelRec.lbFont15 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP15 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP15	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF15		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Raleway"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont16 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP16 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP16	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF16		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Droid Sans"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE

	LET myLabelRec.lbFont17 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP17 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP17	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF17		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Ubuntu"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE
	
	LET myLabelRec.lbFont18 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP18 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP18	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF18		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Arimo"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = FALSE
	LET modu_arr_rec_font_family[i].webFont = TRUE
		
	LET myLabelRec.lbFont19 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP19 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP19	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF19		= modu_arr_rec_font_family[i].webFont

	LET i = i+1
	LET modu_arr_rec_font_family[i].fontName = "Abel"
	LET modu_arr_rec_font_family[i].textMono = FALSE
	LET modu_arr_rec_font_family[i].numericMono = TRUE
	LET modu_arr_rec_font_family[i].webFont = TRUE
		
	LET myLabelRec.lbFont20 = modu_arr_rec_font_family[i].fontName
	LET myLabelRec.cbTP20 	= modu_arr_rec_font_family[i].textMono 
	LET myLabelRec.cbNP20	= modu_arr_rec_font_family[i].numericMono
	LET myLabelRec.cbWF20		= modu_arr_rec_font_family[i].webFont
		
END FUNCTION

