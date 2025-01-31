################################################################################
# Module Scope
################################################################################
DEFINE myRec 
	RECORD
		f1,f2,f3,f4,f5,f6,f7,f8,f9,f10 STRING,
		f11,f12,f13,f14,f15,f16,f17,f18,f19,f20 STRING,
		f21,f22,f23,f24,f25,f26,f27,f28,f29,f30 STRING,
		f31,f32,f33,f34,f35,f36,f37,f38,f39,f40 STRING,
		f41,f42,f43,f44,f45,f46,f47,f48,f49,f50 STRING,
		f51,f52,f53,f54,f55,f56,f57,f58,f59,f60 STRING,
		f61,f62,f63,f64,f65,f66,f67,f68,f69,f70 STRING
		
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
	
	CALL initData()
	
	
	MENU 
		ON ACTION "PASSWORD"
			OPEN WINDOW mywin WITH FORM "per/per_attributes_password" 
			CALL ui.Interface.setText("PER Password")
			CALL form_handler()
			CLOSE WINDOW mywin			
			
		ON ACTION "NOENTRY"
			OPEN WINDOW mywin WITH FORM "per/per_attributes_noentry" 
			CALL ui.Interface.setText("PER Noentry")		
			CALL form_handler()
			CLOSE WINDOW mywin			

		ON ACTION "Exit"
			EXIT MENU
	END MENU

END MAIN
	
FUNCTION form_handler()	
	MENU
		ON ACTION DISPLAY
			DISPLAY BY NAME myRec.*
			
		ON ACTION "EDIT"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
				BEFORE INPUT
					CALL dialog.setActionHidden("CANCEL",TRUE)
					
		    ON ACTION "HELP"
		    	CALL onlineHelp("Gridpanel",NULL)
		    					
				ON ACTION "CANCEL"
					EXIT INPUT				
					
			END INPUT

		ON ACTION "CLEAR FORM"
			CLEAR FORM	
					
		ON ACTION "CANCEL"
			EXIT MENU

    ON ACTION "HELP"
    	CALL onlineHelp("Gridpanel",NULL)			
	END MENU
	
END FUNCTION	


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	DEFINE i SMALLINT
	
	LET myRec.f1 = "Pixel House"
	LET myRec.f2 = "Pixel House"
	LET myRec.f3 = "Pixel House"
	LET myRec.f4 = "Pixel House"		
	LET myRec.f5 = "Pixel House"		
	LET myRec.f6 = "Pixel House"		
	LET myRec.f7 = "Pixel House"
	LET myRec.f8 = "Pixel House"
	LET myRec.f9 = "Pixel House"
	LET myRec.f10 = "Pixel House"		
	LET myRec.f11 = "Pixel House"
	LET myRec.f12 = "Pixel House"
	LET myRec.f13 = "Pixel House"
	LET myRec.f14 = "Pixel House"		
	LET myRec.f15 = "Pixel House"		
	LET myRec.f16 = "Pixel House"		
	LET myRec.f17 = "Pixel House"
	LET myRec.f18 = "Pixel House"
	LET myRec.f19 = "Pixel House"
	LET myRec.f20 = "Pixel House"		
	LET myRec.f21 = "Pixel House"
	LET myRec.f22 = "Pixel House"
	LET myRec.f23 = "Pixel House"
	LET myRec.f24 = "Pixel House"		
	LET myRec.f25 = "Pixel House"		
	LET myRec.f26 = "Pixel House"		
	LET myRec.f27 = "Pixel House"
	LET myRec.f28 = "Pixel House"
	LET myRec.f29 = "Pixel House"
	LET myRec.f30 = "Pixel House"
	LET myRec.f31 = "Pixel House"
	LET myRec.f32 = "Pixel House"
	LET myRec.f33 = "Pixel House"
	LET myRec.f34 = "Pixel House"		
	LET myRec.f35 = "Pixel House"		
	LET myRec.f36 = "Pixel House"		
	LET myRec.f37 = "Pixel House"
	LET myRec.f38 = "Pixel House"
	LET myRec.f39 = "Pixel House"
	LET myRec.f40 = "Pixel House"		
	LET myRec.f41 = "Pixel House"
	LET myRec.f42 = "Pixel House"
	LET myRec.f43 = "Pixel House"
	LET myRec.f44 = "Pixel House"		
	LET myRec.f45 = "Pixel House"		
	LET myRec.f46 = "Pixel House"		
	LET myRec.f47 = "Pixel House"
	LET myRec.f48 = "Pixel House"
	LET myRec.f49 = "Pixel House"
	LET myRec.f50 = "Pixel House"
	LET myRec.f51 = "Pixel House"
	LET myRec.f52 = "Pixel House"
	LET myRec.f53 = "Pixel House"
	LET myRec.f54 = "Pixel House"		
	LET myRec.f55 = "Pixel House"		
	LET myRec.f56 = "Pixel House"		
	LET myRec.f57 = "Pixel House"
	LET myRec.f58 = "Pixel House"
	LET myRec.f59 = "Pixel House"
	LET myRec.f60 = "Pixel House"
	LET myRec.f61 = "Pixel House"
	LET myRec.f62 = "Pixel House"
	LET myRec.f63 = "Pixel House"
	LET myRec.f64 = "Pixel House"		
	LET myRec.f65 = "Pixel House"		
	LET myRec.f66 = "Pixel House"		
	LET myRec.f67 = "Pixel House"
	LET myRec.f68 = "Pixel House"
	LET myRec.f69 = "Pixel House"
	LET myRec.f70 = "Pixel House"
				
		
END FUNCTION

{

Attribute
Effect
AUTONEXT
Causes the cursor to advance automatically to the next field
CENTURY
Specifies expansion of 2-digit years in DATE and DATETIME fields
CLASS
Defines the class associated with a widget type.
COLOR
Specifies the colour or intensity of values displayed in a field
COMMENTS
Specifies a message to display on the Comment line
CONFIG
Specifies configuration options associated with widget defined for the form field.
DEFAULT
Assigns a default value to a field during data entry
DISPLAY LIKE
Assigns attributes from syscolatt table that the upscol utility creates, associating attributes with specific database columns
DOWNSHIFT
Converts to lowercase any uppercase character data
EDITOR
Synonym for the PROGRAM field attribute.
FORMAT
Formats DECIMAL, SMALLFLOAT, FLOAT, or DATE output
INCLUDE
Lists a set of acceptable values during data entry
INVISIBLE
Does not echo characters on the screen during data entry
KEY
Specifies a label to be associated with a hot-key for this field.
LEFT
The field data is left aligned, overriding alignment properties associated with the underlying datatype.
NOENTRY
Prevents the user from entering data in the field
NOPROMPT
[character mode only]. Prevents the edit of a field with the „SCROLL‟ attribute from using the prompt line to complete data where the field is full.
NOSCROLL
Limits the user input to the size of the edit field rather than the size of the underlying variable.
PASSWORD
Field data is rendered using asterisk characters, preventing the user from reading the form data.
OPTIONS
Specified miscellaneous options relevant to the class of widget associated with the field.
PICTURE
Imposes a data-entry format on CHAR or VARCHAR fields
PROGRAM
Invokes an external program to display TEXT or BYTE values
REQUIRED
Requires the user to supply some value during data entry
REVERSE
Causes values in the field to be displayed in reverse video
RIGHT
The field data is right aligned, overriding alignment properties associated with the underlying datatype.
„Hydra4GL‟ 4.5 Forms Guide
Copyright Querix (UK) Ltd
44
SCROLL Allows the user to input data in an edit field to the size of the underlying
variable rather than the length of the edit field.
UPSHIFT Converts to uppercase any lowercase character data
VALIDATE
LIKE
Validates data entry with the syscolval table that the upscol utility
creates, associating default values with specific database columns
VERIFY Requires that data be entered twice when the database is modified
WIDGET Specifies the widget type associated with this form field.
WORDWRAP Invokes a multiple-line editor in multiple-segment fields
}