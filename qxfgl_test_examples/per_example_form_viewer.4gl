##############################################################################################
# MAIN
#
#
##############################################################################################
MAIN
	DEFINE formName,formNamePath STRING
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	WHILE TRUE
		OPEN WINDOW wChooseForm WITH FORM "form/per_example_form_viewer" ATTRIBUTE(BORDER)

		INPUT BY NAME formName WITHOUT DEFAULTS
			ON ACTION "ViewForm"
				EXIT INPUT
		END INPUT
	
		IF int_flag THEN
			EXIT PROGRAM
		END IF
			
		CLOSE WINDOW wChooseForm
	
		LET formNamePath = "per/", trim(formName)
		OPEN WINDOW wForm WITH FORM formNamePath
		CALL form_interaction(formName)

		CLOSE WINDOW wForm	

	END WHILE
	
END MAIN
##############################################################################################
# END MAIN
##############################################################################################

##############################################################################################
# FUNCTION form_interaction(p_formName)
#
#
##############################################################################################
FUNCTION form_interaction(p_formName)
	DEFINE p_formName STRING
	
	CASE p_formName
	
		WHEN "per_bab_f001_m0n"
			CALL per_bab_f001_m0n()
		WHEN "per_bab_k197_3"
			CALL per_bab_k197_3()	
		OTHERWISE
	
			MENU
				ON ACTION "Exit"
					EXIT MENU
			END MENU
			
	END CASE

END FUNCTION
##############################################################################################
# END FUNCTION form_interaction(p_formName)
##############################################################################################


##############################################################################################
# FUNCTION per_bab_k197_3()
#
#
##############################################################################################
FUNCTION per_bab_k197_3()
	DEFINE i SMALLINT
	DEFINE arr_rec_s_ks DYNAMIC ARRAY OF
		RECORD
			kst_nr integer,
			bab_z integer,
			betrag decimal(6,2),
			sh CHAR,
			beleg INT,
			l_dat DATE,
			btex STRING,
			buch_kz STRING
		END RECORD

	DEFINE rec_summary 
		RECORD
			k_tsa  decimal(6,2),
			k_sash CHAR,
			k_tso decimal(6,2),
			k_tha decimal(6,2)
		END RECORD

	LET rec_summary.k_tsa = 1111.11
	LET rec_summary.k_sash = "H"
	LET rec_summary.k_tso = 1111.11
	LET rec_summary.k_tha = 1111.11
	

	LET i = 0
	LET i = i + 1
	LET arr_rec_s_ks[i].kst_nr = 1001
	LET arr_rec_s_ks[i].bab_z = 2001
	LET arr_rec_s_ks[i].betrag = 1001.85
	LET arr_rec_s_ks[i].sh = "H"
	LET arr_rec_s_ks[i].beleg = 3001
	LET arr_rec_s_ks[i].l_dat = "12/12/2021"
	LET arr_rec_s_ks[i].btex = trim(i), " - Beleg Example Text - ", trim(i)
	LET arr_rec_s_ks[i].buch_kz = "H"
	LET i = i + 1
	FOR i = i TO 100
		LET arr_rec_s_ks[i].kst_nr = arr_rec_s_ks[i-1].kst_nr +1
		LET arr_rec_s_ks[i].bab_z = arr_rec_s_ks[i-1].bab_z +1
		LET arr_rec_s_ks[i].betrag = 1001.85
		IF arr_rec_s_ks[i-1].sh = "H" THEN
			LET arr_rec_s_ks[i].sh = "S"
		ELSE
			LET arr_rec_s_ks[i].sh = "H"
		END IF
		LET arr_rec_s_ks[i].beleg = arr_rec_s_ks[i-1].beleg +1
		LET arr_rec_s_ks[i].l_dat = arr_rec_s_ks[i-1].l_dat + 1
		LET arr_rec_s_ks[i].btex = trim(i), " - Beleg Example Text - ", trim(i)
		LET arr_rec_s_ks[i].buch_kz = "H"
	END FOR

	DISPLAY BY NAME rec_summary.* #all read only fields
	
	DISPLAY ARRAY arr_rec_s_ks TO s_ks.*
	

END FUNCTION
##############################################################################################
# END FUNCTION per_bab_k197_3()
##############################################################################################


##############################################################################################
# FUNCTION per_bab_f001_m0n()
#
#
##############################################################################################
FUNCTION per_bab_f001_m0n()
	DEFINE rec 
		RECORD
			ags CHAR(8),
			agsbez STRING,
			reformgrp SMALLINT,
			reformtext STRING,
			masken_kopf STRING,
			bera STRING,
			finr STRING,
			kurzname STRING,
			anr_schl STRING,
			lkz STRING,
			name_1 STRING,
			name_2 STRING,
			strasse STRING,
			hausnr STRING,
			hausnrzu STRING,
			adrzus STRING,
			plz STRING,
			ort STRING,
			telefon STRING,
			telex STRING,
			telefax STRING,
			hra_nr INT,
			email STRING,
			glaeubiger_id STRING,
			land_pers CHAR,
			url STRING,
			fiamt_nr STRING,
			fiamt_lohn STRING,
			stnr_ust STRING,
			stnr_lohn STRING,
			l_blust SMALLINT,
			l_bllohn SMALLINT,
			betr_nr SMALLINT,
			l_blz1 STRING,
			l_kto1 STRING,
			l_blz2 STRING,
			l_kto2 STRING,
			l_blz3 STRING,
			l_kto3 STRING,
			l_blz4 STRING,
			l_kto4 STRING,
			l_blz5 STRING,
			l_kto5 STRING,
			l_bankname1 STRING,
			l_bankname2 STRING,
			l_bankname3 STRING,
			l_bankname4 STRING,
			l_bankname5 STRING,
			l_bic1 STRING,
			l_bic2 STRING,
			l_bic3 STRING,
			l_bic4 STRING,
			l_bic5 STRING,
			l_iban1 STRING,
			l_iban2 STRING,
			l_iban3 STRING,
			l_iban4 STRING,
			l_iban5 STRING,
			stad_ust CHAR,
			stad_lst CHAR
			
			
		END RECORD



	LET rec.ags = "12345678"
	LET rec.agsbez = "agsbez"
	LET rec.reformgrp = 2
	LET rec.reformtext = "Reformtext"
	LET rec.masken_kopf = "This is the masken_kopf string"
	LET rec.bera = "Berater"
	LET rec.finr = "The finr"
	LET rec.kurzname = "Kurzname"
	LET rec.anr_schl = "anr_schl"
	LET rec.lkz = "lkz"
	LET rec.name_1 = "Hubert"
	LET rec.name_2 = "Hölzl"
	LET rec.strasse = "Ahornweg"
	LET rec.hausnr = "2"
	LET rec.hausnrzu = "Obergeschoß"
	LET rec.adrzus = "Neufinsing"
	LET rec.plz = "85464"
	LET rec.ort = "Finsing"
	LET rec.telefon = "089 415612123"
	LET rec.telex   = "089 2342ff352"
	LET rec.telefax = "089 2342ff355"
	LET rec.hra_nr = 5666666675467
	LET rec.email = "hubert@supernova.de"
	LET rec.glaeubiger_id = "HH-12442-12"
	LET rec.land_pers = "J"
	LET rec.url = "www.supernova.de"
	LET rec.fiamt_nr = "ED-DESR1244"
	LET rec.fiamt_lohn = "FIA_LOHN-142"
	LET rec.stnr_ust = "DE98232-1243"
	LET rec.stnr_lohn = "DELOHN-234"
	LET rec.l_blust = 1
	LET rec.l_bllohn = 2
	LET rec.betr_nr = 0
	LET rec.l_blz1 = "700 519 95"
	LET rec.l_kto1 = "0010174619"
	LET rec.l_blz2 = "700 519 96"
	LET rec.l_kto2 = "0010174629"
	LET rec.l_blz3 = "700 519 97"
	LET rec.l_kto3 = "0010174639"
	LET rec.l_blz4 = "700 519 98"
	LET rec.l_kto4 = "0010174649"
	LET rec.l_blz5 = "700 519 99"
	LET rec.l_kto5 = "0010174659"
	
	LET rec.l_bankname1 = "Sparkasse Erding-Dorfen"
	LET rec.l_bankname2 = "Volksbank Erding-Dorfen"
	LET rec.l_bankname3 = "Raifeisenbank Erding-Dorfen"
	LET rec.l_bankname4 = "Comerzbank Erding-Dorfen"
	LET rec.l_bankname5 = "Hypovereinsbank Erding-Dorfen"
	
	LET rec.l_bic1 = "ABYLADEM1ERD"
	LET rec.l_bic2 = "BBYLADEM1ERD"
	LET rec.l_bic3 = "CBYLADEM1ERD"
	LET rec.l_bic4 = "DBYLADEM1ERD"
	LET rec.l_bic5 = "EBYLADEM1ERD"
	

	LET rec.l_iban1 = "DE74 7004 1945 0010 1757 11"
	LET rec.l_iban2 = "DE75 7004 1945 0010 1757 11"
	LET rec.l_iban3 = "DE76 7004 1945 0010 1757 11"
	LET rec.l_iban4 = "DE77 7004 1945 0010 1757 11"
	LET rec.l_iban5 = "DE78 7004 1945 0010 1757 11"

	LET rec.stad_ust = "Y"
	LET rec.stad_lst = "Y"
	#LET rec.xxxxxxxxxxxxxxxxxx = "xxxxxxxxxxx"
	#LET rec.xxxxxxxxxxxxxxxxxx = "xxxxxxxxxxx"
	#LET rec.xxxxxxxxxxxxxxxxxx = "xxxxxxxxxxx"
	#LET rec.xxxxxxxxxxxxxxxxxx = "xxxxxxxxxxx"
	#LET rec.xxxxxxxxxxxxxxxxxx = "xxxxxxxxxxx"

{

po001 = formonly.po_name_1,      DEFAULT = 0;
po002 = formonly.po_name_2,      DEFAULT = 0;
po003 = formonly.po_strasse,     DEFAULT = 0;
pohnr  = formonly.po_hausnr;
pohnrz = formonly.po_hausnrzu;
po003a= formonly.po_adrzus;
po004 = formonly.po_plz,         DEFAULT = 0;
po005 = formonly.po_ort,         DEFAULT = 0;
pr006 = formonly.pv_name_1,      DEFAULT = 0;
pr007 = formonly.pv_name_2,      DEFAULT = 0;
pr008 = formonly.pv_strasse,     DEFAULT = 0;
pvhnr  = formonly.pv_hausnr;
pvhnrz = formonly.pv_hausnrzu;
pr008a= formonly.pv_adrzus;
pr009 = formonly.pv_plz,         DEFAULT = 0;
pr010 = formonly.pv_ort,         DEFAULT = 0;
pr11 = formonly.pv_est,          DEFAULT = 0;
pr12 = formonly.pv_fiamt,        DEFAULT = 0;
}
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME rec.*

		ON ACTION "EDIT"
			INPUT BY NAME rec.* WITHOUT DEFAULTS
			END INPUT
		ON ACTION "Exit"
			EXIT MENU
	END MENU

END FUNCTION	
##############################################################################################
# END FUNCTION per_bab_f001_m0n()
##############################################################################################