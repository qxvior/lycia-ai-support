
DEFINE a_recDemo 
	RECORD
		a_fname,a_lname,a_address STRING,
		a_dob DATE,
		a_country CHAR(2),
		a_email STRING,
		a_salary MONEY(10,2),
		a_lycia_user BOOLEAN,
		a_gender SMALLINT,
		a_starting_time DateTime Hour to Second,
		a_comment STRING#,
		#a_history TEXT
	END RECORD

DEFINE b_recDemo
	RECORD
		b_fname,a_lname,a_address STRING,
		b_dob DATE,
		b_country CHAR(2),
		b_email STRING,
		b_salary MONEY(10,2),
		b_lycia_user BOOLEAN,
		b_gender SMALLINT,
		b_starting_time DateTime Hour to Second,
		b_comment STRING#,
		#b_history TEXT
	END RECORD
	
	DEFINE a_recNumeric
		RECORD
			a_amount_1 DEC(10,2),
			a_amount_2 DEC(10,2),
			a_amount_3 DEC(10,2),
			a_amount_4 DEC(10,2),
			a_amount_5 DEC(10,2),
			a_amount_6 DEC(10,2),
			a_amount_7 DEC(10,2),
			
			a_amount_b1 MONEY(10,2),
			a_amount_b2 MONEY(10,2),
			a_amount_b3 MONEY(10,2),
			a_amount_b4 MONEY(10,2),
			a_amount_b5 MONEY(10,2),
			a_amount_b6 MONEY(10,2),
			a_amount_b7 MONEY(10,2)
			
			
		END RECORD	

	DEFINE b_recNumeric
		RECORD
			b_amount_1 DEC(10,2),
			b_amount_2 DEC(10,2),
			b_amount_3 DEC(10,2),
			b_amount_4 DEC(10,2),
			b_amount_5 DEC(10,2),
			b_amount_6 DEC(10,2),
			b_amount_7 DEC(10,2),
			
			b_amount_b1 MONEY(10,2),
			b_amount_b2 MONEY(10,2),
			b_amount_b3 MONEY(10,2),
			b_amount_b4 MONEY(10,2),
			b_amount_b5 MONEY(10,2),
			b_amount_b6 MONEY(10,2),
			b_amount_b7 MONEY(10,2)
			
			
		END RECORD	
			
MAIN
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	OPTIONS FIELD ORDER UNCONSTRAINED
	
#	LOCATE a_recDemo.a_history IN FILE "txt/gd_text1.txt"
#	LOCATE b_recDemo.b_history IN FILE "txt/gd_text2.txt"
	
	CALL ui_init()

	OPEN WINDOW w WITH FORM "form/css_default_font"
	CALL ui.Interface.setText("Default Font")	
	CALL init_data()	



	MENU
	ON ACTION "DISPLAY"
		DISPLAY BY NAME a_recDemo.*
		DISPLAY BY NAME b_recDemo.*

		DISPLAY BY NAME a_recNumeric.*
		DISPLAY BY NAME b_recNumeric.*


	ON ACTION "INPUT"
		
		
	
	DIALOG ATTRIBUTE(UNBUFFERED)
		INPUT BY NAME a_recDemo.* WITHOUT DEFAULTS 
		END INPUT
		INPUT BY NAME b_recDemo.* WITHOUT DEFAULTS 
		END INPUT

		INPUT BY NAME a_recNumeric.* WITHOUT DEFAULTS
		END INPUT
		INPUT BY NAME b_recNumeric.* WITHOUT DEFAULTS
		END INPUT
				
		ON ACTION "ACCEPT"
			IF a_recDemo.a_fname IS NULL THEN
				ERROR "You must specify a First Name"
				NEXT FIELD a_fname
			END IF
			
			IF a_recDemo.a_fname <> "Hubert" THEN
				MESSAGE "Hubert is a much better name"
			END IF
			
			EXIT DIALOG

		ON ACTION "CANCEL"
			EXIT DIALOG


		
	END DIALOG	
	
	ON ACTION "EXIT"
		EXIT MENU
	END MENU	
	
	CLOSE WINDOW w

	
END MAIN


FUNCTION init_data()
#	LOCATE a_recDemo.a_history IN FILE "txt/gd_text1.txt"
#	LOCATE b_recDemo.b_history IN FILE "txt/gd_text2.txt"


	LET a_recDemo.a_fname = "Hubert"
	LET a_recDemo.a_lname = "Hölzl"
	LET a_recDemo.a_address = "Oktoberfest Munich"
	LET a_recDemo.a_dob = "06.02.1978"
	LET a_recDemo.a_country = "DE"
	LET a_recDemo.a_email = "h.hoelzl@info.com"
	LET a_recDemo.a_salary = "143628.68"
	LET a_recDemo.a_lycia_user = TRUE
	LET a_recDemo.a_gender = 2
	LET a_recDemo.a_starting_time = "12:12:12"
	LET a_recDemo.a_comment = "Hubert likes to go to the Oktoberfest every year to catch up on old customs and tons of fun."

	LET b_recDemo.* = a_recDemo.*

	LET a_recNumeric.a_amount_1 = 12345678.00
	LET a_recNumeric.a_amount_2 = 123.11
	LET a_recNumeric.a_amount_3 = 99999999.99
	LET a_recNumeric.a_amount_4 = 11111111.11
	LET a_recNumeric.a_amount_5 = 123456.51
	LET a_recNumeric.a_amount_6 = 12345.37
	LET a_recNumeric.a_amount_7 = 1234.12

	LET a_recNumeric.a_amount_b1 = 12345678.00
	LET a_recNumeric.a_amount_b2 = 123.11
	LET a_recNumeric.a_amount_b3 = 99999999.99
	LET a_recNumeric.a_amount_b4 = 11111111.11
	LET a_recNumeric.a_amount_b5 = 123456.51
	LET a_recNumeric.a_amount_b6 = 12345.37
	LET a_recNumeric.a_amount_b7 = 1234.12
	LET b_recNumeric.* = a_recNumeric.*

END FUNCTION